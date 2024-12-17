import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/data/api/model/Catagory_response/CatagoryDetails.dart';
import 'package:movies_app/data/api/model/Discover_Movie/MovieResponse.dart';

import '../model/Search_response/SearchResponse.dart';

class ApiManagerP3 {
  // i mean this is the last part for api  part3
  // ToDo this is For Seach and Catagory and  Discover
//https://api.themoviedb.org/3/search/movie => search
// https://api.themoviedb.org/3/genre/movie/list=> category
// https://api.themoviedb.org/3/discover/movie=> discover
  static const String _baseUrl = 'api.themoviedb.org';
  static const String _apiKey = 'bbc87f41a4d25baf582e187287c3cb0c';
  static const String _searchEndPoint = '/3/search/movie  ';
  static const String _categoryEndpoint = '/3/genre/movie/list';
  static const String _DiscoverEndPoint = '/3/discover/movie';
  static Future<SearchResponse> getSearchMovie( String query) async {
    Uri url = Uri.https(_baseUrl, _searchEndPoint, {
      'api_key': _apiKey,
    });
    http.Response serverResponse = await http.get(url);
    Map<String, dynamic> json = jsonDecode(serverResponse.body);
    SearchResponse searchResponse = SearchResponse.fromJson(json);
    return searchResponse;
  }

  static Future<CatagoryDetails> getCategory() async {
    Uri url = Uri.https(_baseUrl, _categoryEndpoint, {
      'api_key': _apiKey,
    });
    http.Response serverResponse = await http.get(url);
    Map<String, dynamic> json = jsonDecode(serverResponse.body);
    CatagoryDetails categoryDetails = CatagoryDetails.fromJson(json);
    return categoryDetails;
  }

  static Future<MovieResponse> getDiscoverMovie(num genreId) async {
    Uri url = Uri.https(_baseUrl, _DiscoverEndPoint, {
      'api_key': _apiKey,
      'with_genres': genreId.toString(),
    });
    http.Response serverResponse = await http.get(url);
    Map<String, dynamic> json = jsonDecode(serverResponse.body);
    MovieResponse movieDiscover = MovieResponse.fromJson(json);
    return movieDiscover;
  }
}
