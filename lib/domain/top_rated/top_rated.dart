import 'package:json_annotation/json_annotation.dart';

part 'top_rated.g.dart';

@JsonSerializable()
class TopRated {
  List<Result>? results;

  TopRated({this.results});

  factory TopRated.fromJson(Map<String, dynamic> json) {
    return _$TopRatedFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TopRatedToJson(this);
}

@JsonSerializable()
class Result {
  @JsonKey(name: 'poster_path')
  String? posterPath;

  Result({this.posterPath});

  factory Result.fromJson(Map<String, dynamic> json) {
    return _$ResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
