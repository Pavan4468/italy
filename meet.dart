import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserProfilesPage(),
    );
  }
}

class UserProfilesPage extends StatefulWidget {
  @override
  _UserProfilesPageState createState() => _UserProfilesPageState();
}

class _UserProfilesPageState extends State<UserProfilesPage> {
  // List of all users
  List<UserProfileData> users = [
    UserProfileData('assets/yesu anna.jpeg', 'YSR'),
    UserProfileData('assets/wesly.jpg', 'PAVAN'),
    UserProfileData('assets/shalalem.jpg', 'REDDY'),
    UserProfileData('assets/raj prakrash.jpg', 'HELLO'),
    UserProfileData('assets/johan.jpeg', 'REDDY'),
  ];

  // List of filtered users, initialized to empty to resolve the null safety issue
  late List<UserProfileData> filteredUsers;

  @override
  void initState() {
    super.initState();
    // Initially set filteredUsers to the complete users list
    filteredUsers = List.from(users);
  }

  // Function to filter users based on search input
  void filterUsers(String query) {
    setState(() {
      // If search query is empty, show all users
      filteredUsers = query.isEmpty
          ? List.from(users)
          : users
              .where((user) =>
                  user.username.toLowerCase().contains(query.toLowerCase()))
              .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text(
          'Connect People',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: filterUsers,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Search Users...',
                hintStyle: TextStyle(color: Colors.white54),
                filled: true,
                fillColor: Colors.grey[700],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredUsers.length,
              itemBuilder: (context, index) {
                return UserProfileCard(userProfile: filteredUsers[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class UserProfileCard extends StatefulWidget {
  final UserProfileData userProfile;

  const UserProfileCard({Key? key, required this.userProfile}) : super(key: key);

  @override
  _UserProfileCardState createState() => _UserProfileCardState();
}

class _UserProfileCardState extends State<UserProfileCard> {
  bool isRequestSent = false; // Track the button state

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[850],
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16), // Reduced horizontal margin
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10), // Adjusted padding
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(widget.userProfile.imagePath),
              radius: 25, // Reduced radius for smaller image
            ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.userProfile.username,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
            Spacer(),
            // Button with further reduced size and better alignment
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isRequestSent = true; // Change button state to "sent"
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: isRequestSent ? Colors.blue : Colors.grey[700], // No blue color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: Size(20, 10), // Further reduced button size
              ),
              child: Text(
                isRequestSent ? 'Request Sent' : 'Connect',
                style: TextStyle(color: Colors.white, fontSize: 10), // Smaller text size
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UserProfileData {
  final String imagePath;
  final String username;

  UserProfileData(this.imagePath, this.username);
}
