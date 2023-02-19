import 'package:auto_image_genrations/Screens/GetImages.dart';
import 'package:flutter/material.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  var controller = TextEditingController();
  var NumberController = TextEditingController();

  @override
  void dispose() {
    controller;
    NumberController;
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff161618),
      appBar: AppBar(
        title: Text('Auto Image Genretor'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
            child: TextField(
              controller: controller,
              obscureText: false,
              decoration: InputDecoration(
                isDense: true,
                hintText: 'Enter Image Description',
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.all(8),
                hintStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff161618),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(1),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Color(
                      0xffCDF0FF,
                    ),
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Color(
                      0xffCDF0FF,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
            ),
            child: TextField(
              controller: NumberController,
              keyboardType: TextInputType.number,
              obscureText: false,
              decoration: InputDecoration(
                isDense: true,
                hintText: 'Enter Number of image',
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.all(8),
                hintStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff161618),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(1),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Color(
                      0xffCDF0FF,
                    ),
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Color(
                      0xffCDF0FF,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 35.0,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(345, 35),
              backgroundColor: const Color(
                0xff8b3dff,
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => GetImagesScreen(
                        description: controller.text,
                        number: int.parse(NumberController.text),
                      )),
                ),
              );
            },
            child: const Text(
              'Submit',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
