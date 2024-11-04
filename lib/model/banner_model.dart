
import 'dart:convert';

List<BannerModel> displayBannerFromJson(String str) => List<BannerModel>.from(json.decode(str).map((x) => BannerModel.fromJson(x)));

String displayBannerToJson(List<BannerModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BannerModel {
  int? id;
  String? banner;
  String? status;
  String? type;

  BannerModel({
    this.id,
    this.banner,
    this.status,
    this.type,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
    id: json["id"],
    banner: json["banner"],
    status: json["status"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "banner": banner,
    "status": status,
    "type": type,
  };
}
