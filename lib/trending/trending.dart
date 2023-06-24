import 'package:json_annotation/json_annotation.dart';

part 'trending.g.dart';

@JsonSerializable()
class Trending {
  List<Result>? results;

  Trending({this.results});

  factory Trending.fromJson(Map<String, dynamic> json) {
    return _$TrendingFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TrendingToJson(this);
}
@JsonSerializable()
class Result {
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;

  Result({this.backdropPath});

  factory Result.fromJson(Map<String, dynamic> json) {
    return _$ResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}