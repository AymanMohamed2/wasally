import 'package:equatable/equatable.dart';

class UploadImageModel extends Equatable {
  final String? id;
  final String? bucketId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<String>? permissions;
  final String? name;
  final String? signature;
  final String? mimeType;
  final int? sizeOriginal;
  final int? chunksTotal;
  final int? chunksUploaded;

  const UploadImageModel({
    this.id,
    this.bucketId,
    this.createdAt,
    this.updatedAt,
    this.permissions,
    this.name,
    this.signature,
    this.mimeType,
    this.sizeOriginal,
    this.chunksTotal,
    this.chunksUploaded,
  });

  factory UploadImageModel.fromJson(Map<String, dynamic> json) {
    return UploadImageModel(
      id: json['\$id'] as String?,
      bucketId: json['bucketId'] as String?,
      createdAt: json['\$createdAt'] == null
          ? null
          : DateTime.parse(json['\$createdAt'] as String),
      updatedAt: json['\$updatedAt'] == null
          ? null
          : DateTime.parse(json['\$updatedAt'] as String),
      permissions: json['\$permissions'] as List<String>?,
      name: json['name'] as String?,
      signature: json['signature'] as String?,
      mimeType: json['mimeType'] as String?,
      sizeOriginal: json['sizeOriginal'] as int?,
      chunksTotal: json['chunksTotal'] as int?,
      chunksUploaded: json['chunksUploaded'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        '$id': id,
        'bucketId': bucketId,
        '$createdAt': createdAt?.toIso8601String(),
        '$updatedAt': updatedAt?.toIso8601String(),
        '$permissions': permissions,
        'name': name,
        'signature': signature,
        'mimeType': mimeType,
        'sizeOriginal': sizeOriginal,
        'chunksTotal': chunksTotal,
        'chunksUploaded': chunksUploaded,
      };

  @override
  List<Object?> get props {
    return [
      id,
      bucketId,
      createdAt,
      updatedAt,
      permissions,
      name,
      signature,
      mimeType,
      sizeOriginal,
      chunksTotal,
      chunksUploaded,
    ];
  }
}
