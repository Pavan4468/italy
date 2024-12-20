import 'package:flutter/material.dart';

class CoursePage extends StatefulWidget {
  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  // Sample course items with name, price (for the course), and quantity (for number of enrollments)
  final List<Map<String, dynamic>> courseItems = [
    {"name": "Course 1", "price": 100.0, "quantity": 1},
    {"name": "Course 2", "price": 200.0, "quantity": 2},
    {"name": "Course 3", "price": 150.0, "quantity": 1},
  ];

  // Remove a course from the list
  void removeItem(int index) {
    setState(() {
      courseItems.removeAt(index);
    });
  }

  // Calculate the total price of courses (sum of price * quantity)
  double get totalPrice {
    double total = 0;
    for (var item in courseItems) {
      total += item['price'] * item['quantity'];
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set background to black
      appBar: AppBar(
        title: Text('Your Courses', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        elevation: 0, // Remove shadow for a flat design
      ),
      body: courseItems.isEmpty
          ? Center(
              child: Text(
                "No courses added",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: courseItems.length,
              itemBuilder: (context, index) {
                final item = courseItems[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  color: Colors.grey[850], // Grey background for cards
                  child: ListTile(
                    contentPadding: EdgeInsets.all(15),
                    title: Text(
                      item['name'],
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    subtitle: Text(
                      'Price: \$${item['price']} x ${item['quantity']}',
                      style: TextStyle(color: Colors.grey[300]),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.redAccent),
                      onPressed: () => removeItem(index),
                    ),
                  ),
                );
              },
            ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total: \$${totalPrice.toStringAsFixed(2)}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
  onPressed: () {
    // Logic for checkout action
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Proceeding to course enrollment...")),
    );
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.blue, // Blue button color
    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20), // Padding around the button text
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30), // Rounded corners for the button
    ),
  ),
  child: Text(
    'Enroll Now',
    style: TextStyle(
      color: Colors.white, // Ensures the button text is white
      fontSize: 16, // Set the font size to ensure the text is readable
      fontWeight: FontWeight.bold, // Optionally make the text bold for emphasis
    ),
  ),
)

            ],
          ),
        ),
      ),
    );
  }
}
