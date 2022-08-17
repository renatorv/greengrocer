import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:greengrocer/src/models/item_model.dart';

class CategoryModel {
  String title;
  String id;
  @JsonKey(defaultValue: [])
  List<ItemModel>? items;
  @JsonKey(defaultValue: 0)
  int? pagination = 0;

  CategoryModel({
    required this.id,
    required this.title,
    this.items,
    this.pagination,
  });

  @override
  String toString() => 'CategoryModel(title: $title, id: $id)';

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'title': title});
    result.addAll({'id': id});
    if (items != null) {
      result.addAll({'items': items!.map((x) => x.toMap()).toList()});
    }
    if (pagination != null) {
      result.addAll({'pagination': pagination});
    }

    return result;
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      title: map['title'] ?? '',
      id: map['id'] ?? '',
      items: map['items'] != null
          ? List<ItemModel>.from(map['items']?.map((x) => ItemModel.fromMap(x)))
          : null,
      pagination: map['pagination']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source));
}
