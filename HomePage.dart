import 'package:flutter/material.dart';
import 'search.dart';
import 'profile.dart';
import 'teach.dart';
import 'meet.dart';
import 'book.dart';
import 'humanity.dart';
import 'couse.dart'; // Import CoursePage
import 'package:video_player/video_player.dart';
import 'drugs.dart';
import 'messages.dart';
import 'upload.dart'; // Import the UploadPage

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.of(context).pop(); // Close the drawer after selecting an item
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'A M O',
          style: TextStyle(color: Colors.black), // Set text color to black
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: Colors.blue),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.message, color: Colors.black),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ChatApp()), // Navigate to MessagesPage
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.black),
              title: Text('Home', style: TextStyle(color: Colors.black)),
              onTap: () => _onItemTapped(0),
            ),
            ListTile(
              leading: Icon(Icons.search, color: Colors.black),
              title: Text('Search', style: TextStyle(color: Colors.black)),
              onTap: () => _onItemTapped(1),
            ),
            ListTile(
              leading: Icon(Icons.person, color: Colors.black),
              title: Text('Profile', style: TextStyle(color: Colors.black)),
              onTap: () => _onItemTapped(2),
            ),
            ListTile(
              leading: Icon(Icons.school, color: Colors.black),
              title: Text('Video Page', style: TextStyle(color: Colors.black)),
              onTap: () => _onItemTapped(3),
            ),
            ListTile(
              leading: Icon(Icons.group, color: Colors.black),
              title: Text('Meet', style: TextStyle(color: Colors.black)),
              onTap: () => _onItemTapped(4),
            ),
            ListTile(
              leading: Icon(Icons.shopping_bag, color: Colors.black),
              title: Text('Shopping', style: TextStyle(color: Colors.black)),
              onTap: () => _onItemTapped(5),
            ),
            ListTile(
              leading: Icon(Icons.volunteer_activism, color: Colors.black),
              title: Text('Humanity', style: TextStyle(color: Colors.black)),
              onTap: () => _onItemTapped(6),
            ),
            ListTile(
              leading: Icon(Icons.healing, color: Colors.black),
              title: Text('Stop Drugs', style: TextStyle(color: Colors.black)),
              onTap: () => _onItemTapped(7),
            ),
            ListTile(
              leading: Icon(Icons.upload, color: Colors.black), // Upload icon
              title: Text('Upload', style: TextStyle(color: Colors.black)),
              onTap: () => _onItemTapped(8), // Navigate to UploadPage
            ),
            ListTile(
              leading: Icon(Icons.book, color: Colors.black),
              title: Text('Course Page', style: TextStyle(color: Colors.black)),
              onTap: () => _onItemTapped(9), // Navigate to CoursePage
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
      body: IndexedStack(
        index: _selectedIndex,
        children: <Widget>[
          HomeTab(),         // Index 0
          SearchTab(),       // Index 1
          ProfileTab(),      // Index 2
          TeachTab(),        // Index 3
          UserProfilesPage(), // Index 4
          EcommerceApp(),    // Index 5
          HumanityPage(),    // Index 6
          DrugsPage(),       // Index 7
          UploadPage(),      // Index 8
          CoursePage(),      // Index 9
        ],
      ),
    );
  }
}





