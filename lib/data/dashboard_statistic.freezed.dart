// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_statistic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DashboardStatistic _$DashboardStatisticFromJson(Map<String, dynamic> json) {
  return _DashboardStatistic.fromJson(json);
}

/// @nodoc
mixin _$DashboardStatistic {
  int get present => throw _privateConstructorUsedError;
  int get permission => throw _privateConstructorUsedError;
  int get alpha => throw _privateConstructorUsedError;
  int get journal => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DashboardStatisticCopyWith<DashboardStatistic> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardStatisticCopyWith<$Res> {
  factory $DashboardStatisticCopyWith(
          DashboardStatistic value, $Res Function(DashboardStatistic) then) =
      _$DashboardStatisticCopyWithImpl<$Res, DashboardStatistic>;
  @useResult
  $Res call({int present, int permission, int alpha, int journal});
}

/// @nodoc
class _$DashboardStatisticCopyWithImpl<$Res, $Val extends DashboardStatistic>
    implements $DashboardStatisticCopyWith<$Res> {
  _$DashboardStatisticCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? present = null,
    Object? permission = null,
    Object? alpha = null,
    Object? journal = null,
  }) {
    return _then(_value.copyWith(
      present: null == present
          ? _value.present
          : present // ignore: cast_nullable_to_non_nullable
              as int,
      permission: null == permission
          ? _value.permission
          : permission // ignore: cast_nullable_to_non_nullable
              as int,
      alpha: null == alpha
          ? _value.alpha
          : alpha // ignore: cast_nullable_to_non_nullable
              as int,
      journal: null == journal
          ? _value.journal
          : journal // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DashboardStatisticImplCopyWith<$Res>
    implements $DashboardStatisticCopyWith<$Res> {
  factory _$$DashboardStatisticImplCopyWith(_$DashboardStatisticImpl value,
          $Res Function(_$DashboardStatisticImpl) then) =
      __$$DashboardStatisticImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int present, int permission, int alpha, int journal});
}

/// @nodoc
class __$$DashboardStatisticImplCopyWithImpl<$Res>
    extends _$DashboardStatisticCopyWithImpl<$Res, _$DashboardStatisticImpl>
    implements _$$DashboardStatisticImplCopyWith<$Res> {
  __$$DashboardStatisticImplCopyWithImpl(_$DashboardStatisticImpl _value,
      $Res Function(_$DashboardStatisticImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? present = null,
    Object? permission = null,
    Object? alpha = null,
    Object? journal = null,
  }) {
    return _then(_$DashboardStatisticImpl(
      present: null == present
          ? _value.present
          : present // ignore: cast_nullable_to_non_nullable
              as int,
      permission: null == permission
          ? _value.permission
          : permission // ignore: cast_nullable_to_non_nullable
              as int,
      alpha: null == alpha
          ? _value.alpha
          : alpha // ignore: cast_nullable_to_non_nullable
              as int,
      journal: null == journal
          ? _value.journal
          : journal // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardStatisticImpl implements _DashboardStatistic {
  _$DashboardStatisticImpl(
      {required this.present,
      required this.permission,
      required this.alpha,
      required this.journal});

  factory _$DashboardStatisticImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardStatisticImplFromJson(json);

  @override
  final int present;
  @override
  final int permission;
  @override
  final int alpha;
  @override
  final int journal;

  @override
  String toString() {
    return 'DashboardStatistic(present: $present, permission: $permission, alpha: $alpha, journal: $journal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardStatisticImpl &&
            (identical(other.present, present) || other.present == present) &&
            (identical(other.permission, permission) ||
                other.permission == permission) &&
            (identical(other.alpha, alpha) || other.alpha == alpha) &&
            (identical(other.journal, journal) || other.journal == journal));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, present, permission, alpha, journal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardStatisticImplCopyWith<_$DashboardStatisticImpl> get copyWith =>
      __$$DashboardStatisticImplCopyWithImpl<_$DashboardStatisticImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardStatisticImplToJson(
      this,
    );
  }
}

abstract class _DashboardStatistic implements DashboardStatistic {
  factory _DashboardStatistic(
      {required final int present,
      required final int permission,
      required final int alpha,
      required final int journal}) = _$DashboardStatisticImpl;

  factory _DashboardStatistic.fromJson(Map<String, dynamic> json) =
      _$DashboardStatisticImpl.fromJson;

  @override
  int get present;
  @override
  int get permission;
  @override
  int get alpha;
  @override
  int get journal;
  @override
  @JsonKey(ignore: true)
  _$$DashboardStatisticImplCopyWith<_$DashboardStatisticImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
