import 'package:equatable/equatable.dart';

import 'document.dart';

class OrderModel extends Equatable {
	final int? total;
	final List<Document>? documents;

	const OrderModel({this.total, this.documents});

	factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
				total: json['total'] as int?,
				documents: (json['documents'] as List<dynamic>?)
						?.map((e) => Document.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'total': total,
				'documents': documents?.map((e) => e.toJson()).toList(),
			};

	@override
	List<Object?> get props => [total, documents];
}
