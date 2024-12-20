import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Background color of the profile screen
       appBar: AppBar(
        backgroundColor: Colors.black, // Background color for the AppBar
        title: Align(
          alignment: Alignment.centerLeft, // Aligns the title to the left
          child: Text(
            'Profile',
            style: TextStyle(
              color: Colors.white, // White color for text
              fontSize: 24,        // Adjust font size as needed
              fontWeight: FontWeight.bold, // Bold font weight
            ),
          ),
        ),
        elevation: 0, // Removes shadow
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile picture
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('assets/raj prakrash.jpg'), // Replace with your profile picture asset
              backgroundColor: Colors.grey,
            ),
            SizedBox(height: 16),
            // Profile name
            Text(
              'John Doe', // Replace with user name
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            // Profile bio
            Text(
              'Flutter Developer | Tech Enthusiast', // Replace with user bio
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 16,
              ),
            ),
            SizedBox(height: 30),
            // Profile information cards
            Column(
              children: [
                ProfileInfoCard(
                  icon: Icons.email,
                  title: 'Email',
                  value: 'johndoe@example.com', // Replace with user email
                ),
                ProfileInfoCard(
                  icon: Icons.phone,
                  title: 'Phone',
                  value: '+123 456 7890', // Replace with user phone number
                ),
                ProfileInfoCard(
                  icon: Icons.location_on,
                  title: 'Location',
                  value: 'New York, USA', // Replace with user location
                ),
                // Add more ProfileInfoCard widgets here as needed
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileInfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  ProfileInfoCard({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[850], // Dark grey card background
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: Colors.white),
        title: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          value,
          style: TextStyle(color: Colors.grey[400]),
        ),
        contentPadding: EdgeInsets.all(16),
      ),
    );
  }
}