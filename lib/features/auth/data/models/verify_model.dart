import 'package:equatable/equatable.dart';

class VerifyModel extends Equatable {
  final String? id;
  final DateTime? createdAt;
  final String? userId;
  final String? expire;
  final String? provider;
  final String? providerUid;
  final String? providerAccessToken;
  final String? providerAccessTokenExpiry;
  final String? providerRefreshToken;
  final String? ip;
  final String? osCode;
  final String? osName;
  final String? osVersion;
  final String? clientType;
  final String? clientCode;
  final String? clientName;
  final String? clientVersion;
  final String? clientEngine;
  final String? clientEngineVersion;
  final String? deviceName;
  final String? deviceBrand;
  final String? deviceModel;
  final String? countryCode;
  final String? countryName;
  final bool? current;

  const VerifyModel({
    this.id,
    this.createdAt,
    this.userId,
    this.expire,
    this.provider,
    this.providerUid,
    this.providerAccessToken,
    this.providerAccessTokenExpiry,
    this.providerRefreshToken,
    this.ip,
    this.osCode,
    this.osName,
    this.osVersion,
    this.clientType,
    this.clientCode,
    this.clientName,
    this.clientVersion,
    this.clientEngine,
    this.clientEngineVersion,
    this.deviceName,
    this.deviceBrand,
    this.deviceModel,
    this.countryCode,
    this.countryName,
    this.current,
  });

  factory VerifyModel.fromJson(Map<String, dynamic> json) => VerifyModel(
        id: json['\$id'] as String?,
        createdAt: json['\$createdAt'] == null
            ? null
            : DateTime.parse(json['\$createdAt'] as String),
        userId: json['userId'] as String?,
        expire: json['expire'] as String?,
        provider: json['provider'] as String?,
        providerUid: json['providerUid'] as String?,
        providerAccessToken: json['providerAccessToken'] as String?,
        providerAccessTokenExpiry: json['providerAccessTokenExpiry'] as String?,
        providerRefreshToken: json['providerRefreshToken'] as String?,
        ip: json['ip'] as String?,
        osCode: json['osCode'] as String?,
        osName: json['osName'] as String?,
        osVersion: json['osVersion'] as String?,
        clientType: json['clientType'] as String?,
        clientCode: json['clientCode'] as String?,
        clientName: json['clientName'] as String?,
        clientVersion: json['clientVersion'] as String?,
        clientEngine: json['clientEngine'] as String?,
        clientEngineVersion: json['clientEngineVersion'] as String?,
        deviceName: json['deviceName'] as String?,
        deviceBrand: json['deviceBrand'] as String?,
        deviceModel: json['deviceModel'] as String?,
        countryCode: json['countryCode'] as String?,
        countryName: json['countryName'] as String?,
        current: json['current'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        '$id': id,
        '$createdAt': createdAt?.toIso8601String(),
        'userId': userId,
        'expire': expire,
        'provider': provider,
        'providerUid': providerUid,
        'providerAccessToken': providerAccessToken,
        'providerAccessTokenExpiry': providerAccessTokenExpiry,
        'providerRefreshToken': providerRefreshToken,
        'ip': ip,
        'osCode': osCode,
        'osName': osName,
        'osVersion': osVersion,
        'clientType': clientType,
        'clientCode': clientCode,
        'clientName': clientName,
        'clientVersion': clientVersion,
        'clientEngine': clientEngine,
        'clientEngineVersion': clientEngineVersion,
        'deviceName': deviceName,
        'deviceBrand': deviceBrand,
        'deviceModel': deviceModel,
        'countryCode': countryCode,
        'countryName': countryName,
        'current': current,
      };

  @override
  List<Object?> get props {
    return [
      id,
      createdAt,
      userId,
      expire,
      provider,
      providerUid,
      providerAccessToken,
      providerAccessTokenExpiry,
      providerRefreshToken,
      ip,
      osCode,
      osName,
      osVersion,
      clientType,
      clientCode,
      clientName,
      clientVersion,
      clientEngine,
      clientEngineVersion,
      deviceName,
      deviceBrand,
      deviceModel,
      countryCode,
      countryName,
      current,
    ];
  }
}
