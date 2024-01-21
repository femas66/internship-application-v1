// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'journal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Journal _$JournalFromJson(Map<String, dynamic> json) {
  return _Journal.fromJson(json);
}

/// @nodoc
mixin _$Journal {
  int get id => throw _privateConstructorUsedError;
  Student get student => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  String? get activity => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JournalCopyWith<Journal> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JournalCopyWith<$Res> {
  factory $JournalCopyWith(Journal value, $Res Function(Journal) then) =
      _$JournalCopyWithImpl<$Res, Journal>;
  @useResult
  $Res call(
      {int id, Student student, String? date, String? activity, String? image});

  $StudentCopyWith<$Res> get student;
}

/// @nodoc
class _$JournalCopyWithImpl<$Res, $Val extends Journal>
    implements $JournalCopyWith<$Res> {
  _$JournalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? student = null,
    Object? date = freezed,
    Object? activity = freezed,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      student: null == student
          ? _value.student
          : student // ignore: cast_nullable_to_non_nullable
              as Student,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      activity: freezed == activity
          ? _value.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StudentCopyWith<$Res> get student {
    return $StudentCopyWith<$Res>(_value.student, (value) {
      return _then(_value.copyWith(student: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$JournalImplCopyWith<$Res> implements $JournalCopyWith<$Res> {
  factory _$$JournalImplCopyWith(
          _$JournalImpl value, $Res Function(_$JournalImpl) then) =
      __$$JournalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, Student student, String? date, String? activity, String? image});

  @override
  $StudentCopyWith<$Res> get student;
}

/// @nodoc
class __$$JournalImplCopyWithImpl<$Res>
    extends _$JournalCopyWithImpl<$Res, _$JournalImpl>
    implements _$$JournalImplCopyWith<$Res> {
  __$$JournalImplCopyWithImpl(
      _$JournalImpl _value, $Res Function(_$JournalImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? student = null,
    Object? date = freezed,
    Object? activity = freezed,
    Object? image = freezed,
  }) {
    return _then(_$JournalImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      student: null == student
          ? _value.student
          : student // ignore: cast_nullable_to_non_nullable
              as Student,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      activity: freezed == activity
          ? _value.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JournalImpl implements _Journal {
  const _$JournalImpl(
      {required this.id,
      required this.student,
      this.date,
      this.activity,
      this.image});

  factory _$JournalImpl.fromJson(Map<String, dynamic> json) =>
      _$$JournalImplFromJson(json);

  @override
  final int id;
  @override
  final Student student;
  @override
  final String? date;
  @override
  final String? activity;
  @override
  final String? image;

  @override
  String toString() {
    return 'Journal(id: $id, student: $student, date: $date, activity: $activity, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JournalImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.student, student) || other.student == student) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.activity, activity) ||
                other.activity == activity) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, student, date, activity, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JournalImplCopyWith<_$JournalImpl> get copyWith =>
      __$$JournalImplCopyWithImpl<_$JournalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JournalImplToJson(
      this,
    );
  }
}

abstract class _Journal implements Journal {
  const factory _Journal(
      {required final int id,
      required final Student student,
      final String? date,
      final String? activity,
      final String? image}) = _$JournalImpl;

  factory _Journal.fromJson(Map<String, dynamic> json) = _$JournalImpl.fromJson;

  @override
  int get id;
  @override
  Student get student;
  @override
  String? get date;
  @override
  String? get activity;
  @override
  String? get image;
  @override
  @JsonKey(ignore: true)
  _$$JournalImplCopyWith<_$JournalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
