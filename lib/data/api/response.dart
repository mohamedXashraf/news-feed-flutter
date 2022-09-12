import 'dart:core';
import 'package:json_annotation/json_annotation.dart';
import '../model/news.dart';
part 'response.g.dart';


@JsonSerializable()
class NewsResponse {
  String? status = "";
  String? source = "";
  String? sortBy = "";
  List<News>? articles = <News>[];

  NewsResponse();

  factory NewsResponse.fromJson(Map<String, dynamic> json) => _$NewsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$NewsResponseToJson(this);
}