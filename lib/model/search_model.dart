// To parse this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);

import 'dart:convert';

SearchModel searchModelFromJson(String str) => SearchModel.fromJson(json.decode(str));

String searchModelToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
  List<Result>? results;
  int? count;
  int? numPages;
  int? currentPage;
  bool? hasNext;
  bool? hasPrevious;

  SearchModel({
    this.results,
    this.count,
    this.numPages,
    this.currentPage,
    this.hasNext,
    this.hasPrevious,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        count: json["count"],
        numPages: json["num_pages"],
        currentPage: json["current_page"],
        hasNext: json["has_next"],
        hasPrevious: json["has_previous"],
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results?.map((x) => x.toJson()) ?? []),
        "count": count,
        "num_pages": numPages,
        "current_page": currentPage,
        "has_next": hasNext,
        "has_previous": hasPrevious,
      };
}

class Result {
  int? dishid;
  String? dishname;
  String? category;
  String? dirate;
  String? tarate;
  String? hdrate;
  int? backcolor;
  String? barcode;
  String? miStatus;
  String? dishnamelocal;
  String? photo;
  int? catId;
  String? rpt1;
  String? rpt2;
  String? rpt3;
  String? rpt4;
  String? rpt5;
  bool? updateflag;
  String? dirateac;
  int? displayorder;
  String? dishvideo;
  String? dishtype;
  String? calories;
  dynamic cookingtime;
  String? description;
  String? averageRating;
  bool? isWishlisted;
  dynamic? wishlistid;
  String? rate;
  bool? iscartadded;

  Result({
    this.dishid,
    this.dishname,
    this.category,
    this.dirate,
    this.tarate,
    this.hdrate,
    this.backcolor,
    this.barcode,
    this.miStatus,
    this.dishnamelocal,
    this.photo,
    this.catId,
    this.rpt1,
    this.rpt2,
    this.rpt3,
    this.rpt4,
    this.rpt5,
    this.updateflag,
    this.dirateac,
    this.displayorder,
    this.dishvideo,
    this.dishtype,
    this.calories,
    this.cookingtime,
    this.description,
    this.averageRating,
    this.isWishlisted,
    this.wishlistid,
    this.rate,
    this.iscartadded,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        dishid: json["dishid"],
        dishname: json["dishname"],
        category: json["category"],
        dirate: json["dirate"],
        tarate: json["tarate"],
        hdrate: json["hdrate"],
        backcolor: json["backcolor"],
        barcode: json["barcode"],
        miStatus: json["mi_status"],
        dishnamelocal: json["dishnamelocal"],
        photo: json["photo"],
        catId: json["cat_id"],
        rpt1: json["rpt1"],
        rpt2: json["rpt2"],
        rpt3: json["rpt3"],
        rpt4: json["rpt4"],
        rpt5: json["rpt5"],
        updateflag: json["updateflag"],
        dirateac: json["dirateac"],
        displayorder: json["displayorder"],
        dishvideo: json["dishvideo"],
        dishtype: json["dishtype"],
        calories: json["calories"],
        cookingtime: json["cookingtime"],
        description: json["description"],
        averageRating: json["average_rating"].toString(),
        isWishlisted: json["is_wishlisted"],
        wishlistid: json["wishlistid"],
        rate: json["rate"].toString(),
        iscartadded: json["iscartadded"],
      );

  Map<String, dynamic> toJson() => {
        "dishid": dishid,
        "dishname": dishname,
        "category": category,
        "dirate": dirate,
        "tarate": tarate,
        "hdrate": hdrate,
        "backcolor": backcolor,
        "barcode": barcode,
        "mi_status": miStatus,
        "dishnamelocal": dishnamelocal,
        "photo": photo,
        "cat_id": catId,
        "rpt1": rpt1,
        "rpt2": rpt2,
        "rpt3": rpt3,
        "rpt4": rpt4,
        "rpt5": rpt5,
        "updateflag": updateflag,
        "dirateac": dirateac,
        "displayorder": displayorder,
        "dishvideo": dishvideo,
        "dishtype": dishtype,
        "calories": calories,
        "cookingtime": cookingtime,
        "description": description,
        "average_rating": averageRating,
        "is_wishlisted": isWishlisted,
        "wishlistid": wishlistid,
        "rate": rate,
        "iscartadded": iscartadded,
      };
}
