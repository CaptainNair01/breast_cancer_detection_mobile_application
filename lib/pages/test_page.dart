// ignore_for_file: prefer_const_constructors, sort_child_properties_last
import 'dart:async';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';

File file = File("assets/images/DECA Senior Year Paper.png");

class BreastCancerPage extends StatefulWidget {
  const BreastCancerPage({Key? key}) : super(key: key);

  @override
  State<BreastCancerPage> createState() => _BreastCancerPageState();
}

class _BreastCancerPageState extends State<BreastCancerPage> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 190),
            Image.file(file),
            MaterialButton(
              onPressed: () {
                pickFile();
              },
              color: Colors.deepPurple[200],
              child: const Text("Pick File"),
            ),
            SizedBox(height: 40),
            MaterialButton(
              onPressed: () {
                sleep(Duration(seconds: 30));
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SecondRoute()),
                );
              },
              color: Colors.deepPurple[200],
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }

  void pickFile() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);

    if (result != null) {
      setState(() {
        file = File(result.files.single.path ?? "");
      });
    }
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(height: 150),
        Image.asset('assets/images/DECA Senior Year Paper.png'),
        SizedBox(height: 150),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Text(
            "Breast Cancer Detected",
            style: TextStyle(
              fontSize: 40,
            ),
          ),
        ),
        SizedBox(height: 50),
        MaterialButton(
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.deepPurple[200],
          child: const Text('Go back'),
        ),
      ]),
    );
  }
}
