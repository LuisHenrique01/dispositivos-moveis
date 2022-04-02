import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:albuns/models/album.dart';
import 'package:albuns/models/user.dart';

class Fetch {
  String urlBase = 'https://jsonplaceholder.typicode.com/';

  Future<List<Album>> getListAlbuns() async {
    var data = [];
    List<Album> albuns = [];
    var url = Uri.parse('${urlBase}albums');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      albuns = data.map((e) => Album.fromJson(e)).toList();
      return albuns;
    }
    throw Exception('Failed to load album');
  }

  Future<User> getUser(int id) async {
    var url = Uri.parse('${urlBase}users/$id');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    }
    throw Exception('Failed to load album');
  }
}
