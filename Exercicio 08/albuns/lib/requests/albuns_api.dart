import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:albuns/models/album.dart';

Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));

  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } 
  throw Exception('Failed to load album');
}