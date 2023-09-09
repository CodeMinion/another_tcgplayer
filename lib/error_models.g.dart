// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServerError _$ServerErrorFromJson(Map<String, dynamic> json) => ServerError(
      timestamp: json['timestamp'] as String?,
      status: json['status'] as int?,
      error: json['error'] as String?,
      message: json['message'] as String?,
      path: json['path'] as String?,
    )..errorDescription = json['error_description'] as String?;

Map<String, dynamic> _$ServerErrorToJson(ServerError instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('timestamp', instance.timestamp);
  writeNotNull('status', instance.status);
  writeNotNull('error', instance.error);
  writeNotNull('error_description', instance.errorDescription);
  writeNotNull('message', instance.message);
  writeNotNull('path', instance.path);
  return val;
}
