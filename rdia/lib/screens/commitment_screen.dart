import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rdia/screens/signature_screen.dart';

class CommitmentScreen extends StatefulWidget {
  final String name, email, phone;
  final XFile? image;

  CommitmentScreen({
    required this.image,
    required this.name,
    required this.email,
    required this.phone,
  });

  @override
  State<CommitmentScreen> createState() => _CommitmentScreenState();
}

class _CommitmentScreenState extends State<CommitmentScreen> {
  String selectedOption = '';

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
                  // Form Container
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Plidge your commitment to shaping an innovation future generation',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 30),
                        const Text(
                          'Choose a plidge statement from below:',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedOption =
                                  'I pledge to make healthcare more accessible';
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              border: Border.all(
                                color: selectedOption ==
                                        'I pledge to make healthcare more accessible'
                                    ? Colors.blue
                                    : Colors.transparent,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              'I pledge to make healthcare more accessible',
                              style: TextStyle(
                                fontSize: 18,
                                color: selectedOption ==
                                        'I pledge to make healthcare more accessible'
                                    ? Colors.blue
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedOption =
                                  'I pledge to reduce non-communicable diseases';
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              border: Border.all(
                                color: selectedOption ==
                                        'I pledge to reduce non-communicable diseases'
                                    ? Colors.blue
                                    : Colors.transparent,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              'I pledge to reduce non-communicable diseases',
                              style: TextStyle(
                                fontSize: 18,
                                color: selectedOption ==
                                        'I pledge to reduce non-communicable diseases'
                                    ? Colors.blue
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  GestureDetector(
                    onTap: () {
                      // Perform action on confirm
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignatureScreen(
                            commitment: selectedOption,
                            name: widget.name,
                            phone: widget.phone,
                            email: widget.email,
                            image: widget.image,
                          ),
                        ),
                      );
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
