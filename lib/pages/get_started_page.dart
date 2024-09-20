import 'package:flutter/material.dart';
import 'login_page.dart'; // Import your LoginPage

class GetStartedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Started'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Icon at the center
            Icon(
              Icons.local_laundry_service,
              size: 100,
              color: Colors.blueAccent,
            ),
            SizedBox(height: 20),

            // Welcome Text
            Text(
              'Welcome to Laundry Service!',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),

            // Introduction Text
            Text(
              'Get started by signing in or creating a new account.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 18,
                    color: Colors.grey[600],
                  ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),

            // Sign In Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              child: Text('Sign In'),
            ),
            SizedBox(height: 20),

            // Sign Up Button
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          LoginPage()), // Add your Sign Up Page here
                );
              },
              child: Text(
                'Create an account',
                style: TextStyle(color: Colors.blueAccent, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
