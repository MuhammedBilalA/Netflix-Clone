import 'package:json_annotation/json_annotation.dart';



part 'up_coming.g.dart';

@JsonSerializable()
class UpComing {
	List<Result>? results;

	UpComing({this.results});

	factory UpComing.fromJson(Map<String, dynamic> json) {
		return _$UpComingFromJson(json);
	}

	Map<String, dynamic> toJson() => _$UpComingToJson(this);
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