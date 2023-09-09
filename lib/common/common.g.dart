// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TcgPlayerResponseDto<T> _$TcgPlayerResponseDtoFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    TcgPlayerResponseDto<T>(
      success: json['success'] as bool,
      errors:
          (json['errors'] as List<dynamic>).map((e) => e as String).toList(),
      results: (json['results'] as List<dynamic>).map(fromJsonT).toList(),
    );

Map<String, dynamic> _$TcgPlayerResponseDtoToJson<T>(
  TcgPlayerResponseDto<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'success': instance.success,
      'errors': instance.errors,
      'results': instance.results.map(toJsonT).toList(),
    };

TcgPlayerResponsePageDto<T> _$TcgPlayerResponsePageDtoFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    TcgPlayerResponsePageDto<T>(
      success: json['success'] as bool,
      errors:
          (json['errors'] as List<dynamic>).map((e) => e as String).toList(),
      results: (json['results'] as List<dynamic>).map(fromJsonT).toList(),
      totalItems: json['totalItems'] as int,
    );

Map<String, dynamic> _$TcgPlayerResponsePageDtoToJson<T>(
  TcgPlayerResponsePageDto<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'totalItems': instance.totalItems,
      'success': instance.success,
      'errors': instance.errors,
      'results': instance.results.map(toJsonT).toList(),
    };
