import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:img_search_app/dto/pixabay.dart';

class PixabayApi {
  Future<List<PixaBayImg>> getApiData(String data) async {
    final response = await http.get(Uri.parse(
        'https://pixabay.com/api/?key=41486622-3152f8ed9d460f88bc72c1679&q=$data&image_type=photo&pretty=true'));
    final Map<String,dynamic> json = jsonDecode(response.body);
    final List<dynamic> jsonData = json['hits'] as List<dynamic>;
    if (jsonData == null) {
      return [];
    }

    return jsonData.map((e) => PixaBayImg.fromJson(e)).toList();
  }
}