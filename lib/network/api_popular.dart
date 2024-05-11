import 'dart:convert';

import 'package:flutter_application_2/models/popular_model.dart';
import 'package:http/http.dart' as http;

class ApiPopular{
    Uri uri = Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=c3223508ab5f509c706ccafb4e250755&language=es-MX&page=1'); 
    
   Future<List<PopularModel>?> getAllPopular() async {
      
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final  jsonPopular = jsonDecode(response.body)['results'] as List;
        return jsonPopular.map((popular) => PopularModel.fromMap(popular)).toList();
      }
      return null;
    }

}