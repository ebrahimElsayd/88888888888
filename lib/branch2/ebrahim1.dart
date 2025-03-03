// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: AddGymScreen(),
//     );
//   }
// }
//
// class AddGymScreen extends StatefulWidget {
//   @override
//   _AddGymScreenState createState() => _AddGymScreenState();
// }
// //coomet
// class _AddGymScreenState extends State<AddGymScreen> {
//   final Map<String, File?> _uploadedFiles = {
//     "Gym Operating License": null,
//     "ID or Passport of Owner": null,
//     "Ownership Contract": null,
//     "Tax Registration": null,
//   };
//
//   bool _validate = false;
//
//   Future<void> _pickFile(String fieldName) async {
//     final pickedFile = await ImagePicker().pickImage(
//       source: ImageSource.gallery,
//     );
//     if (pickedFile != null) {
//       setState(() {
//         _uploadedFiles[fieldName] = File(pickedFile.path);
//       });
//     }
//   }
//
//   void _validateAndProceed() {
//     setState(() {
//       _validate = true;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {}),
//         title: Text("Add Gym"),
//         actions: [
//           CircleAvatar(backgroundImage: AssetImage("assets/profile.png")),
//           SizedBox(width: 10),
//           Icon(Icons.notifications),
//           SizedBox(width: 10),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Basic Gym Information",
//               style: TextStyle(fontSize: 16, color: Colors.grey),
//             ),
//             SizedBox(height: 10),
//             _buildTabBar(),
//             SizedBox(height: 20),
//
//
//             Expanded(
//               child: ListView(
//                 children: [
//                   _buildMandatoryFields(),
//                   SizedBox(height: 20),
//                   _buildOptionalFields(),
//                 ],
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 TextButton(
//                   onPressed: () {},
//                   child: Row(
//                     children: [
//                       Icon(Icons.arrow_back),
//                       SizedBox(width: 5),
//                       Text("Back"),
//                     ],
//                   ),
//                 ),
//                 ElevatedButton(
//                   onPressed: _validateAndProceed,
//                   style: ElevatedButton.styleFrom(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   child: Row(
//                     children: [
//                       Text("Next"),
//                       SizedBox(width: 5),
//                       Icon(Icons.arrow_forward),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//branch2
