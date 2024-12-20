import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final List<String> locations = ['Italy', 'Rome', 'Milan', 'Venice', 'Florence', 'Naples'];
  final List<String> interests = ['Music', 'Dancing', 'Movies', 'Sports', 'Traveling', 'Reading'];
  final List<String> selectedInterests = [];
  String? selectedWork;
  String? income;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Dark Gradient Background
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Colors.grey[850]!, Colors.grey[700]!],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          // Signup Form with Scroll
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // "Sign UP" text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sign UP',
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(color: Colors.white),
                      ),
                      SizedBox(width: 16),
                      RichText(
                        text: TextSpan(
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(color: Colors.white),
                          children: [
                            TextSpan(
                              text: 'A',
                              style: TextStyle(color: Colors.amberAccent),
                            ),
                            TextSpan(text: ' M '),
                            TextSpan(
                              text: 'O',
                              style: TextStyle(color: Colors.amberAccent),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  // Username TextField
                  buildTextField(
                    label: 'Username',
                    prefixIcon: Icons.person,
                    obscureText: false,
                  ),
                  SizedBox(height: 20),
                  // Email TextField
                  buildTextField(
                    label: 'Email',
                    prefixIcon: Icons.email,
                    obscureText: false,
                  ),
                  SizedBox(height: 20),
                  // Password TextField
                  buildTextField(
                    label: 'Password',
                    prefixIcon: Icons.lock,
                    obscureText: true,
                  ),
                  SizedBox(height: 20),
                  // Income TextField
                  buildTextField(
                    label: 'Income (e.g., 50,000)',
                    prefixIcon: Icons.attach_money,
                    obscureText: false,
                    onChanged: (value) => income = value,
                  ),
                  SizedBox(height: 20),
                  // Geographical Location Dropdown
                  buildDropdown(
                    label: 'Geographical Location',
                    items: locations,
                  ),
                  SizedBox(height: 20),
                  // Work TextField
                  buildTextField(
                    label: 'Work (e.g., Software Developer)',
                    prefixIcon: Icons.work,
                    obscureText: false,
                    onChanged: (value) => selectedWork = value,
                  ),
                  SizedBox(height: 20),
                  // Interests Selection
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Interests',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    height: 150, // Fixed height for the interests list
                    child: ListView.builder(
                      itemCount: interests.length,
                      itemBuilder: (context, index) {
                        return CheckboxListTile(
                          title: Text(
                            interests[index],
                            style: TextStyle(color: Colors.white),
                          ),
                          value: selectedInterests.contains(interests[index]),
                          onChanged: (isSelected) {
                            setState(() {
                              if (isSelected!) {
                                selectedInterests.add(interests[index]);
                              } else {
                                selectedInterests.remove(interests[index]);
                              }
                            });
                          },
                          activeColor: Colors.amberAccent,
                          checkColor: Colors.black,
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 40),
                  // Sign Up Button
                  ElevatedButton(
                    onPressed: () {
                      print("Selected Interests: $selectedInterests");
                      print("Income: $income");
                      print("Work: $selectedWork");
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                    child: Text('Sign Up'),
                  ),
                  SizedBox(height: 20),
                  // Sign In Text Button
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Already have an account? Sign In',
                      style: TextStyle(color: Colors.amberAccent),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // TextField Builder Function
  Widget buildTextField({
    required String label,
    required IconData prefixIcon,
    required bool obscureText,
    void Function(String)? onChanged,
  }) {
    return TextField(
      obscureText: obscureText,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(prefixIcon, color: Colors.white),
        labelStyle: TextStyle(color: Colors.white),
        filled: true,
        fillColor: Colors.grey[800],
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.amberAccent),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      style: TextStyle(color: Colors.white),
    );
  }

  // Dropdown Builder Function
  Widget buildDropdown({
    required String label,
    required List<String> items,
  }) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.white),
        filled: true,
        fillColor: Colors.grey[800],
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.amberAccent),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      dropdownColor: Colors.grey[800],
      value: items.first,
      items: items.map((item) {
        return DropdownMenuItem(
          value: item,
          child: Text(
            item,
            style: TextStyle(color: Colors.white),
          ),
        );
      }).toList(),
      onChanged: (value) {},
    );
  }
}
