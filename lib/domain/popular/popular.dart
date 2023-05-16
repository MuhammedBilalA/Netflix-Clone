import 'package:json_annotation/json_annotation.dart';

part 'popular.g.dart';

@JsonSerializable()
class Popular {
  List<Result>? results;

  Popular({this.results});

  factory Popular.fromJson(Map<String, dynamic> json) {
    return _$PopularFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PopularToJson(this);
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
