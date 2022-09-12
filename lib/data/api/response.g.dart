// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsResponse _$NewsResponseFromJson(Map<String, dynamic> json) => NewsResponse()
  ..status = json['status'] as String?
  ..source = json['source'] as String?
  ..sortBy = json['sortBy'] as String?
  ..articles = (json['articles'] as List<dynamic>?)
      ?.map((e) => News.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$NewsResponseToJson(NewsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'source': instance.source,
      'sortBy': instance.sortBy,
      'articles': instance.articles,
    };
