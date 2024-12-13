import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/data/api/model/popular_response/popular_response.dart';
import 'package:movies_app/data/api/model/top_rated_response/top_rated_response.dart';
import 'package:movies_app/data/api/model/upcoming_response/upcoming_response.dart';

class ApiManager {
  //https://api.themoviedb.org/3/movie/popular => for popular movies
  //https://api.themoviedb.org/3/movie/top_rated => for recommended movies
  // https://api.themoviedb.org/3/movie/upcoming => for new releases movies
  static const String _baseUrl = 'api.themoviedb.org';
  static const String _apiKey = 'ae8e4aea23b0db0dd965ab9457e0ddc8';
  static const String _popularEndPoint = '/3/movie/popular';
  static const String _reCommendedEndPoint = '/3/movie/top_rated';
  static const String _newReleasedEndPoint = '/3/movie/upcoming';

  static Future<PopularResponse> getPopularMovies() async {
    Uri url = Uri.https(_baseUrl, _popularEndPoint, {
      'api_key': _apiKey,
    });
    http.Response serverResponse = await http.get(url);
    Map<String, dynamic> json = jsonDecode(serverResponse.body);
    PopularResponse popularResponse = PopularResponse.fromJson(json);
    return popularResponse;
  }

  static Future<TopRatedResponse> getRecommendedMovies() async {
    Uri url = Uri.https(_baseUrl, _reCommendedEndPoint, {
      'api_key': _apiKey,
    });
    http.Response serverResponse = await http.get(url);
    Map<String, dynamic> json = jsonDecode(serverResponse.body);
    TopRatedResponse topRatedResponse = TopRatedResponse.fromJson(json);
    return topRatedResponse;
  }

  static Future<UpcomingResponse> getNewReleasesMovies() async {
    Uri url = Uri.https(_baseUrl, _newReleasedEndPoint, {
      'api_key': _apiKey,
    });
    http.Response serverResponse = await http.get(url);
    Map<String, dynamic> json = jsonDecode(serverResponse.body);
    UpcomingResponse upcomingResponse = UpcomingResponse.fromJson(json);
    return upcomingResponse;
  }
 //ToDo  this is for the search and catagory





}
