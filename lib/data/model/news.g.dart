// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

News _$NewsFromJson(Map<String, dynamic> json) => News()
  ..author = json['author'] as String?
  ..title = json['title'] as String?
  ..description = json['description'] as String?
  ..url = json['url'] as String?
  ..urlToImage = json['urlToImage'] as String?
  ..publishedAt = json['publishedAt'] as String?;

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
      'publishedAt': instance.publishedAt,
    };
