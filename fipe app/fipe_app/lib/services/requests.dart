import 'dart:convert';
import 'package:fipe_app/models/info.dart';
import 'package:fipe_app/models/model.dart';
import 'package:fipe_app/models/reference.dart';
import 'package:fipe_app/models/brand.dart';
import 'package:fipe_app/models/years.dart';
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

  Future<List<Years>> getYears(String type, String brand, String model) async {
    var url = Uri.parse('$urlBase/$type/brands/$brand/models/$model/years');
    var data = [];
    List<Years> years = [];
    final response = await http.get(url);
    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      years = data.map((e) => Years.fromJson(e)).toList();
      return years;
    }
    print('Falhou a request de Years');
    throw Exception('Faeled to load years');
  }

  Future<Info> getInfos(
      String type, String brand, String model, String year) async {
    var url =
        Uri.parse('$urlBase/$type/brands/$brand/models/$model/years/$year');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return Info.fromJson(data);
    }
    print('Falhou a request de infos');
    throw Exception('Faeled to load infos');
  }
}
