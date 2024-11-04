// To parse this JSON data, do
//
//     final subCategoryModel = subCategoryModelFromJson(jsonString);

import 'dart:convert';

List<SubCategoryModel> subCategoryModelFromJson(String str) => List<SubCategoryModel>.from(json.decode(str).map((x) => SubCategoryModel.fromJson(x)));

String subCategoryModelToJson(List<SubCategoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SubCategoryModel {
  int? id;
  String? category;
  String? categorylocal;
  bool? isactive;
  String? categoryimage;
  int? displayorder;
  String? startFrom;
  String? closeFrom;
  List<Subcategory>? subcategories;

  SubCategoryModel({
    this.id,
    this.category,
    this.categorylocal,
    this.isactive,
    this.categoryimage,
    this.displayorder,
    this.startFrom,
    this.closeFrom,
    this.subcategories,
  });

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) => SubCategoryModel(
        id: json["id"],
        category: json["category"],
        categorylocal: json["categorylocal"],
        isactive: json["isactive"],
        categoryimage: json["categoryimage"],
        displayorder: json["displayorder"],
        startFrom: json["start_from"],
        closeFrom: json["close_from"],
        subcategories:json["subcategories"] == null ? []: List<Subcategory>.from(json["subcategories"].map((x) => Subcategory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
        "categorylocal": categorylocal,
        "isactive": isactive,
        "categoryimage": categoryimage,
        "displayorder": displayorder,
        "start_from": startFrom,
        "close_from": closeFrom,
        "subcategories": List<dynamic>.from(subcategories?.map((x) => x.toJson()) ?? []),
      };
}

class Subcategory {
  int? id;
  String? subcategory;
  String? subcategorylocal;
  bool? isactive;
  int? categoryid;
  String? subcatimage;
  int? displayorder;

  Subcategory({
    this.id,
    this.subcategory,
    this.subcategorylocal,
    this.isactive,
    this.categoryid,
    this.subcatimage,
    this.displayorder,
  });

  factory Subcategory.fromJson(Map<String, dynamic> json) => Subcategory(
        id: json["id"],
        subcategory: json["subcategory"],
        subcategorylocal: json["subcategorylocal"],
        isactive: json["isactive"],
        categoryid: json["categoryid"],
        subcatimage: json["subcatimage"],
        displayorder: json["displayorder"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "subcategory": subcategory,
        "subcategorylocal": subcategorylocal,
        "isactive": isactive,
        "categoryid": categoryid,
        "subcatimage": subcatimage,
        "displayorder": displayorder,
      };
}
