// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Search _$SearchFromJson(Map<String, dynamic> json) => Search(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchToJson(Search instance) => <String, dynamic>{
      'results': instance.results,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      backdropPath: json['backdrop_path'] as String?,
      posterPath: json['poster_path'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'backdrop_path': instance.backdropPath,
      'poster_path': instance.posterPath,
      'title': instance.title,
    };
