import 'package:osamasmovies/generated/json/base/json_field.dart';
import 'package:osamasmovies/generated/json/news_entity.g.dart';
import 'dart:convert';

import 'package:osamasmovies/helpers/constants.dart';

@JsonSerializable()
class NewsEntity {
  String? createdAt;
  @JSONField(name: "title_ar")
  String? titleAr;
  @JSONField(name: "title_en")
  String? titleEn;
  @JSONField(name: "content_ar")
  String? contentAr;
  @JSONField(name: "content_en")
  String? contentEn;
  String? image;
  String? id;

  String? get title => Constants.isEnglish ? titleEn : titleAr;
  String? get content => Constants.isEnglish ? contentEn : contentAr;

  NewsEntity();

  factory NewsEntity.fromJson(Map<String, dynamic> json) =>
      $NewsEntityFromJson(json);

  Map<String, dynamic> toJson() => $NewsEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
