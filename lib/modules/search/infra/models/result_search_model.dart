import 'dart:convert';

import 'package:flutter_clean_architecture/modules/search/domain/entities/result_search.dart';

class ResultSearchModel extends ResultSearch {
  final String img;
  final String title;
  final String content;

  ResultSearchModel({this.img, this.title, this.content});

  Map<String, dynamic> toMap() {
    return {
      'img': img,
      'title': title,
      'content': content,
    };
  }

  factory ResultSearchModel.fromMap(Map<String, dynamic> map) {
    return ResultSearchModel(
      img: map['avatar_url'],
      title: map['login'],
      content: map['content'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultSearchModel.fromJson(String source) =>
      ResultSearchModel.fromMap(json.decode(source));
}
