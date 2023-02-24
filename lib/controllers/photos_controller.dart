import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List<Map<String, dynamic>>> getPhotos(int count) async {
  List<Map<String, dynamic>> photos = [];

  try {
    var response = await http.get(Uri.https('api.unsplash.com', '/photos', {
      'client_id': 'YOUR_API_KEY',
      'page': '1',
      'per_page': '$count',
      'order_by': 'latest'
    }));

    if (response.statusCode == 200) {
      List<dynamic> bodyResponse = jsonDecode(response.body);

      for (var element in bodyResponse) {
        photos.add(element as Map<String, dynamic>);
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  } catch (e) {
    print(e);
  }

  return photos;
}
