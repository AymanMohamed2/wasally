import 'document.dart';

class NewVersionModel {
	int? total;
	List<Document>? documents;

	NewVersionModel({this.total, this.documents});

	factory NewVersionModel.fromJson(Map<String, dynamic> json) {
		return NewVersionModel(
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
}
