import 'package:equatable/equatable.dart';

class Document extends Equatable {
  final String? phone;
  final String? categoryName;
  final String? deliveryName;
  final String? shopName;
  final String? order;
  final String? price;
  final dynamic latitude;
  final dynamic longtude;
  final String? orderState;
  final String? deliveryPhone;
  final String? orderImage;
  final String? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<dynamic>? permissions;
  final String? collectionId;
  final String? databaseId;

  const Document({
    this.deliveryName,
    this.orderImage,
    this.phone,
    this.categoryName,
    this.shopName,
    this.order,
    this.price,
    this.latitude,
    this.longtude,
    this.orderState,
    this.deliveryPhone,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.permissions,
    this.collectionId,
    this.databaseId,
  });

  factory Document.fromJson(Map<String, dynamic> json) => Document(
        phone: json['phone'] as String?,
        categoryName: json['categoryName'] as String?,
        orderImage:
            json['orderImage'] == null ? null : json['orderImage'] as String?,
        shopName: json['shopName'] as String?,
        order: json['order'] as String?,
        price: json['price'] == null ? null : json['price'] as String?,
        latitude: json['latitude'] as dynamic,
        longtude: json['longtude'] as dynamic,
        orderState: json['orderState'] as String,
        deliveryPhone: json['deliveryPhone'] == null
            ? null
            : json['deliveryPhone'] as String,
        deliveryName: json['delivery_name'] == null
            ? null
            : json['delivery_name'] as String,
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
        'phone': phone,
        'categoryName': categoryName,
        'shopName': shopName,
        'order': order,
        'latitude': latitude,
        'longtude': longtude,
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
      phone,
      categoryName,
      shopName,
      order,
      latitude,
      longtude,
      id,
      createdAt,
      updatedAt,
      permissions,
      collectionId,
      databaseId,
    ];
  }
}
