import 'package:json_annotation/json_annotation.dart';

part 'trending.g.dart';

@JsonSerializable()
class Trending {
  @JsonKey(name: 'results')
  List<Result>? results;

  Trending({this.results});

  factory Trending.fromJson(Map<String, dynamic> json) {
    return _$TrendingFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TrendingToJson(this);
}

@JsonSerializable()
class Result {
  @JsonKey(name: 'poster_path')
  String? poster_path;
  @JsonKey(name: 'original_title')
  String? original_title;
  @JsonKey(name: 'overview')
  String? overview;
  @JsonKey(name: 'backdrop_path')
  String? backdrop_path;
  @JsonKey(name: 'release_date')
  String? release_date;

  Result(
      {this.poster_path,
      this.original_title,
      this.overview,
      this.backdrop_path,
      this.release_date});

  factory Result.fromJson(Map<String, dynamic> json) {
    return _$ResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
