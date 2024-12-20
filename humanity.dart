import 'package:flutter/material.dart';
import 'details_page.dart';

class HumanityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Humanity'),
        backgroundColor: Colors.black,
        elevation: 0,
        foregroundColor: Colors.white, 
      ),
      backgroundColor: Colors.black, // Set background color of the page to black
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black, // Background color of the whole screen
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSection(
                context: context,
                title: 'Hunger',
                description: 'Millions of people around the world suffer from hunger every day. Let\'s work together to provide food for those in need.',
                imagePath: 'assets/svg10.jpg',
              ),
              _buildSection(
                context: context,
                title: 'Homelessness',
                description: 'Homelessness is a global issue affecting millions. Join hands to provide shelter and support.',
                imagePath: 'assets/svg4.png',
              ),
              _buildSection(
                context: context,
                title: 'Poverty',
                description: 'Poverty affects a significant portion of the global population. Let\'s strive to eliminate poverty and provide a better life for everyone.',
                imagePath: 'assets/svg11.jpg',
              ),
              _buildSection(
                context: context,
                title: 'Education for All',
                description: 'Education is a fundamental right. Let\'s ensure that every child has access to quality education.',
                imagePath: 'assets/svg6.png',
              ),
              _buildSection(
                context: context,
                title: 'Clean Water',
                description: 'Access to clean water is a necessity. Help us provide clean and safe drinking water to communities in need.',
                imagePath: 'assets/svg7.png',
              ),
              _buildSection(
                context: context,
                title: 'Healthcare',
                description: 'Healthcare is a human right. Let\'s provide adequate healthcare facilities and services to everyone.',
                imagePath: 'assets/svg8.png',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection({
    required BuildContext context,
    required String title,
    required String description,
    required String imagePath,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(title: title, description: description),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: Colors.grey[800], // Container color set to grey
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 180, // Adjusted image height
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Title text color set to white
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70, // Description text color set to light white
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
