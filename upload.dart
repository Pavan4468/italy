import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UploadPage extends StatefulWidget {
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  File? _postImage;
  File? _adImage;

  Future<void> _pickImage(bool isPost) async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        if (isPost) {
          _postImage = File(pickedFile.path);
        } else {
          _adImage = File(pickedFile.path);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  title: Text(
    'Upload Page',
    style: TextStyle(color: Colors.white),
  ),
  backgroundColor: Colors.black,
),
backgroundColor: Colors.black,

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Upload Post Section
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Upload Post',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      _postImage != null
                          ? Image.file(
                              _postImage!,
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            )
                          : Container(
                              height: 200,
                              color: Colors.grey[200],
                              child: Icon(
                                Icons.image,
                                size: 100,
                                color: Colors.grey,
                              ),
                            ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () => _pickImage(true),
                        child: Text('Pick Post Image'),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          // Add upload post logic here
                          if (_postImage != null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Post uploaded successfully!')),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Please select an image first.')),
                            );
                          }
                        },
                        child: Text('Upload Post'),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Upload Ads Section
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Upload Ads',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      _adImage != null
                          ? Image.file(
                              _adImage!,
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            )
                          : Container(
                              height: 200,
                              color: Colors.grey[200],
                              child: Icon(
                                Icons.image,
                                size: 100,
                                color: Colors.grey,
                              ),
                            ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () => _pickImage(false),
                        child: Text('Pick Ad Image'),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          // Add upload ad logic here
                          if (_adImage != null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Ad uploaded successfully!')),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Please select an image first.')),
                            );
                          }
                        },
                        child: Text('Upload Ad'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}