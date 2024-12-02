import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rdia/firebase/firebase_options.dart';
import 'package:rdia/screens/main_screen.dart';
import 'package:rdia/screens/take_photo_screen.dart';
import 'package:rdia/widgets/image_picker.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase with the options for web
  await Firebase.initializeApp(
    options: firebaseOptions,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) => MainScreen(
          //   onCamera: () => takePhoto(context),
          onCamera: () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TakePhotoScreen(),
              ),
            )
          },
          onGallery: () => pickFromGallery(context),
        ),
      ),
    );
  }
}
