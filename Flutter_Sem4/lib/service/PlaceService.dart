import 'dart:convert';
import 'package:http/http.dart' as http;
import '../data/model/PlaceModel.dart';
import 'api_constants.dart';

class PlaceService {
  static Future<List<PlaceModel>> fetchPlace() async {
    final response = await http
        .get(Uri.parse('${ApiConstants.baseUrl}${ApiConstants.placeList}'));

    if (response.statusCode == 200) {
      final List<dynamic> placeJson =
      json.decode(utf8.decode(response.bodyBytes))['data'];
      return placeJson.map((json) => PlaceModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load place');
    }
  }
}
