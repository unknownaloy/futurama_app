// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CharacterImage _$CharacterImageFromJson(Map<String, dynamic> json) {
  return _CharacterImage.fromJson(json);
}

/// @nodoc
mixin _$CharacterImage {
  @JsonKey(name: "main")
  String get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CharacterImageCopyWith<CharacterImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterImageCopyWith<$Res> {
  factory $CharacterImageCopyWith(
          CharacterImage value, $Res Function(CharacterImage) then) =
      _$CharacterImageCopyWithImpl<$Res, CharacterImage>;
  @useResult
  $Res call({@JsonKey(name: "main") String image});
}

/// @nodoc
class _$CharacterImageCopyWithImpl<$Res, $Val extends CharacterImage>
    implements $CharacterImageCopyWith<$Res> {
  _$CharacterImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
  }) {
    return _then(_value.copyWith(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CharacterImageCopyWith<$Res>
    implements $CharacterImageCopyWith<$Res> {
  factory _$$_CharacterImageCopyWith(
          _$_CharacterImage value, $Res Function(_$_CharacterImage) then) =
      __$$_CharacterImageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "main") String image});
}

/// @nodoc
class __$$_CharacterImageCopyWithImpl<$Res>
    extends _$CharacterImageCopyWithImpl<$Res, _$_CharacterImage>
    implements _$$_CharacterImageCopyWith<$Res> {
  __$$_CharacterImageCopyWithImpl(
      _$_CharacterImage _value, $Res Function(_$_CharacterImage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
  }) {
    return _then(_$_CharacterImage(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CharacterImage implements _CharacterImage {
  _$_CharacterImage({@JsonKey(name: "main") required this.image});

  factory _$_CharacterImage.fromJson(Map<String, dynamic> json) =>
      _$$_CharacterImageFromJson(json);

  @override
  @JsonKey(name: "main")
  final String image;

  @override
  String toString() {
    return 'CharacterImage(image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CharacterImage &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CharacterImageCopyWith<_$_CharacterImage> get copyWith =>
      __$$_CharacterImageCopyWithImpl<_$_CharacterImage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CharacterImageToJson(
      this,
    );
  }
}

abstract class _CharacterImage implements CharacterImage {
  factory _CharacterImage(
      {@JsonKey(name: "main") required final String image}) = _$_CharacterImage;

  factory _CharacterImage.fromJson(Map<String, dynamic> json) =
      _$_CharacterImage.fromJson;

  @override
  @JsonKey(name: "main")
  String get image;
  @override
  @JsonKey(ignore: true)
  _$$_CharacterImageCopyWith<_$_CharacterImage> get copyWith =>
      throw _privateConstructorUsedError;
}
