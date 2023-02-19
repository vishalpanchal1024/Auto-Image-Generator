import 'dart:convert';

import 'package:http/http.dart' as http;

import 'Image_generation_Model.dart';

class ApiClientResponce {
  String token = 'Bearer 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';

  Future<ImageGenerationModel>? getImagesResponse(
      String description, int numberOfImages) async {
    Uri url = Uri.parse('https://api.openai.com/v1/images/generations');
    var response = await http.post(url,
        headers: {'Content-Type': 'application/json', 'Authorization': token},
        body: jsonEncode(
            {"n": numberOfImages, "size": "1024x1024", "prompt": description}));
    var body = await jsonDecode(response.body);
    ImageGenerationModel users = ImageGenerationModel.fromJson(body);

    return users;
  }
}
