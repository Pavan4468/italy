import 'package:flutter/material.dart';

class DrugsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stop Using Drugs'),
        backgroundColor: Colors.black,
        elevation: 0,
        foregroundColor: Colors.white, // Sets the title text color to white
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Say No to Drugs',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Drugs can have severe consequences on your health, relationships, and future. Here are some tips and resources to help you quit using drugs and take control of your life.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              _buildSectionTitle('Why Quit Drugs?'),
              _buildInfoCard(
                'assets/svg4.png', // You can replace this with an actual image
                'Drug addiction can lead to mental health issues, loss of relationships, legal troubles, and physical harm. Quitting drugs can give you a chance to rebuild your life.',
              ),
              SizedBox(height: 20),
              _buildSectionTitle('Steps to Stop Using Drugs'),
              _buildInfoCard(
                'assets/svg3.png', // You can replace this with an actual image
                '1. Accept the Problem\n'
                '2. Seek Professional Help\n'
                '3. Join Support Groups\n'
                '4. Stay Away from Triggers\n'
                '5. Focus on Healthy Habits',
              ),
              SizedBox(height: 20),
              _buildSectionTitle('Support Resources'),
              _buildInfoCard(
                'assets/svg5.png', // You can replace this with an actual image
                'If you or someone you know is struggling with drug addiction, contact local rehab centers, talk to professionals, or call a support hotline. Help is always available.',
              ),
              SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Add functionality if needed
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                  child: Text(
                    'Get Help Now',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildInfoCard(String imagePath, String description) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              imagePath,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              description,
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}