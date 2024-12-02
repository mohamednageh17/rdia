import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'signature_screen.dart'; // Import SignatureScreen

class FormScreen extends StatefulWidget {
  final XFile? image;

  FormScreen({required this.image});

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  String name = '', email = '', phone = '', commitment = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Fill Details")),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Name'),
              onChanged: (value) => name = value,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Email'),
              onChanged: (value) => email = value,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Phone'),
              onChanged: (value) => phone = value,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Commitment'),
              onChanged: (value) => commitment = value,
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignatureScreen(
                        image: widget.image,
                        name: name,
                        email: email,
                        phone: phone,
                        commitment: commitment,
                      ),
                    ),
                  );
                }
              },
              child: Text("Next"),
            ),
          ],
        ),
      ),
    );
  }
}
