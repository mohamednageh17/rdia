import 'package:flutter/material.dart';
import 'package:rdia/widgets/image_picker.dart';

class MainScreen extends StatelessWidget {
  final Function() onCamera;
  final Function() onGallery;

  const MainScreen(
      {super.key, required this.onCamera, required this.onGallery});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'images/logo2.png', // Replace with your logo asset path
                  height: 40,
                ),
                Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 8),
                      Image.asset(
                        'images/logo.png', // Replace with your logo asset path
                        height: 80,
                      ),
                      const SizedBox(height: 8),
                      Container(
                        margin: const EdgeInsets.only(left: 50, right: 50),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 16),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // Logo and Title
                            const Column(
                              children: [
                                SizedBox(height: 8),
                                Text(
                                  'Welcome to the RDIA stand\nat the Global Health Exhibition 2024',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 30),
                                Text(
                                  'Today, we collectively pledge to align our research efforts to achieve two ambitious national missions: reducing the incidence of non-communicable diseases and infectious diseases.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 50),
                            const Text(
                              'Be a part of the pledge!',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 50),
                            // Buttons
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _CustomButton(
                                  label: 'New User',
                                  icon: Icons.camera_alt,
                                  onTap: () {
                                    onCamera();
                                  },
                                ),
                                const SizedBox(width: 16),
                                _CustomButton(
                                  label: 'Existing User',
                                  icon: Icons.image,
                                  onTap: () {
                                    onGallery();
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const _CustomButton({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 75, 38, 140), // Start color
              Color.fromARGB(255, 107, 135, 183), // End color
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 32,
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
