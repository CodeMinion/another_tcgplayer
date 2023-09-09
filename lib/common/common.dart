
import 'package:json_annotation/json_annotation.dart';

part 'common.g.dart';

class TcgPlayerPage<T> {

  final int _totalItems;
  final List<T> _items;

  TcgPlayerPage({required int totalItems, required List<T> pageItems}):_items = pageItems, _totalItems=totalItems;

  int getTotalItem() => _totalItems;

  List<T> getPageContent() => _items;

  @override
  String toString() {
    return "{totalItems: $_totalItems, items:${_items.toString()}}";
  }
}

@JsonSerializable(includeIfNull: false, genericArgumentFactories: true)
class TcgPlayerResponseDto<T> {

  bool success;
  List<String> errors;

  List<T> results;

  TcgPlayerResponseDto({required this.success,required this.errors, required this.results});

  factory TcgPlayerResponseDto.fromJson(
      Map<String, dynamic> json,
      T Function(Object? json) fromJsonT,
      ) =>
      _$TcgPlayerResponseDtoFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$TcgPlayerResponseDtoToJson(this, toJsonT);

/*
  @override
  String toString() {
    return toJson().toString();
  }
   */
}

@JsonSerializable(includeIfNull: false, genericArgumentFactories: true)
class TcgPlayerResponsePageDto<T> {

  int totalItems;
  bool success;
  List<String> errors;

  List<T> results;

  TcgPlayerResponsePageDto({required this.success,required this.errors, required this.results, required this.totalItems});

  factory TcgPlayerResponsePageDto.fromJson(
      Map<String, dynamic> json,
      T Function(Object? json) fromJsonT,
      ) =>
      _$TcgPlayerResponsePageDtoFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$TcgPlayerResponsePageDtoToJson(this, toJsonT);

}

extension BackendHelper on Map<String, dynamic> {
  ///
  /// Converts the map into something more
  /// manageable to be used in URL query params.
  ///
  Map<String, String> toQueryParam() {
    return map((key, value) => MapEntry(key, value.toString()));
  }
}

