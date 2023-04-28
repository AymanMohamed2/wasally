import 'package:equatable/equatable.dart';

class HashOptions extends Equatable {
	final int? memoryCost;
	final int? timeCost;
	final int? threads;

	const HashOptions({this.memoryCost, this.timeCost, this.threads});

	factory HashOptions.fromJson(Map<String, dynamic> json) => HashOptions(
				memoryCost: json['memoryCost'] as int?,
				timeCost: json['timeCost'] as int?,
				threads: json['threads'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'memoryCost': memoryCost,
				'timeCost': timeCost,
				'threads': threads,
			};

	@override
	List<Object?> get props => [memoryCost, timeCost, threads];
}
