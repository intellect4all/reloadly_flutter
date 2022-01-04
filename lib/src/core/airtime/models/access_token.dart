import 'dart:convert';

import 'package:flutter/foundation.dart';

class AirtimeAccessToken {
  String accessToken;
  List<String> scope;
  int expiration;
  String tokenType;

  AirtimeAccessToken({
    required this.accessToken,
    required this.scope,
    required this.expiration,
    required this.tokenType,
  });

  DateTime timestamp = DateTime.now();

  bool get tokenExpired => _checkTokenExpired();

  AirtimeAccessToken copyWith({
    String? accessToken,
    List<String>? scope,
    int? expiration,
    String? tokenType,
  }) {
    return AirtimeAccessToken(
      accessToken: accessToken ?? this.accessToken,
      scope: scope ?? this.scope,
      expiration: expiration ?? this.expiration,
      tokenType: tokenType ?? this.tokenType,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'accessToken': accessToken,
      'scope': scope,
      'expiration': expiration,
      'tokenType': tokenType,
    };
  }

  factory AirtimeAccessToken.fromMap(Map<String, dynamic> map) {
    return AirtimeAccessToken(
      accessToken: map['access_token'] ?? '',
      scope: List<String>.from((map['scope'] as String).split(' ')),
      expiration: map['expires_in']?.toInt() ?? 0,
      tokenType: map['token_type'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AirtimeAccessToken.fromJson(String source) =>
      AirtimeAccessToken.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AirtimeAccessToken(accessToken: $accessToken, scope: $scope, expiration: $expiration, tokenType: $tokenType)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AirtimeAccessToken &&
        other.accessToken == accessToken &&
        listEquals(other.scope, scope) &&
        other.expiration == expiration &&
        other.tokenType == tokenType;
  }

  @override
  int get hashCode {
    return accessToken.hashCode ^
        scope.hashCode ^
        expiration.hashCode ^
        tokenType.hashCode;
  }

  bool _checkTokenExpired() {
    bool tokenExpired = true;
    final tokenDuration = Duration(seconds: expiration - 80);
    final tokenExpirationTime = timestamp.add(tokenDuration);
    tokenExpired = tokenExpirationTime.isAfter(DateTime.now()) ? false : true;
    return tokenExpired;
  }
}
