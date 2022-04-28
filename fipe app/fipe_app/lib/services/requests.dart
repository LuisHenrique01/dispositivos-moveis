import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fipe_app/models/reference.dart';

class Fetch {
  String urlBase = 'https://parallelum.com.br/fipe/api/v2';

  Future<Reference> getReference() async {
    var url = Uri.parse('$urlBase/references');
    var data = [];

    final response = await http.get(url);

    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      return Reference.fromJson(data[0]);
    }
    throw Exception('Failed to load references');
  }
}
