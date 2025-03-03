import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AddGymScreen(),
    );
  }
}

class AddGymScreen extends StatefulWidget {
  @override
  _AddGymScreenState createState() => _AddGymScreenState();
}


class _AddGymScreenState extends State<AddGymScreen> {
  final Map<String, File?> _uploadedFiles = {
    "Gym Operating License": null,
    "ID or Passport of Owner": null,
    "Ownership Contract": null,
    "Tax Registration": null,
  };

  bool _validate = false;

  Future<void> _pickFile(String fieldName) async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        _uploadedFiles[fieldName] = File(pickedFile.path);
      });
    }
  }

  void _validateAndProceed() {
    setState(() {
      _validate = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {}),
        title: Text("Add Gym"),
        actions: [
          CircleAvatar(backgroundImage: AssetImage("assets/profile.png")),
          SizedBox(width: 10),
          Icon(Icons.notifications),
          SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Basic Gym Information",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 10),
            _buildTabBar(),
            SizedBox(height: 20),


            Expanded(
              child: ListView(
                children: [
                  _buildMandatoryFields(),
                  SizedBox(height: 20),
                  _buildOptionalFields(),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(Icons.arrow_back),
                      SizedBox(width: 5),
                      Text("Back"),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: _validateAndProceed,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Row(
                    children: [
                      Text("Next"),
                      SizedBox(width: 5),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildTab("Gym Info"),
        _buildTab("Required Documents"),
        _buildTab("Gym Features"),
      ],
    );
  }

  Widget _buildTab(String title, {bool isSelected = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor: isSelected ? Colors.black : Colors.white,
          foregroundColor: isSelected ? Colors.white : Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: Colors.black),
          ),
        ),
        child: Text(title),
      ),
    );
  }

  Widget _buildMandatoryFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Mandatory Fields",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text("All mandatory documents must be clear, valid, and up-to-date."),
        SizedBox(height: 10),
        _buildUploadField("Gym Operating License"),
        _buildUploadField("ID or Passport of Owner"),
        _buildUploadField("Ownership Contract"),
      ],
    );
  }

  Widget _buildOptionalFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Optional Field",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          "Optional documents are not required but can enhance approval time.",
        ),
        SizedBox(height: 5),
        _buildUploadField("Tax Registration", isMandatory: false),
      ],
    );
  }


  Widget _buildUploadField(String label, {bool isMandatory = true}) {
    bool isError = isMandatory && _validate && _uploadedFiles[label] == null;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => _pickFile(label),
            child: Container(


              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(
                  color: isError ? Colors.red : Colors.grey,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child:
              _uploadedFiles[label] != null
                  ? Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(label,
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight
                              .w400,),),
                        Divider(),
                        Container(
                          //   alignment: Alignment.center,
                          constraints: BoxConstraints(
                              minHeight: 119,
                              minWidth: 400,
                              maxHeight: 320,
                              maxWidth: 500
                          ),
                          child: Image.file(

                            _uploadedFiles[label]!,

                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 27,
                    right: 1,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _uploadedFiles[label] = null;
                        });
                      },
                      child: CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.red,
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              )
                  : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        label,
                        style: TextStyle(
                          fontSize: 16,
                          color: isError ? Colors.red : Colors.black,
                        ),
                      ),
                      Text(
                        "(Choose filehgdytdy yd65tydc)",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () => _pickFile(label),
                    child: Text("Choose file"),
                  ),
                ],
              ),
            ),
          ),
          if (isError)
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                "You must add this file",
                style: TextStyle(color: Colors.red, fontSize: 12),
              ),
            ),
        ],
      ),
    );
  }
}
