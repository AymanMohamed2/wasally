import 'package:equatable/equatable.dart';

class Document extends Equatable {
  final String? name;
  final String? address;
  final String? image;
  final String? categoryName;
  final String? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<dynamic>? permissions;
  final String? collectionId;
  final String? databaseId;

  const Document({
    this.name,
    this.address,
    this.image,
    this.categoryName,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.permissions,
    this.collectionId,
    this.databaseId,
  });

  factory Document.fromJson(Map<String, dynamic> json) => Document(
        name: json['name'] as String?,
        address: json['address'] as String?,
        image: json['image'] as String?,
        categoryName: json['categoryName'] as String,
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
        'name': name,
        'address': address,
        'image': image,
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
      name,
      address,
      image,
      id,
      createdAt,
      updatedAt,
      permissions,
      collectionId,
      databaseId,
    ];
  }
}
