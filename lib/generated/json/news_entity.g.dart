import 'package:osamasmovies/generated/json/base/json_convert_content.dart';
import 'package:osamasmovies/models/news_entity.dart';

NewsEntity $NewsEntityFromJson(Map<String, dynamic> json) {
	final NewsEntity newsEntity = NewsEntity();
	final String? createdAt = jsonConvert.convert<String>(json['createdAt']);
	if (createdAt != null) {
		newsEntity.createdAt = createdAt;
	}
	final String? titleAr = jsonConvert.convert<String>(json['title_ar']);
	if (titleAr != null) {
		newsEntity.titleAr = titleAr;
	}
	final String? titleEn = jsonConvert.convert<String>(json['title_en']);
	if (titleEn != null) {
		newsEntity.titleEn = titleEn;
	}
	final String? contentAr = jsonConvert.convert<String>(json['content_ar']);
	if (contentAr != null) {
		newsEntity.contentAr = contentAr;
	}
	final String? contentEn = jsonConvert.convert<String>(json['content_en']);
	if (contentEn != null) {
		newsEntity.contentEn = contentEn;
	}
	final String? image = jsonConvert.convert<String>(json['image']);
	if (image != null) {
		newsEntity.image = image;
	}
	final String? id = jsonConvert.convert<String>(json['id']);
	if (id != null) {
		newsEntity.id = id;
	}
	return newsEntity;
}

Map<String, dynamic> $NewsEntityToJson(NewsEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['createdAt'] = entity.createdAt;
	data['title_ar'] = entity.titleAr;
	data['title_en'] = entity.titleEn;
	data['content_ar'] = entity.contentAr;
	data['content_en'] = entity.contentEn;
	data['image'] = entity.image;
	data['id'] = entity.id;
	return data;
}