import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum Gender {
  @JsonValue("Male")
  male,

  @JsonValue("Female")
  female,
}
