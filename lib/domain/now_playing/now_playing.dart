import 'package:json_annotation/json_annotation.dart';



part 'now_playing.g.dart';

@JsonSerializable()
class NowPlaying {
  List<Result>? results;

  NowPlaying({this.results});

  factory NowPlaying.fromJson(Map<String, dynamic> json) {
    return _$NowPlayingFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NowPlayingToJson(this);
}

@JsonSerializable()
class Result {
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  String? overview;
  String? title;

  Result({this.backdropPath, this.overview, this.title});

  factory Result.fromJson(Map<String, dynamic> json) {
    return _$ResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
