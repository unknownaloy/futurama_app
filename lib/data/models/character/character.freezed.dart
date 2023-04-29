// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Character _$CharacterFromJson(Map<String, dynamic> json) {
  return _Character.fromJson(json);
}

/// @nodoc
mixin _$Character {
  @JsonKey(name: "name")
  CharacterName get characterName => throw _privateConstructorUsedError;
  @JsonKey(name: "images")
  CharacterImage get characterImage => throw _privateConstructorUsedError;
  Gender get gender => throw _privateConstructorUsedError;
  String get species => throw _privateConstructorUsedError;
  String get homePlanet => throw _privateConstructorUsedError;
  String get occupation => throw _privateConstructorUsedError;
  List<String> get sayings => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CharacterCopyWith<Character> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterCopyWith<$Res> {
  factory $CharacterCopyWith(Character value, $Res Function(Character) then) =
      _$CharacterCopyWithImpl<$Res, Character>;
  @useResult
  $Res call(
      {@JsonKey(name: "name") CharacterName characterName,
      @JsonKey(name: "images") CharacterImage characterImage,
      Gender gender,
      String species,
      String homePlanet,
      String occupation,
      List<String> sayings});

  $CharacterNameCopyWith<$Res> get characterName;
  $CharacterImageCopyWith<$Res> get characterImage;
}

/// @nodoc
class _$CharacterCopyWithImpl<$Res, $Val extends Character>
    implements $CharacterCopyWith<$Res> {
  _$CharacterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? characterName = null,
    Object? characterImage = null,
    Object? gender = null,
    Object? species = null,
    Object? homePlanet = null,
    Object? occupation = null,
    Object? sayings = null,
  }) {
    return _then(_value.copyWith(
      characterName: null == characterName
          ? _value.characterName
          : characterName // ignore: cast_nullable_to_non_nullable
              as CharacterName,
      characterImage: null == characterImage
          ? _value.characterImage
          : characterImage // ignore: cast_nullable_to_non_nullable
              as CharacterImage,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender,
      species: null == species
          ? _value.species
          : species // ignore: cast_nullable_to_non_nullable
              as String,
      homePlanet: null == homePlanet
          ? _value.homePlanet
          : homePlanet // ignore: cast_nullable_to_non_nullable
              as String,
      occupation: null == occupation
          ? _value.occupation
          : occupation // ignore: cast_nullable_to_non_nullable
              as String,
      sayings: null == sayings
          ? _value.sayings
          : sayings // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CharacterNameCopyWith<$Res> get characterName {
    return $CharacterNameCopyWith<$Res>(_value.characterName, (value) {
      return _then(_value.copyWith(characterName: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CharacterImageCopyWith<$Res> get characterImage {
    return $CharacterImageCopyWith<$Res>(_value.characterImage, (value) {
      return _then(_value.copyWith(characterImage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CharacterCopyWith<$Res> implements $CharacterCopyWith<$Res> {
  factory _$$_CharacterCopyWith(
          _$_Character value, $Res Function(_$_Character) then) =
      __$$_CharacterCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "name") CharacterName characterName,
      @JsonKey(name: "images") CharacterImage characterImage,
      Gender gender,
      String species,
      String homePlanet,
      String occupation,
      List<String> sayings});

  @override
  $CharacterNameCopyWith<$Res> get characterName;
  @override
  $CharacterImageCopyWith<$Res> get characterImage;
}

/// @nodoc
class __$$_CharacterCopyWithImpl<$Res>
    extends _$CharacterCopyWithImpl<$Res, _$_Character>
    implements _$$_CharacterCopyWith<$Res> {
  __$$_CharacterCopyWithImpl(
      _$_Character _value, $Res Function(_$_Character) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? characterName = null,
    Object? characterImage = null,
    Object? gender = null,
    Object? species = null,
    Object? homePlanet = null,
    Object? occupation = null,
    Object? sayings = null,
  }) {
    return _then(_$_Character(
      characterName: null == characterName
          ? _value.characterName
          : characterName // ignore: cast_nullable_to_non_nullable
              as CharacterName,
      characterImage: null == characterImage
          ? _value.characterImage
          : characterImage // ignore: cast_nullable_to_non_nullable
              as CharacterImage,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender,
      species: null == species
          ? _value.species
          : species // ignore: cast_nullable_to_non_nullable
              as String,
      homePlanet: null == homePlanet
          ? _value.homePlanet
          : homePlanet // ignore: cast_nullable_to_non_nullable
              as String,
      occupation: null == occupation
          ? _value.occupation
          : occupation // ignore: cast_nullable_to_non_nullable
              as String,
      sayings: null == sayings
          ? _value._sayings
          : sayings // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Character implements _Character {
  _$_Character(
      {@JsonKey(name: "name") required this.characterName,
      @JsonKey(name: "images") required this.characterImage,
      this.gender = Gender.male,
      required this.species,
      required this.homePlanet,
      required this.occupation,
      required final List<String> sayings})
      : _sayings = sayings;

  factory _$_Character.fromJson(Map<String, dynamic> json) =>
      _$$_CharacterFromJson(json);

  @override
  @JsonKey(name: "name")
  final CharacterName characterName;
  @override
  @JsonKey(name: "images")
  final CharacterImage characterImage;
  @override
  @JsonKey()
  final Gender gender;
  @override
  final String species;
  @override
  final String homePlanet;
  @override
  final String occupation;
  final List<String> _sayings;
  @override
  List<String> get sayings {
    if (_sayings is EqualUnmodifiableListView) return _sayings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sayings);
  }

  @override
  String toString() {
    return 'Character(characterName: $characterName, characterImage: $characterImage, gender: $gender, species: $species, homePlanet: $homePlanet, occupation: $occupation, sayings: $sayings)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Character &&
            (identical(other.characterName, characterName) ||
                other.characterName == characterName) &&
            (identical(other.characterImage, characterImage) ||
                other.characterImage == characterImage) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.species, species) || other.species == species) &&
            (identical(other.homePlanet, homePlanet) ||
                other.homePlanet == homePlanet) &&
            (identical(other.occupation, occupation) ||
                other.occupation == occupation) &&
            const DeepCollectionEquality().equals(other._sayings, _sayings));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      characterName,
      characterImage,
      gender,
      species,
      homePlanet,
      occupation,
      const DeepCollectionEquality().hash(_sayings));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CharacterCopyWith<_$_Character> get copyWith =>
      __$$_CharacterCopyWithImpl<_$_Character>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CharacterToJson(
      this,
    );
  }
}

abstract class _Character implements Character {
  factory _Character(
      {@JsonKey(name: "name") required final CharacterName characterName,
      @JsonKey(name: "images") required final CharacterImage characterImage,
      final Gender gender,
      required final String species,
      required final String homePlanet,
      required final String occupation,
      required final List<String> sayings}) = _$_Character;

  factory _Character.fromJson(Map<String, dynamic> json) =
      _$_Character.fromJson;

  @override
  @JsonKey(name: "name")
  CharacterName get characterName;
  @override
  @JsonKey(name: "images")
  CharacterImage get characterImage;
  @override
  Gender get gender;
  @override
  String get species;
  @override
  String get homePlanet;
  @override
  String get occupation;
  @override
  List<String> get sayings;
  @override
  @JsonKey(ignore: true)
  _$$_CharacterCopyWith<_$_Character> get copyWith =>
      throw _privateConstructorUsedError;
}
