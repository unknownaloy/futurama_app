// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_name.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CharacterName _$CharacterNameFromJson(Map<String, dynamic> json) {
  return _CharacterName.fromJson(json);
}

/// @nodoc
mixin _$CharacterName {
  String get first => throw _privateConstructorUsedError;
  String get middle => throw _privateConstructorUsedError;
  String get last => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CharacterNameCopyWith<CharacterName> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterNameCopyWith<$Res> {
  factory $CharacterNameCopyWith(
          CharacterName value, $Res Function(CharacterName) then) =
      _$CharacterNameCopyWithImpl<$Res, CharacterName>;
  @useResult
  $Res call({String first, String middle, String last});
}

/// @nodoc
class _$CharacterNameCopyWithImpl<$Res, $Val extends CharacterName>
    implements $CharacterNameCopyWith<$Res> {
  _$CharacterNameCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? first = null,
    Object? middle = null,
    Object? last = null,
  }) {
    return _then(_value.copyWith(
      first: null == first
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as String,
      middle: null == middle
          ? _value.middle
          : middle // ignore: cast_nullable_to_non_nullable
              as String,
      last: null == last
          ? _value.last
          : last // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CharacterNameCopyWith<$Res>
    implements $CharacterNameCopyWith<$Res> {
  factory _$$_CharacterNameCopyWith(
          _$_CharacterName value, $Res Function(_$_CharacterName) then) =
      __$$_CharacterNameCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String first, String middle, String last});
}

/// @nodoc
class __$$_CharacterNameCopyWithImpl<$Res>
    extends _$CharacterNameCopyWithImpl<$Res, _$_CharacterName>
    implements _$$_CharacterNameCopyWith<$Res> {
  __$$_CharacterNameCopyWithImpl(
      _$_CharacterName _value, $Res Function(_$_CharacterName) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? first = null,
    Object? middle = null,
    Object? last = null,
  }) {
    return _then(_$_CharacterName(
      first: null == first
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as String,
      middle: null == middle
          ? _value.middle
          : middle // ignore: cast_nullable_to_non_nullable
              as String,
      last: null == last
          ? _value.last
          : last // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CharacterName implements _CharacterName {
  _$_CharacterName(
      {required this.first, required this.middle, required this.last});

  factory _$_CharacterName.fromJson(Map<String, dynamic> json) =>
      _$$_CharacterNameFromJson(json);

  @override
  final String first;
  @override
  final String middle;
  @override
  final String last;

  @override
  String toString() {
    return 'CharacterName(first: $first, middle: $middle, last: $last)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CharacterName &&
            (identical(other.first, first) || other.first == first) &&
            (identical(other.middle, middle) || other.middle == middle) &&
            (identical(other.last, last) || other.last == last));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, first, middle, last);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CharacterNameCopyWith<_$_CharacterName> get copyWith =>
      __$$_CharacterNameCopyWithImpl<_$_CharacterName>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CharacterNameToJson(
      this,
    );
  }
}

abstract class _CharacterName implements CharacterName {
  factory _CharacterName(
      {required final String first,
      required final String middle,
      required final String last}) = _$_CharacterName;

  factory _CharacterName.fromJson(Map<String, dynamic> json) =
      _$_CharacterName.fromJson;

  @override
  String get first;
  @override
  String get middle;
  @override
  String get last;
  @override
  @JsonKey(ignore: true)
  _$$_CharacterNameCopyWith<_$_CharacterName> get copyWith =>
      throw _privateConstructorUsedError;
}
