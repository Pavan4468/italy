import 'package:flutter/material.dart';

class SearchTab extends StatefulWidget {
  @override
  _SearchTabState createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  // Dummy user data
  final List<Map<String, String>> users = [
    {'username': 'Alice', 'profile': 'https://i.pravatar.cc/150?img=1'},
    {'username': 'Bob', 'profile': 'https://i.pravatar.cc/150?img=2'},
    {'username': 'Charlie', 'profile': 'https://i.pravatar.cc/150?img=3'},
    {'username': 'David', 'profile': 'https://i.pravatar.cc/150?img=4'},
    {'username': 'Eve', 'profile': 'https://i.pravatar.cc/150?img=5'},
    {'username': 'Frank', 'profile': 'https://i.pravatar.cc/150?img=6'},
    {'username': 'Grace', 'profile': 'https://i.pravatar.cc/150?img=7'},
    {'username': 'Hank', 'profile': 'https://i.pravatar.cc/150?img=8'},
  ];

  // Holds the search query
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    // Filter the users based on the search query
    List<Map<String, String>> filteredUsers = users
        .where((user) =>
            user['username']!.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: Colors.black, // Black background for the screen
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search screen title
            Text(
              'Search for Users',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            // Search bar
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: TextField(
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                onChanged: (query) {
                  setState(() {
                    searchQuery = query;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search user...',
                  hintStyle: TextStyle(color: Colors.grey[400]), // Hint color
                  prefixIcon: Icon(Icons.search, color: Colors.white), // Search icon color
                  filled: true,
                  fillColor: Colors.transparent,
                  contentPadding: EdgeInsets.symmetric(vertical: 15), // Padding inside the TextField
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white), // Border color when focused
                    borderRadius: BorderRadius.circular(12),
                  ),
              ),
            ),
            ),
            SizedBox(height: 30),
            // Display users (filtered or all users by default)
            Expanded(
              child: filteredUsers.isNotEmpty
                  ? ListView.builder(
                      itemCount: filteredUsers.length,
                      itemBuilder: (context, index) {
                        final user = filteredUsers[index];
                        return Card(
                          color: Colors.grey[850],
                          margin: EdgeInsets.symmetric(vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(user['profile']!),
                            ),
                            title: Text(
                              user['username']!,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            contentPadding: EdgeInsets.all(15),
                          ),
                        );
                      },
                    )
                  : Center(
                      child: Text(
                        'No user found',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
