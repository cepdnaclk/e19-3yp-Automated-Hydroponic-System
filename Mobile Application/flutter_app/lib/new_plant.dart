import 'package:flutter/material.dart';
import 'header.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class NewPlant extends StatefulWidget {
  const NewPlant({super.key});

  @override
  _NewPlantState createState() => _NewPlantState();
}

class _NewPlantState extends State<NewPlant> {

  TextEditingController _controller = TextEditingController();
  File? _image;

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: Header(),
      body: Stack(
        children: [
          Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
              child: Text(
                "Enter a New Plant",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'Enter Plant Name',
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: TextField(
                controller: _controller,
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: 'Enter Description',
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: _getImage,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                padding: EdgeInsets.all(16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  side: BorderSide(color: Colors.black, width: 1.0),
                ),
              ),
              child: Text(
                  'Upload an Image of the Plant',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 20),
            _image != null
                ? Image.file(
              _image!,
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            )
                : SizedBox(),
          ],
        ),
          Positioned(
            left: 90,
            right: 90,
            bottom: 30,
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {

                },
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  elevation:5,
                  shadowColor: Color(0xFF0D7817),
                  backgroundColor: Color(0xFF0D7817),
                  minimumSize: const Size.fromHeight(60),
                ),
                child: Text(
                  'SUBMIT',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 3.0,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
