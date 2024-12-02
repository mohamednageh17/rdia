import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rdia/model/user.dart';
import 'package:signature/signature.dart';
import 'package:firebase_storage/firebase_storage.dart'; // Firebase storage import
import 'package:cloud_firestore/cloud_firestore.dart'; // Firestore import

class SignatureScreen extends StatelessWidget {
  final String name, email, phone, commitment;
  final XFile? image;

  SignatureScreen({
    required this.image,
    required this.name,
    required this.email,
    required this.phone,
    required this.commitment,
  });

  final SignatureController _controller = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Please Sign in the box below',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Signature(
                      controller: _controller,
                      height: 300,
                      backgroundColor: Colors.white),
                  GestureDetector(
                    onTap: () async {
                      final signatureBytes = await _controller.toPngBytes();

                      // final String signature = base64.encode(signatureBytes);
                      final userData = UserData(
                        image: "",
                        name: name,
                        email: email,
                        phone: phone,
                        commitment: commitment,
                        signature: "",
                      );
                      saveDataToFirestore(userData);
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 16),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.deepPurple.withOpacity(0.6),
                            Colors.blueAccent.withOpacity(0.6),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text(
                          'Confirm',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future<String> uploadImageToStorage(String filePath) async {
  try {
    final Reference storageReference = FirebaseStorage.instance
        .ref()
        .child('images/${DateTime.now().millisecondsSinceEpoch}.jpg');

    // Read file as bytes
    Uint8List fileBytes = await XFile(filePath).readAsBytes();

    // Upload image as bytes
    final UploadTask uploadTask = storageReference.putData(fileBytes);

    // Wait for upload to complete
    final TaskSnapshot snapshot = await uploadTask;

    // Get the download URL
    return await snapshot.ref.getDownloadURL();
  } catch (e) {
    throw Exception("Failed to upload image: $e");
  }
}

Future<void> saveDataToFirestore(UserData userData) async {
  try {
    // Upload image first to get its URL
    String imageUrl = await uploadImageToStorage(userData.image);

    // Save user data to Firestore
    await FirebaseFirestore.instance.collection('users').add({
      'image': imageUrl,
      'name': userData.name,
      'email': userData.email,
      'phone': userData.phone,
      'commitment': userData.commitment,
      'signature': userData.signature,
    });

    print("Data saved successfully!");
  } catch (e) {
    print("Error saving data: $e");
  }
}
