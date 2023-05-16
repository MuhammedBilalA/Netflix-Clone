import 'package:json_annotation/json_annotation.dart';


part 'search.g.dart';

@JsonSerializable()
class Search {
  List<Result>? results;

  Search({this.results});

  factory Search.fromJson(Map<String, dynamic> json) {
    return _$SearchFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchToJson(this);
}

@JsonSerializable()
class Result {
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  String? title;

  Result({this.backdropPath, this.posterPath, this.title});

  factory Result.fromJson(Map<String, dynamic> json) {
    return _$ResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}