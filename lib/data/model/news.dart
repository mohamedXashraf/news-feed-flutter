import 'dart:core';
import 'package:json_annotation/json_annotation.dart';
part 'news.g.dart';


@JsonSerializable()
class News {
  String? author = "";
  String? title = "";
  String? description = "";
  String? url = "";
  String? urlToImage = "";
  String? publishedAt = "";

  News();

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
  Map<String, dynamic> toJson() => _$NewsToJson(this);
}