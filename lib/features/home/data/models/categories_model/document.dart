import 'package:equatable/equatable.dart';

class Document extends Equatable {
  final String name;
  final String image;
  final String id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<dynamic> permissions;
  final String collectionId;
  final String databaseId;

  const Document({
    required this.name,
    required this.image,
    required this.id,
    this.createdAt,
    this.updatedAt,
    required this.permissions,
    required this.collectionId,
    required this.databaseId,
  });

  factory Document.fromJson(Map<String, dynamic> json) => Document(
        name: json['name'],
        image: json['image'],
        id: json['\$id'],
        createdAt: json['\$createdAt'] == null
            ? null
            : DateTime.parse(json['\$createdAt'] as String),
        updatedAt: json['\$updatedAt'] == null
            ? null
            : DateTime.parse(json['\$updatedAt'] as String),
        permissions: json['\$permissions'],
        collectionId: json['\$collectionId'],
        databaseId: json['\$databaseId'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'image': image,
        '\$id': id,
        '\$createdAt': createdAt?.toIso8601String(),
        '\$updatedAt': updatedAt?.toIso8601String(),
        '\$permissions': permissions,
        '\$collectionId': collectionId,
        '\$databaseId': databaseId,
      };

  @override
  List<Object?> get props {
    return [
      name,
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
