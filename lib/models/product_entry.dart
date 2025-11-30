// To parse this JSON data, do
//
//     final productEntry = productEntryFromJson(jsonString);

import 'dart:convert';

List<ProductEntry> productEntryFromJson(String str) =>
    List<ProductEntry>.from(json.decode(str).map((x) => ProductEntry.fromJson(x)));

String productEntryToJson(List<ProductEntry> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductEntry {
  String id;
  String name;
  int stock;
  int price;
  String brand;
  String description;
  String category;
  dynamic thumbnail;
  int hype;
  DateTime createdAt;
  bool isFeatured;
  int? userId;

  ProductEntry({
    required this.id,
    required this.name,
    required this.stock,
    required this.price,
    required this.brand,
    required this.description,
    required this.category,
    required this.thumbnail,
    required this.hype,
    required this.createdAt,
    required this.isFeatured,
    required this.userId,
  });

  factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
        id: json["id"] ?? "",
        name: json["name"] ?? "",
        stock: json["stock"] ?? 0,
        price: json["price"] ?? 0,
        brand: json["brand"] ?? "",
        description: json["description"] ?? "",
        category: json["category"] ?? "",
        thumbnail: json["thumbnail"], // aman karena dynamic
        hype: json["hype"] ?? 0,
        createdAt: json["created_at"] == null
            ? DateTime.now()
            : DateTime.parse(json["created_at"]),
        isFeatured: json["is_featured"] ?? false,
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "stock": stock,
        "price": price,
        "brand": brand,
        "description": description,
        "category": category,
        "thumbnail": thumbnail,
        "hype": hype,
        "created_at": createdAt.toIso8601String(),
        "is_featured": isFeatured,
        "user_id": userId,
      };
}