class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeading('Videos'),
          Container(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                VideoContainer('assets/fibo1.mp4'),
                VideoContainer('assets/fibo2.mp4'),
                VideoContainer('assets/fibo3.mp4'),
                VideoContainer('assets/fibo4.mp4'),
                VideoContainer('assets/fibo5.mp4'),
              ],
            ),
          ),
          SectionHeading('Users'),
          Container(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                UserProfile('assets/yesu anna.jpeg', 'YSR'),
                UserProfile('assets/wesly.jpg', 'PAVAN'),
                UserProfile('assets/shalalem.jpg', 'REDDY'),
                UserProfile('assets/raj prakrash.jpg', 'HELLO'),
                UserProfile('assets/johan.jpeg', 'REDDY YS'),
              ],
            ),
          ),
          SectionHeading('Events'),
          Container(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                EventContainer('assets/hotel 3.jpg', 'Event 1', 'Details about Event 1'),
                EventContainer('assets/hotel 3.jpg', 'Event 2', 'Details about Event 2'),
                EventContainer('assets/hotel 3.jpg', 'Event 3', 'Details about Event 3'),
                EventContainer('assets/hotel 3.jpg', 'Event 4', 'Details about Event 4'),
                EventContainer('assets/hotel 3.jpg', 'Event 5', 'Details about Event 5'),
              ],
            ),
          ),
          SectionHeading('Humanity'),
          Container(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                HumanityContainer('assets/hotel 3.jpg', 'Help Needed 1'),
                HumanityContainer('assets/hotel 3.jpg', 'Help Needed 2'),
                HumanityContainer('assets/hotel 6.jpg', 'Help Needed 3'),
                HumanityContainer('assets/hotel4.jpg', 'Help Needed 4'),
              ],
            ),
          ),
          SectionHeading('Shopping'),
          Container(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ShoppingContainer('assets/hotel4.jpg', 'Item 1', 'Details about Item 1'),
                ShoppingContainer('assets/hotel4.jpg', 'Item 2', 'Details about Item 2'),
                ShoppingContainer('assets/hotel4.jpg', 'Item 3', 'Details about Item 3'),
                ShoppingContainer('assets/hotel4.jpg', 'Item 4', 'Details about Item 4'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SectionHeading extends StatelessWidget {
  final String heading;

  SectionHeading(this.heading);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        heading,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white, // Set text color to white
        ),
      ),
    );
  }
}

class VideoContainer extends StatefulWidget {
  final String videoPath;

  VideoContainer(this.videoPath);

  @override
  _VideoContainerState createState() => _VideoContainerState();
}

class _VideoContainerState extends State<VideoContainer> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        setState(() {}); // Rebuild when the video is initialized
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
 @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _isPlaying = !_isPlaying;
            _isPlaying ? _controller.play() : _controller.pause();
          });
        },
        child: Column(
          children: [
            _controller.value.isInitialized
                ? Container(
                    width: 250,
                    height: 160,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5), // Background color with opacity
                      borderRadius: BorderRadius.circular(12), // Rounded corners
                      border: Border.all(
                        color: Colors.blueAccent, // Border color
                        width: 4, // Border width
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.6), // Shadow color
                          offset: Offset(0, 2), // Shadow offset
                          blurRadius: 6, // Shadow blur radius
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12), // Ensures video corners are rounded
                      child: AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      ),
                    ),
                  )
                : Container(
                    width: 250,
                    height: 160,
                    color: Colors.black,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
            SizedBox(height: 10),
            Icon(
              _isPlaying ? Icons.pause_circle_outline : Icons.play_circle_outline,
              color: Colors.white,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}
class UserProfile extends StatelessWidget {
  final String imagePath;
  final String userName;

  UserProfile(this.imagePath, this.userName);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      width: 120,
      height: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(imagePath),
          ),
          SizedBox(height: 8),
          Text(
            userName,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class EventContainer extends StatelessWidget {
  final String imagePath;
  final String eventName;
  final String eventDetails;

  EventContainer(this.imagePath, this.eventName, this.eventDetails);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      width: 120,
      height: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 120,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 4),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    eventName,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Text(
                    eventDetails,
                    style: TextStyle(fontSize: 10, color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HumanityContainer extends StatelessWidget {
  final String imagePath;
  final String title;

  HumanityContainer(this.imagePath, this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      width: 120,
      height: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 120,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class ShoppingContainer extends StatelessWidget {
  final String imagePath;
  final String itemName;
  final String itemDetails;

  ShoppingContainer(this.imagePath, this.itemName, this.itemDetails);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      width: 120,
      height: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 120,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 4),
          Text(
            itemName,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 2),
          Text(
            itemDetails,
            style: TextStyle(fontSize: 10, color: Colors.white),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}