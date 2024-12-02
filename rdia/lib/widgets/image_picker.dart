import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rdia/screens/confirmation_screen.dart';

final ImagePicker _picker = ImagePicker();

Future<void> takePhoto(BuildContext context) async {
  final XFile? image = await _picker.pickImage(source: ImageSource.camera);
  if (image != null) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ConfirmationScreen(image: image),
      ),
    );
  }
}

Future<void> pickFromGallery(BuildContext context) async {
  final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
  if (image != null) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ConfirmationScreen(image: image),
      ),
    );
  }
}
