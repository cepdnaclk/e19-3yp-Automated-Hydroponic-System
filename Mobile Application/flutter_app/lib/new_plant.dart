import 'package:flutter/material.dart';
import 'package:testapp/static_header.dart';
import 'header.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

// class NewPlant extends StatefulWidget {
//   const NewPlant({Key? key}) : super(key: key);

//   @override
//   _NewPlantState createState() => _NewPlantState();
// }

// class _NewPlantState extends State<NewPlant> {
//   TextEditingController _nameController = TextEditingController();
//   TextEditingController _descriptionController = TextEditingController();
//   File? _image;
//   bool _uploadingImage = false;

//   Future<void> _getImage() async {
//     setState(() {
//       _uploadingImage = true; // Set indicator to true while uploading
//     });

//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);

//     setState(() {
//       _uploadingImage = false; // Set indicator back to false after upload attempt
//       if (pickedFile != null) {
//         _image = File(pickedFile.path);
//       } else {
//         print('No image selected.');
//       }
//     });
//   }

//   String? _validatePlantName(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Plant name is required';
//     }
//     return null;
//   }

//   String? _validateDescription(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Description is required';
//     }
//     return null;
//   }

//   Widget buildTextField({
//     required TextEditingController controller,
//     required String labelText,
//     required String? Function(String?)? validator,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
//       child: TextField(
//         controller: controller,
//         decoration: InputDecoration(
//           labelText: labelText,
//           errorText: validator != null ? validator(controller.text) : null,
//           border: OutlineInputBorder(),
//           labelStyle: TextStyle(
//             fontFamily: 'Poppins',
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: StaticHeader(),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Padding(
//               padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
//               child: Text(
//                 "Enter a New Plant",
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.w600,
//                   fontFamily: 'Poppins',
//                 ),
//               ),
//             ),
//             buildTextField(
//               controller: _nameController,
//               labelText: 'Enter Plant Name',
//               validator: _validatePlantName,
//             ),
//             buildTextField(
//               controller: _descriptionController,
//               labelText: 'Enter Description',
//               validator: _validateDescription,
//             ),
//             SizedBox(height: 20),
//             ConstrainedBox(
//               constraints: BoxConstraints(maxWidth: 350),
//               child: Padding(
//                 padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
//                 child: ElevatedButton(
//                   onPressed: _uploadingImage ? null : _getImage,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.white,
//                     foregroundColor: Colors.black,
//                     padding: EdgeInsets.all(16.0),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(5.0),
//                       side: BorderSide(color: Colors.black, width: 1.0),
//                     ),
//                   ),
//                   child: Text(
//                     'Upload an Image of the Plant',
//                     style: TextStyle(
//                       fontFamily: 'Poppins',
//                       fontSize: 16,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             _uploadingImage ? CircularProgressIndicator() : SizedBox(),
//             SizedBox(height: 20),
//             _image != null
//                 ? Image.file(
//                     _image!,
//                     height: 200,
//                     width: 200,
//                     fit: BoxFit.cover,
//                   )
//                 : SizedBox(),
//             SizedBox(height: 20),
//             Center(
//               child: ConstrainedBox(
//                 constraints: BoxConstraints(maxWidth: 200),
//                 child: ElevatedButton(
//                   onPressed: () {
//                     // Handle submission here
//                   },
//                   style: ElevatedButton.styleFrom(
//                     shape: const StadiumBorder(),
//                     elevation: 5,
//                     shadowColor: Color(0xFF0D7817),
//                     backgroundColor: Color(0xFF0D7817),
//                     minimumSize: const Size.fromHeight(60),
//                   ),
//                   child: Text(
//                     'SUBMIT',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontFamily: 'Poppins',
//                       fontSize: 15,
//                       fontWeight: FontWeight.w600,
//                       letterSpacing: 3.0,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//
import 'package:flutter/material.dart';

/// Flutter code sample for [DropdownMenu].

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

void main() => runApp(const DropdownMenuApp());

class DropdownMenuApp extends StatelessWidget {
  const DropdownMenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(title: const Text('DropdownMenu Sample')),
        body: const Center(
          child: DropdownMenuExample(),
        ),
      ),
    );
  }
}

class DropdownMenuExample extends StatefulWidget {
  const DropdownMenuExample({super.key});

  @override
  State<DropdownMenuExample> createState() => _DropdownMenuExampleState();
}

class _DropdownMenuExampleState extends State<DropdownMenuExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: list.first,
      onSelected: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }
}
