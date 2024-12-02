import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'form_screen.dart';

class ConfirmationScreen extends StatelessWidget {
  final XFile? image;

  ConfirmationScreen({required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Confirm Photo")),
      body: FutureBuilder<Widget>(
        future: _buildImageWidget(image!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error loading image"));
          } else {
            return Column(
              children: [
                snapshot.data!,
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FormScreen(image: image),
                      ),
                    );
                  },
                  child: Text("Confirm"),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Future<Widget> _buildImageWidget(XFile image) async {
    if (kIsWeb) {
      // Web: Use Image.memory with byte data
      final Uint8List bytes = await image.readAsBytes();
      return Image.memory(bytes);
    } else {
      // Mobile/desktop: Use Image.file
      return Image.file(File(image.path));
    }
  }
}
