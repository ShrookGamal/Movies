import '../popular_response/result.dart';
import 'dates.dart';

class UpcomingResponse {
  UpcomingResponse({
    this.success,
    this.code,
    this.massage,
    this.dates,
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  UpcomingResponse.fromJson(dynamic json) {
    dates = json['dates'] != null ? Dates.fromJson(json['dates']) : null;
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Result.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
    success = json['success'];
    code = json['status_code'];
    massage = json['status_message'];
  }

  Dates? dates;
  num? page;
  List<Result>? results;
  num? totalPages;
  num? totalResults;
  num? code;
  String? massage;
  bool? success;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (dates != null) {
      map['dates'] = dates?.toJson();
    }
    map['page'] = page;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    map['total_pages'] = totalPages;
    map['total_results'] = totalResults;
    return map;
  }
}
