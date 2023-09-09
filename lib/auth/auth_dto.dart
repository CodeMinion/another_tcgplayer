
import 'package:json_annotation/json_annotation.dart';

part 'auth_dto.g.dart';

@JsonSerializable(includeIfNull: false)
class AccessToken {

  @JsonKey(name:"access_token") String accessToken;
  @JsonKey(name: "token_type") String tokenType;
  @JsonKey(name: "expires_in") int expiresIn;
  String userName;
  int _expirationStamp = 0;

  AccessToken({required this.userName, required this.accessToken, required this.expiresIn, required this.tokenType});

  factory AccessToken.fromJson(Map<String, dynamic> json) =>
      _$AccessTokenFromJson(json);

  Map<String, dynamic> toJson() => _$AccessTokenToJson(this);

  ///
  /// Updates the expiration stamp based on the number of seconds in expiresIn
  bool isExpired() {
    return _expirationStamp < DateTime.now().millisecondsSinceEpoch;
  }

  void calculateExpiration() {
    if (_expirationStamp == 0 ) {
      _expirationStamp = DateTime.now().millisecondsSinceEpoch + expiresIn * 1000;
    }
  }


  @override
  String toString() {
    return toJson().toString();
  }
}