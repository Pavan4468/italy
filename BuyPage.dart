import 'package:flutter/material.dart';

class BuyPage extends StatelessWidget {
  final String title;
  final String author;
  final String imagePath;

  BuyPage({
    required this.title,
    required this.author,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buy Book'),
        backgroundColor: Colors.blueAccent,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                imagePath,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Text(
              title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(
              author,
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey[400],
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Select Payment Method',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            PaymentOption(
              imagePath: 'assets/credit-card.png', // Replace with your PayPal image
              title: 'PayPal',
            ),
            SizedBox(height: 10),
            PaymentOption(
              imagePath: 'assets/google-pay.png', // Replace with your credit card image
              title: 'Credit/Debit Card',
            ),
            SizedBox(height: 10),
            PaymentOption(
              imagePath: 'assets/social.png', // Replace with your Google Pay image
              title: 'Google Pay',
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle the purchase action here
              },
              style: ElevatedButton.styleFrom(
                 backgroundColor: Colors.deepPurple,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: TextStyle(fontSize: 18),
              ),
              child: Text('Complete Purchase'),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentOption extends StatelessWidget {
  final String imagePath;
  final String title;

  PaymentOption({
    required this.imagePath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            imagePath,
            height: 40,
            width: 40,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        trailing: Icon(
          Icons.check_circle,
          color: Colors.green,
        ),
        onTap: () {
          // Handle payment method selection
        },
      ),
    );
  }
}