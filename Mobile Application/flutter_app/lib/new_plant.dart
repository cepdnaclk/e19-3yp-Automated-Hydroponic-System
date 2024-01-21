//import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/controllers/plant_controller.dart';
import 'package:testapp/plant_log/plant_log.dart';
import 'package:testapp/sidebar.dart';
import 'package:testapp/static_header.dart';
import 'package:testapp/tempPlantArray.dart';



class NewPlant extends StatefulWidget {
  const NewPlant({super.key});

  @override
  State<NewPlant> createState() => _NewPlantState();
}

class _NewPlantState extends State<NewPlant> {

  TempPlantArray tempPlantArray = TempPlantArray();

  //List<String> tempPlants = ["Aloe Vera", "Cherry Tomato", "Mint", "Sunflower"];
  //List<String> tempArray = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StaticHeader(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10.0,
              ),

              Text(
                'Want to adjust plants ? ',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              
              Text(
                'Great! you\'ve come to the right place',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),

              SizedBox(
                height: 30.0,
              ),

              GetBuilder<PlantController>(builder: (plant) {
                return plant.isLoaded ? Expanded(
                child: ListView.builder(
                  
                  itemCount: plant.plantList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top:10.0),
                      child: Card(
                        elevation: 0.0,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.black, 
                                width: 0.5,          
                              ),
                            ),
                          ),
                          child: ListTile(
                            title: Text(
                              plant.plantList[index].name!,
                              style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF0D7817),
                              ),
                            ),
                            
                            trailing: InkWell(
                              onTap: () {
                                setState(() {

                                  tempPlantArray.toggleItemStatus(plant.plantList[index].id.toString());

                                  // if (tempArray.contains(plant.plantList[index].id.toString())) {
                                  //   tempArray.remove(plant.plantList[index].id.toString());
                                  // }
                                  // else {
                                  //   tempArray.add(plant.plantList[index].id.toString());
                                  // }
                                });
                              
                                print('tempPlantArray : ');
                                print(tempPlants);
                                
                              },
                              child: Container(
                                height: 40,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18.0),
                                  color: tempPlantArray.getItemStatus(plant.plantList[index].id.toString()) ? const Color.fromARGB(255, 215, 86, 77) : Color(0xFF0D7817),
                                ),
                                child: Center(
                                  child: Text(
                                    tempPlantArray.getItemStatus(plant.plantList[index].id.toString()) ? 'REMOVE' : 'ADD',
                                  style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 11,
                                        letterSpacing: 1.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                  ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                ),
              ) : CircularProgressIndicator( color: Color(0xFF0D7817));
              })

            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SideBarState(), 
            ),
          );
        },
        child: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        backgroundColor: Color(0xFF0D7817),
        shape: CircleBorder(),
        foregroundColor: Color.fromARGB(0, 25, 70, 2),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:testapp/plant_log/plant_log.dart';
// import 'package:testapp/plant_log2.dart';
// import 'package:testapp/sidebar.dart';
// import 'package:testapp/static_header.dart';
// import 'header.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';

// import 'package:flutter/material.dart';

// /// Flutter code sample for [DropdownMenu].

// const List<String> list = <String>['Aloe Vera', 'Tomato', 'Onion', 'General Case'];

// void main() => runApp(
//   const NewPlant()
//   );

// class NewPlant extends StatelessWidget {
//   const NewPlant({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(useMaterial3: true),
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: StaticHeader(),
//         body: Padding(
//           padding: const EdgeInsets.all(40.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
            
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(bottom:20.0),
//                 child: Center(
//                   child: Text(
//                     'Want to have another plant?',
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontFamily: 'Poppins',
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//               Center(
//                 child: DropdownMenuExample(),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 45.0),
//                 child: Center(
//                 child: ConstrainedBox(
//                   constraints: BoxConstraints(maxWidth: 130),
//                   child: ElevatedButton(
//                     onPressed: () {
//                       Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(builder: (context) => SideBarState()),
//                        );
//                     },
//                     style: ElevatedButton.styleFrom(
//                       shape: const StadiumBorder(),
//                       elevation: 1,
//                       shadowColor: Color(0xFF0D7817),
//                       backgroundColor: Color(0xFF0D7817),
//                       minimumSize: const Size.fromHeight(45),
//                     ),
//                     child: Text(
//                       'SUBMIT',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontFamily: 'Poppins',
//                         fontSize: 12,
//                         fontWeight: FontWeight.w600,
//                         letterSpacing: 3.0,
//                       ),
//                     ),
//                   ),
//                 ),
//                             ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class DropdownMenuExample extends StatefulWidget {
//   const DropdownMenuExample({super.key});

//   @override
//   State<DropdownMenuExample> createState() => _DropdownMenuExampleState();
// }

// class _DropdownMenuExampleState extends State<DropdownMenuExample> {
//   String dropdownValue = list.first;

//   @override
//   Widget build(BuildContext context) {
//     return DropdownMenu<String>(
//       initialSelection: list.first,
//       onSelected: (String? value) {
//         // This is called when the user selects an item.
//         setState(() {
//           dropdownValue = value!;
//         });
//       },
//       dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
//         return DropdownMenuEntry<String>(
//           value: value,
//           label: value);
//       }).toList(),
//       textStyle: TextStyle(
//         fontFamily: 'Poppins',
//         color: Color(0xFF0D7817),
//       ),
//       menuStyle: MenuStyle(

//         //fontFamily: 'Poppins',
//       ),
//     );
//   }
// }


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

