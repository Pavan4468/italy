import 'package:flutter/material.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[900],
          elevation: 0,
        ),
      ),
      home: UsersPage(),
    );
  }
}

class UsersPage extends StatelessWidget {
  final List<Map<String, String>> users = [
    {'name': 'Alice Johnson', 'id': '1', 'image': 'assets/raj prakrash.jpg'},
    {'name': 'John Smith', 'id': '2', 'image': 'assets/raj prakrash.jpg'},
    {'name': 'Emma Brown', 'id': '3', 'image': 'assets/raj prakrash.jpg'},
    {'name': 'Robert White', 'id': '4', 'image': 'assets/wesly.jpg'},
    {'name': 'Sophia Davis', 'id': '5', 'image': 'assets/yesu anna.jpeg'},
    {'name': 'Michael Wilson', 'id': '6', 'image': 'assets/shalalem.jpg'},
    {'name': 'Olivia Thomas', 'id': '7', 'image': 'assets/raj prakrash.jpg'},
    {'name': 'James Garcia', 'id': '8', 'image': 'assets/femal.jpg'},
    {'name': 'Isabella Martinez', 'id': '9', 'image': 'assets/shalalem.jpg'},
    {'name': 'Liam Lee', 'id': '10', 'image': 'assets/wesly.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Friends', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatPage(
                    userName: user['name']!,
                    userImage: user['image']!,
                  ),
                ),
              );
            },
            child: Card(
              color: Colors.grey[850],
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(user['image']!),
                ),
                title: Text(
                  user['name']!,
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ChatPage extends StatefulWidget {
  final String userName;
  final String userImage;

  ChatPage({required this.userName, required this.userImage});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with SingleTickerProviderStateMixin {
  final List<String> messages = [];
  final TextEditingController _controller = TextEditingController();
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void sendMessage() {
    if (_controller.text.trim().isNotEmpty) {
      setState(() {
        messages.add(_controller.text.trim());
        _controller.clear();
        _animationController.forward(from: 0.0);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CircleAvatar(
          backgroundImage: AssetImage(widget.userImage),
        ),
        title: Text(widget.userName, style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(1, 0),
                    end: Offset(0, 0),
                  ).animate(_animationController),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 16.0,
                    ),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[700],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 15.0,
                        ),
                        child: Text(
                          messages[messages.length - 1 - index],
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                      hintStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.grey[850],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                FloatingActionButton(
                  onPressed: sendMessage,
                  child: Icon(Icons.send, color: Colors.white),
                  backgroundColor: Colors.grey[800],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
