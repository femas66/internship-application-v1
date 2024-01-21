// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'statement_letter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StatementLetter _$StatementLetterFromJson(Map<String, dynamic> json) {
  return _StatementLetter.fromJson(json);
}

/// @nodoc
mixin _$StatementLetter {
  int get id => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get sp => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get letterHead => throw _privateConstructorUsedError;
  String get proof => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatementLetterCopyWith<StatementLetter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatementLetterCopyWith<$Res> {
  factory $StatementLetterCopyWith(
          StatementLetter value, $Res Function(StatementLetter) then) =
      _$StatementLetterCopyWithImpl<$Res, StatementLetter>;
  @useResult
  $Res call(
      {int id,
      String description,
      String sp,
      String date,
      String letterHead,
      String proof,
      String createdAt});
}

/// @nodoc
class _$StatementLetterCopyWithImpl<$Res, $Val extends StatementLetter>
    implements $StatementLetterCopyWith<$Res> {
  _$StatementLetterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = null,
    Object? sp = null,
    Object? date = null,
    Object? letterHead = null,
    Object? proof = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      sp: null == sp
          ? _value.sp
          : sp // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      letterHead: null == letterHead
          ? _value.letterHead
          : letterHead // ignore: cast_nullable_to_non_nullable
              as String,
      proof: null == proof
          ? _value.proof
          : proof // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StatementLetterImplCopyWith<$Res>
    implements $StatementLetterCopyWith<$Res> {
  factory _$$StatementLetterImplCopyWith(_$StatementLetterImpl value,
          $Res Function(_$StatementLetterImpl) then) =
      __$$StatementLetterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String description,
      String sp,
      String date,
      String letterHead,
      String proof,
      String createdAt});
}

/// @nodoc
class __$$StatementLetterImplCopyWithImpl<$Res>
    extends _$StatementLetterCopyWithImpl<$Res, _$StatementLetterImpl>
    implements _$$StatementLetterImplCopyWith<$Res> {
  __$$StatementLetterImplCopyWithImpl(
      _$StatementLetterImpl _value, $Res Function(_$StatementLetterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = null,
    Object? sp = null,
    Object? date = null,
    Object? letterHead = null,
    Object? proof = null,
    Object? createdAt = null,
  }) {
    return _then(_$StatementLetterImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      sp: null == sp
          ? _value.sp
          : sp // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      letterHead: null == letterHead
          ? _value.letterHead
          : letterHead // ignore: cast_nullable_to_non_nullable
              as String,
      proof: null == proof
          ? _value.proof
          : proof // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StatementLetterImpl implements _StatementLetter {
  _$StatementLetterImpl(
      {required this.id,
      required this.description,
      required this.sp,
      required this.date,
      required this.letterHead,
      required this.proof,
      required this.createdAt});

  factory _$StatementLetterImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatementLetterImplFromJson(json);

  @override
  final int id;
  @override
  final String description;
  @override
  final String sp;
  @override
  final String date;
  @override
  final String letterHead;
  @override
  final String proof;
  @override
  final String createdAt;

  @override
  String toString() {
    return 'StatementLetter(id: $id, description: $description, sp: $sp, date: $date, letterHead: $letterHead, proof: $proof, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatementLetterImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.sp, sp) || other.sp == sp) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.letterHead, letterHead) ||
                other.letterHead == letterHead) &&
            (identical(other.proof, proof) || other.proof == proof) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, description, sp, date, letterHead, proof, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StatementLetterImplCopyWith<_$StatementLetterImpl> get copyWith =>
      __$$StatementLetterImplCopyWithImpl<_$StatementLetterImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StatementLetterImplToJson(
      this,
    );
  }
}

abstract class _StatementLetter implements StatementLetter {
  factory _StatementLetter(
      {required final int id,
      required final String description,
      required final String sp,
      required final String date,
      required final String letterHead,
      required final String proof,
      required final String createdAt}) = _$StatementLetterImpl;

  factory _StatementLetter.fromJson(Map<String, dynamic> json) =
      _$StatementLetterImpl.fromJson;

  @override
  int get id;
  @override
  String get description;
  @override
  String get sp;
  @override
  String get date;
  @override
  String get letterHead;
  @override
  String get proof;
  @override
  String get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$StatementLetterImplCopyWith<_$StatementLetterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
