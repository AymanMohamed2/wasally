class ShopProduct {
  String? productName;
  String? productImage;
  String? productPrice;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<dynamic>? permissions;
  String? databaseId;
  String? collectionId;

  ShopProduct({
    this.productName,
    this.productImage,
    this.productPrice,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.permissions,
    this.databaseId,
    this.collectionId,
  });

  factory ShopProduct.fromJson(Map<String, dynamic> json) => ShopProduct(
        productName: json['productName'] as String?,
        productImage: json['productImage'] as String?,
        productPrice: json['productPrice'] as String?,
        id: json['\$id'] as String?,
        createdAt: json['\$createdAt'] == null
            ? null
            : DateTime.parse(json['\$createdAt'] as String),
        updatedAt: json['\$updatedAt'] == null
            ? null
            : DateTime.parse(json['\$updatedAt'] as String),
        permissions: json['\$permissions'] as List<dynamic>?,
        databaseId: json['\$databaseId'] as String?,
        collectionId: json['\$collectionId'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'productName': productName,
        'productImage': productImage,
        'productPrice': productPrice,
        '$id': id,
        '$createdAt': createdAt?.toIso8601String(),
        '$updatedAt': updatedAt?.toIso8601String(),
        '$permissions': permissions,
        '$databaseId': databaseId,
        '$collectionId': collectionId,
      };
}
