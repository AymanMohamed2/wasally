import 'package:equatable/equatable.dart';

import 'document.dart';

class PlayerIdsModel extends Equatable {
	final int? total;
	final List<Document>? documents;

	const PlayerIdsModel({this.total, this.documents});

	factory PlayerIdsModel.fromJson(Map<String, dynamic> json) {
		return PlayerIdsModel(
			total: json['total'] as int?,
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
