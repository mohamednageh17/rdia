import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rdia/screens/commitment_screen.dart';

class FillDetailsScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final XFile? image;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController positionController = TextEditingController();

  FillDetailsScreen({super.key, required this.image});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 40), // For top spacing
                  // Header
                  const Text(
                    'Please fill in your details',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  // Form Container
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Full Name Field
                          const Text(
                            'Full Name*',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 10),

                          TextFormField(
                            controller: nameController,
                            decoration: inputDecoration('', prefixText: ''),
                            style: const TextStyle(color: Colors.white),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your full name';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          // Email Field
                          const Text(
                            'Email*',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: emailController,
                            decoration: inputDecoration('', prefixText: ''),
                            style: const TextStyle(color: Colors.white),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          // Position Field
                          const Text(
                            'Position*',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: positionController,
                            decoration: inputDecoration('', prefixText: ''),
                            style: const TextStyle(color: Colors.white),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your position';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          // Phone Number Field
                          const Text(
                            'Phone Number*',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: phoneController,
                            style: const TextStyle(color: Colors.white),
                            decoration:
                                inputDecoration('', prefixText: '+966 '),
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your phone number';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 24),
                          // Confirm Button
                          GestureDetector(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                // Perform action on confirm
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CommitmentScreen(
                                      name: nameController.text,
                                      phone: phoneController.text,
                                      email: emailController.text,
                                      image: image,
                                    ),
                                  ),
                                );
                              }
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
                  const SizedBox(height: 20),
                  // Back Button
                  TextButton(
                    onPressed: () {
                      // Add back button functionality
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Back',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Top-right Logo
          Positioned(
            top: 16,
            right: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Placeholder for Health Innovation Week text
                const Text(
                  'Health Innovation Week',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 8),
                // Placeholder for RDIA logo
                Image.asset(
                  'images/logo.png', // Replace with your logo asset path
                  height: 40,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

InputDecoration inputDecoration(String hintText, {String? prefixText}) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: const TextStyle(color: Colors.white54),
    filled: true,
    fillColor: Colors.transparent, // Transparent background
    prefixText: prefixText,
    prefixStyle: const TextStyle(color: Colors.white),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10), // Rounded corners
      borderSide:
          const BorderSide(color: Colors.white, width: 1), // White border
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10), // Rounded corners
      borderSide:
          const BorderSide(color: Colors.white, width: 1), // White border
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10), // Rounded corners
      borderSide: const BorderSide(
          color: Colors.blueAccent, width: 2), // Blue border on focus
    ),
    contentPadding: const EdgeInsets.symmetric(
        vertical: 12, horizontal: 20), // Padding inside the field
  );
}
