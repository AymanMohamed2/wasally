import 'shop_product.dart';

class ShopCategory {
  String? categoryName;
  String? categoryImage;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<dynamic>? permissions;
  List<ShopProduct>? shopProducts;
  String? databaseId;
  String? collectionId;

  ShopCategory({
    this.categoryName,
    this.categoryImage,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.permissions,
    this.shopProducts,
    this.databaseId,
    this.collectionId,
  });

  factory ShopCategory.fromJson(Map<String, dynamic> json) => ShopCategory(
        categoryName: json['categoryName'] as String?,
        categoryImage: json['categoryImage'] as String?,
        id: json['\$id'] as String?,
        createdAt: json['\$createdAt'] == null
            ? null
            : DateTime.parse(json['\$createdAt'] as String),
        updatedAt: json['\$updatedAt'] == null
            ? null
            : DateTime.parse(json['\$updatedAt'] as String),
        permissions: json['\$permissions'] as List<dynamic>?,
        shopProducts: (json['shopProducts'] as List<dynamic>?)
            ?.map((e) => ShopProduct.fromJson(e as Map<String, dynamic>))
            .toList(),
        databaseId: json['\$databaseId'] as String?,
        collectionId: json['\$collectionId'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'categoryName': categoryName,
        'categoryImage': categoryImage,
        '$id': id,
        '$createdAt': createdAt?.toIso8601String(),
        '$updatedAt': updatedAt?.toIso8601String(),
        '$permissions': permissions,
        'shopProducts': shopProducts?.map((e) => e.toJson()).toList(),
        '$databaseId': databaseId,
        '$collectionId': collectionId,
      };
}
