import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class TeachTab extends StatelessWidget {
  final List<Map<String, dynamic>> videoPaths = [
    {"path": 'assets/fibo1.mp4', "isPaid": true},
    {"path": 'assets/fibo2.mp4', "isPaid": false},
    {"path": 'assets/fibo3.mp4', "isPaid": true},
    {"path": 'assets/fibo4.mp4', "isPaid": false},
    {"path": 'assets/fibo4.mp4', "isPaid": true},
    {"path": 'assets/fibo6.mp4', "isPaid": false},
    {"path": 'assets/fibo4.mp4', "isPaid": true},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Profile',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: videoPaths.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 16.0),
            child: VideoCard(
              videoPath: videoPaths[index]['path'],
              isPaid: videoPaths[index]['isPaid'],
              title: 'Video Title ${index + 1}',
              views: '${(index + 1) * 100} views',
              uploadDate: '${index + 1} days ago',
            ),
          );
        },
      ),
    );
  }
}

class VideoCard extends StatefulWidget {
  final String videoPath;
  final String title;
  final String views;
  final String uploadDate;
  final bool isPaid;

  VideoCard({
    required this.videoPath,
    required this.title,
    required this.views,
    required this.uploadDate,
    required this.isPaid,
  });

  @override
  _VideoCardState createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        setState(() {
          _isLoading = false; // Video has finished loading
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[900],
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Video player
          GestureDetector(
            onTap: () {
              if (!widget.isPaid) {
                setState(() {
                  _isPlaying = !_isPlaying;
                  _isPlaying ? _controller.play() : _controller.pause();
                });
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("This course is locked. Please purchase to view.")),
                );
              }
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0),
                    ),
                    child: _isLoading
                        ? Center(child: CircularProgressIndicator(color: Colors.white)) // Loading indicator
                        : _controller.value.isInitialized
                            ? VideoPlayer(_controller)
                            : Image.asset(
                                'assets/FULL SONG.jpg', // Placeholder thumbnail
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                  ),
                ),
                if (!_isPlaying && !widget.isPaid)
                  Icon(
                    Icons.play_circle_outline,
                    color: Colors.white,
                    size: 50,
                  ),
                if (widget.isPaid)
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Icon(
                      Icons.lock,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(height: 8),
          // Video title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              widget.title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: 4),
          // Video metadata
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.views,
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 14,
                  ),
                ),
                Text(
                  widget.uploadDate,
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          // Add to Cart button for paid videos
          if (widget.isPaid)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ElevatedButton(
                onPressed: () {
                  // Logic for adding the video to cart
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Added to Cart")),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text('Add to Cart'),
              ),
            ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}
