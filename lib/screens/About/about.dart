import 'package:flutter/material.dart';
import 'package:sistem/widgets/app_bar_widget.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarFragment(
        title: 'About',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            SizedBox(height: 20),
            Text(
              'Welcome to my app!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'I am dedicated to providing a seamless and efficient inventory management solution for businesses of all sizes. My mission is to simplify the inventory management process, helping you track your stock, manage orders, and optimize your business operations.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'With my user-friendly interface and powerful features, you can easily add, update, and track inventory items, ensuring accurate stock levels at all times.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'I believe that effective inventory management is essential for business success, and I am here to support you every step of the way. Join me on this journey and take your inventory management to the next level!',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
