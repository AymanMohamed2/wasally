import 'package:equatable/equatable.dart';

import 'hash_options.dart';

class UserInfoModel extends Equatable {
  final String? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? name;
  final String? password;
  final String? hash;
  final HashOptions? hashOptions;
  final DateTime? registration;
  final bool? status;
  final DateTime? passwordUpdate;
  final String? email;
  final String? phone;
  final bool? emailVerification;
  final bool? phoneVerification;

  const UserInfoModel({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.password,
    this.hash,
    this.hashOptions,
    this.registration,
    this.status,
    this.passwordUpdate,
    this.email,
    this.phone,
    this.emailVerification,
    this.phoneVerification,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) => UserInfoModel(
        id: json['\$id'] as String?,
        createdAt: json['\$createdAt'] == null
            ? null
            : DateTime.parse(json['\$createdAt'] as String),
        updatedAt: json['\$updatedAt'] == null
            ? null
            : DateTime.parse(json['\$updatedAt'] as String),
        name: json['name'] as String?,
        password: json['password'] as String?,
        hash: json['hash'] as String?,
        hashOptions: json['hashOptions'] == null
            ? null
            : HashOptions.fromJson(json['hashOptions'] as Map<String, dynamic>),
        registration: json['registration'] == null
            ? null
            : DateTime.parse(json['registration'] as String),
        status: json['status'] as bool?,
        passwordUpdate: json['passwordUpdate'] == null
            ? null
            : DateTime.parse(json['passwordUpdate'] as String),
        email: json['email'] as String?,
        phone: json['phone'] as String?,
        emailVerification: json['emailVerification'] as bool?,
        phoneVerification: json['phoneVerification'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        '$id': id,
        '$createdAt': createdAt?.toIso8601String(),
        '$updatedAt': updatedAt?.toIso8601String(),
        'name': name,
        'password': password,
        'hash': hash,
        'hashOptions': hashOptions?.toJson(),
        'registration': registration?.toIso8601String(),
        'status': status,
        'passwordUpdate': passwordUpdate?.toIso8601String(),
        'email': email,
        'phone': phone,
        'emailVerification': emailVerification,
        'phoneVerification': phoneVerification,
      };

  @override
  List<Object?> get props {
    return [
      id,
      createdAt,
      updatedAt,
      name,
      password,
      hash,
      hashOptions,
      registration,
      status,
      passwordUpdate,
      email,
      phone,
      emailVerification,
      phoneVerification,
    ];
  }
}
