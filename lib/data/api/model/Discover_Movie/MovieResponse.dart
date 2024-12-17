import 'Results.dart';

class MovieResponse {
  MovieResponse({
    this.success,
    this.code,
    this.massage,
    this.page,
      this.results, 
      this.totalPages, 
      this.totalResults,});

  MovieResponse.fromJson(dynamic json) {
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
    success = json['success'];
    code = json['status_code'];
    massage = json['status_message'];
  }
  num? page;
  List<Results>? results;
  num? totalPages;
  num? totalResults;
  num? code;
  String? massage;
  bool? success;
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    map['total_pages'] = totalPages;
    map['total_results'] = totalResults;
    return map;
  }

}