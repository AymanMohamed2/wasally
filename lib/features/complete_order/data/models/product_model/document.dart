import 'package:equatable/equatable.dart';

class Document extends Equatable {
  final String? shopid;
  final String? productName;
  final String? productDescreption;
  final String? productImage;
  final String? productPrice;
  final String? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<dynamic>? permissions;
  final String? collectionId;
  final String? databaseId;

  const Document({
    this.shopid,
    this.productName,
    this.productDescreption,
    this.productImage,
    this.productPrice,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.permissions,
    this.collectionId,
    this.databaseId,
  });

  factory Document.fromJson(Map<String, dynamic> json) => Document(
        shopid: json['shopid'] as String?,
        productName: json['productName'] as String?,
        productDescreption: json['productDescreption'] as String?,
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
        collectionId: json['\$collectionId'] as String?,
        databaseId: json['\$databaseId'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'shopid': shopid,
        'productName': productName,
        'productDescreption': productDescreption,
        'productImage': productImage,
        'productPrice': productPrice,
        '$id': id,
        '$createdAt': createdAt?.toIso8601String(),
        '$updatedAt': updatedAt?.toIso8601String(),
        '$permissions': permissions,
        '$collectionId': collectionId,
        '$databaseId': databaseId,
      };

  @override
  List<Object?> get props {
    return [
      shopid,
      productName,
      productDescreption,
      productImage,
      productPrice,
      id,
      createdAt,
      updatedAt,
      permissions,
      collectionId,
      databaseId,
    ];
  }
}
