// class Help extends StatelessWidget {
//   TextEditingController _descriptionController = TextEditingController();

//   Widget buildContactInfoRow(IconData icon, String text) {
//     return Row(
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(top: 12.0, left: 40.0),
//           child: Icon(
//             icon,
//             size: 12,
//             color: Colors.grey,
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(top: 10.0, left: 20.0),
//           child: Text(
//             text,
//             style: TextStyle(
//               fontFamily: 'Poppins',
//               fontSize: 12.0,
//               color: Colors.grey,
//             ),
//           ),
//         ),
//       ],
//     );
//   }

// Future<void> submitDescription(String description) async {
//     final response = await http.post(
//       Uri.parse('http://localhost:8080/api/contacts'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({
//         'name': 'Your Name', // You can replace these with actual values
//         'phone': 'Your Phone',
//         'email': 'Your Email',
//         'description': description,
//       }),
//     );

//     if (response.statusCode == 200) {
//       print('Description submitted successfully');
//     } else {
//       print('Failed to submit description. Error ${response.statusCode}');
//     }
//   }  
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           buildContactInfoRow(Icons.fiber_manual_record, "Conatct Information"),
//           buildContactInfoRow(Icons.phone, "+94 78 792 5012"),
//           buildContactInfoRow(Icons.mail, "manager@gmail.com"),
//           buildContactInfoRow(Icons.fiber_manual_record, "Approach Directly"),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
//             child: TextField(
//               controller: _descriptionController,
//               decoration: InputDecoration(
//                 hintText: 'Enter your matter here ...',
//                 border: OutlineInputBorder(),
//                 hintStyle: TextStyle(
//                   fontFamily: 'Poppins',
//                   fontSize: 12,
//                 ),
//               ),
//             ),
//           ),
//           Align(
//             alignment: Alignment.centerLeft,
//             child: Padding(
//               padding: const EdgeInsets.fromLTRB(30.0, 10.0, 0.0, 20.0),
//               child: ElevatedButton(
//                 onPressed: () {
//                   String description = _descriptionController.text;
//                   print('Description submitted: $description');
//                 },
//                 style: ElevatedButton.styleFrom(
//                   shape: const StadiumBorder(),
//                   elevation: 0,
//                   side: BorderSide(color: Color(0xFF0D7817)),
//                   backgroundColor: Colors.transparent,
//                   minimumSize: const Size.fromHeight(40),
//                 ),
//                 child: Text(
//                   'SUBMIT',
//                   style: TextStyle(
//                     color: Color(0xFF0D7817),
//                     fontFamily: 'Poppins',
//                     fontSize: 11,
//                     fontWeight: FontWeight.w600,
//                     letterSpacing: 1.0,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
