import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fipe_app/models/reference.dart';
import 'package:fipe_app/models/brand.dart';

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

  Future<List<Brand>> getBrands(String type) async {
    var url = Uri.parse('$urlBase/$type/brand');
    var data = [];
    List<Brand> brands = [];
    final response = await http.get(url);

    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      brands = data.map((e) => Brand.fromJson(e)).toList();
      print(brands);
      return brands;
    }
    throw Exception('Failed to load brands');
  }
}
