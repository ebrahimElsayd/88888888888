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
