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

  Result({
    this.poster_path,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return _$ResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
