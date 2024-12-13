class Genres {
  Genres({
      this.id, 
       this.name,});

  Genres.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    backdropPath = json['backdrop_path'];
  }
  num? id;
  String? name;
  String? backdropPath;
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}