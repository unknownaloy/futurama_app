import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum Gender {
  @JsonValue("Male")
  male("Male"),

  @JsonValue("Female")
  female("Female");

  final String value;

  const Gender(this.value);
}
