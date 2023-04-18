import 'package:equatable/equatable.dart';

import 'document.dart';

class CategoriesModel extends Equatable {
  final int total;
  final List<Document>? documents;

  const CategoriesModel({required this.total, this.documents});

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      total: json['total'],
      documents: (json['documents'] as List<dynamic>?)
          ?.map((e) => Document.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'total': total,
        'documents': documents?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [total, documents];
}
