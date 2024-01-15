import 'package:flutter/material.dart';

class Help extends StatefulWidget {
  const Help({super.key});

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {

  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top:40.0, left: 20.0),
                child: Expanded(
                  flex: 1,
                  child: Icon(
                    Icons.fiber_manual_record,
                    size: 14,
                    //color: Color(0xFF0D7817),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:34.0, left: 20.0),
                child: Expanded(
                  flex: 6,
                  child: Text(
                    "Conatct Information",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top:22.0, left: 40.0),
                child: Expanded(
                  flex: 1,
                  child: Icon(
                    Icons.phone,
                    size: 12,
                    color: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:20.0, left: 20.0),
                child: Expanded(
                  flex: 6,
                  child: Text(
                    "+94 78 792 5012",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12.0,
                      //: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top:12.0, left: 40.0),
                child: Expanded(
                  flex: 1,
                  child: Icon(
                    Icons.mail,
                    size: 12,
                    color: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:10.0, left: 20.0),
                child: Expanded(
                  flex: 6,
                  child: Text(
                    "manager@gmail.com",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12.0,
                      //: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top:40.0, left: 20.0),
                child: Expanded(
                  flex: 1,
                  child: Icon(
                    Icons.fiber_manual_record,
                    size: 14,
                    //color: Color(0xFF0D7817),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:34.0, left: 20.0),
                child: Expanded(
                  flex: 6,
                  child: Text(
                    "Approach Directly",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
            child: TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                hintText: 'Enter your matter here ...',
                border: OutlineInputBorder(),
                hintStyle: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12,
                ),
              ),
            ),
          ),

          // Submit Button
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30.0,10.0,280.0,20.0),
              child: ElevatedButton(
                  onPressed: () {
                      // Use _descriptionController.text to access the entered text
                    //String description = _descriptionController.text;
                    // Handle submission here
                    //print('Description submitted: $description');
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    elevation: 0,
                    side: BorderSide(color: Color(0xFF0D7817)), 
                    backgroundColor: Colors.transparent, 
                    minimumSize: const Size.fromHeight(40),
                  ),
                  child: Text(
                    'SUBMIT',
                    style: TextStyle(
                      color: Color(0xFF0D7817),
                      fontFamily: 'Poppins',
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
              
            ),
          ),
        ],
      ),
    );
  }
}