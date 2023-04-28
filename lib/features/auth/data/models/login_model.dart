class LoginModel {
  final String id;
  final String createdAt;
  final String userId;
  final String secret;
  final String expire;
  // final String provider;
  // final String providerUid;
  // final String providerAccessToken;
  // final String providerAccessTokenExpiry;
  // final String providerRefreshToken;
  // final String ip;
  // final String osCode;
  // final String osName;
  // final String osVersion;
  // final String clientType;
  // final String clientCode;
  // final String clientName;
  // final String clientVersion;
  // final String clientEngine;
  // final String clientEngineVersion;
  // final String deviceName;
  // final String deviceBrand;
  // final String deviceModel;
  // final String countryCode;
  // final String countryName;
  // final bool current;

  LoginModel({
    required this.id,
    required this.createdAt,
    required this.userId,
    required this.secret,
    required this.expire,
    // required this.provider,
    // required this.providerUid,
    // required this.providerAccessToken,
    // required this.providerAccessTokenExpiry,
    // required this.providerRefreshToken,
    // required this.ip,
    // required this.osCode,
    // required this.osName,
    // required this.osVersion,
    // required this.clientType,
    // required this.clientName,
    // required this.clientVersion,
    // required this.clientEngine,
    // required this.clientEngineVersion,
    // required this.deviceName,
    // required this.deviceBrand,
    // required this.deviceModel,
    // required this.countryCode,
    // required this.countryName,
    // required this.current,

    // required this.clientCode,
  });

  factory LoginModel.fromJson(Map<String, dynamic> data) {
    return LoginModel(
        id: data['\$id'],
        createdAt: data['\$createdAt'],
        userId: data['userId'],
        secret: data['secret'],
        expire: data['expire']);
  }
}
