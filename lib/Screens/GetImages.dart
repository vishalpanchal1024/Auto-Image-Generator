import 'package:auto_image_genrations/Screens/GetFullImagesScreen.dart';
import 'package:flutter/material.dart';

import '../Api response/Image_generation_Model.dart';
import '../Api response/Response.dart';

class GetImagesScreen extends StatefulWidget {
  final description;
  final number;

  const GetImagesScreen({
    Key? key,
    this.description,
    this.number,
  }) : super(key: key);

  @override
  State<GetImagesScreen> createState() => _GetImagesScreenState();
}

class _GetImagesScreenState extends State<GetImagesScreen> {
  List imageList = [];

  ApiClientResponce client = ApiClientResponce();
  ImageGenerationModel? getimagesdata;

  Future<void>? getData() async {
    getimagesdata =
        await client.getImagesResponse(widget.description, widget.number);

    setState(() {
      getimagesdata!.data!.forEach((element) {
        imageList.add(element.url.toString());
      });
    });
  }

  @override
  void initState() {
    getData();
    // TODO: implement initState
    super.initState();
  }

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
      body: getimagesdata == null
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
              itemCount: getimagesdata!.data!.length,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              physics: const ScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GetFullImagesScreen(
                          data: getimagesdata!.data![index],
                          description: widget.description,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(16)),
                    child: Image.network(
                        getimagesdata!.data![index].url.toString()),
                  ),
                );
              },
            ),
    );
  }
}
//Image.network(getimagesdata!.data![index].url.toString())
