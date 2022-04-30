import 'dart:convert';
import 'package:fipe_app/models/model.dart';
import 'package:fipe_app/models/reference.dart';
import 'package:fipe_app/models/brand.dart';
import 'package:http/http.dart' as http;

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
    var url = Uri.parse('$urlBase/$type/brands');
    var data = [];
    List<Brand> brands = [];
    final response = await http.get(url);
    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      brands = data.map((e) => Brand.fromJson(e)).toList();
      return brands;
    }
    throw Exception('Failed to load brands');
  }

  Future<List<Model>> getModels(String type, String brand) async {
    var url = Uri.parse('$urlBase/$type/brands/$brand/models');
    var data = [];
    List<Model> models = [];
    final response = await http.get(url);
    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      models = data.map((e) => Model.fromJson(e)).toList();
      return models;
    }
    print('Falhou a request de Models');
    throw Exception('Faeled to load models');
  }
}
