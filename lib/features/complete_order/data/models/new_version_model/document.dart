class Document {
  String? newVersion;
  dynamic appUrl;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<dynamic>? permissions;
  String? databaseId;
  String? collectionId;

  Document({
    this.newVersion,
    this.appUrl,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.permissions,
    this.databaseId,
    this.collectionId,
  });

  factory Document.fromJson(Map<String, dynamic> json) => Document(
        newVersion: json['newVersion'] as String?,
        appUrl: json['appUrl'] as dynamic,
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
        'newVersion': newVersion,
        'appUrl': appUrl,
        '$id': id,
        '$createdAt': createdAt?.toIso8601String(),
        '$updatedAt': updatedAt?.toIso8601String(),
        '$permissions': permissions,
        '$databaseId': databaseId,
        '$collectionId': collectionId,
      };
}
