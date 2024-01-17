// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AttendanceDetail _$AttendanceDetailFromJson(Map<String, dynamic> json) {
  return _AttendanceDetail.fromJson(json);
}

/// @nodoc
mixin _$AttendanceDetail {
  int get id => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get time => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AttendanceDetailCopyWith<AttendanceDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceDetailCopyWith<$Res> {
  factory $AttendanceDetailCopyWith(
          AttendanceDetail value, $Res Function(AttendanceDetail) then) =
      _$AttendanceDetailCopyWithImpl<$Res, AttendanceDetail>;
  @useResult
  $Res call({int id, String status, String time, String date});
}

/// @nodoc
class _$AttendanceDetailCopyWithImpl<$Res, $Val extends AttendanceDetail>
    implements $AttendanceDetailCopyWith<$Res> {
  _$AttendanceDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? time = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AttendanceDetailImplCopyWith<$Res>
    implements $AttendanceDetailCopyWith<$Res> {
  factory _$$AttendanceDetailImplCopyWith(_$AttendanceDetailImpl value,
          $Res Function(_$AttendanceDetailImpl) then) =
      __$$AttendanceDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String status, String time, String date});
}

/// @nodoc
class __$$AttendanceDetailImplCopyWithImpl<$Res>
    extends _$AttendanceDetailCopyWithImpl<$Res, _$AttendanceDetailImpl>
    implements _$$AttendanceDetailImplCopyWith<$Res> {
  __$$AttendanceDetailImplCopyWithImpl(_$AttendanceDetailImpl _value,
      $Res Function(_$AttendanceDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? time = null,
    Object? date = null,
  }) {
    return _then(_$AttendanceDetailImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AttendanceDetailImpl implements _AttendanceDetail {
  const _$AttendanceDetailImpl(
      {required this.id,
      required this.status,
      required this.time,
      required this.date});

  factory _$AttendanceDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttendanceDetailImplFromJson(json);

  @override
  final int id;
  @override
  final String status;
  @override
  final String time;
  @override
  final String date;

  @override
  String toString() {
    return 'AttendanceDetail(id: $id, status: $status, time: $time, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendanceDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, status, time, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendanceDetailImplCopyWith<_$AttendanceDetailImpl> get copyWith =>
      __$$AttendanceDetailImplCopyWithImpl<_$AttendanceDetailImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttendanceDetailImplToJson(
      this,
    );
  }
}

abstract class _AttendanceDetail implements AttendanceDetail {
  const factory _AttendanceDetail(
      {required final int id,
      required final String status,
      required final String time,
      required final String date}) = _$AttendanceDetailImpl;

  factory _AttendanceDetail.fromJson(Map<String, dynamic> json) =
      _$AttendanceDetailImpl.fromJson;

  @override
  int get id;
  @override
  String get status;
  @override
  String get time;
  @override
  String get date;
  @override
  @JsonKey(ignore: true)
  _$$AttendanceDetailImplCopyWith<_$AttendanceDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
