import 'package:flutter/material.dart';

class GetFullImagesScreen extends StatefulWidget {
  final description;
  final data;

  const GetFullImagesScreen({Key? key, this.data, this.description})
      : super(key: key);

  @override
  State<GetFullImagesScreen> createState() => _GetFullImagesScreenState();
}

class _GetFullImagesScreenState extends State<GetFullImagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(widget.description.toString().toUpperCase()),
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        height: 650,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.contain,
            image: NetworkImage(
              widget.data.url,
            ),
          ),
        ),
      ),
    );
  }
}
