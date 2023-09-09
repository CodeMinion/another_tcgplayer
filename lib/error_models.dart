
import 'package:json_annotation/json_annotation.dart';

part 'error_models.g.dart';

@JsonSerializable(includeIfNull: false)
class ServerError {
  String? timestamp;
  int? status;
  String? error;
  @JsonKey(name: "error_description")
  String? errorDescription;
  String? message;
  String? path;

  ServerError(
      {this.timestamp, this.status, this.error, this.message, this.path});

  factory ServerError.fromJson(Map<String, dynamic> json) =>
      _$ServerErrorFromJson(json);

  Map<String, dynamic> toJson() => _$ServerErrorToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
