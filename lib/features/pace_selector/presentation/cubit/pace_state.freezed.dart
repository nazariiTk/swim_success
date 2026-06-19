// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pace_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PaceState {
  int get totalSeconds => throw _privateConstructorUsedError;
  SwimmerLevel get level => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  bool get isSubmitted => throw _privateConstructorUsedError;

  /// Create a copy of PaceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaceStateCopyWith<PaceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaceStateCopyWith<$Res> {
  factory $PaceStateCopyWith(PaceState value, $Res Function(PaceState) then) =
      _$PaceStateCopyWithImpl<$Res, PaceState>;
  @useResult
  $Res call({
    int totalSeconds,
    SwimmerLevel level,
    bool isLoading,
    String? errorMessage,
    bool isSubmitted,
  });
}

/// @nodoc
class _$PaceStateCopyWithImpl<$Res, $Val extends PaceState>
    implements $PaceStateCopyWith<$Res> {
  _$PaceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalSeconds = null,
    Object? level = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
    Object? isSubmitted = null,
  }) {
    return _then(
      _value.copyWith(
            totalSeconds: null == totalSeconds
                ? _value.totalSeconds
                : totalSeconds // ignore: cast_nullable_to_non_nullable
                      as int,
            level: null == level
                ? _value.level
                : level // ignore: cast_nullable_to_non_nullable
                      as SwimmerLevel,
            isLoading: null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
            errorMessage: freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
            isSubmitted: null == isSubmitted
                ? _value.isSubmitted
                : isSubmitted // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PaceStateImplCopyWith<$Res>
    implements $PaceStateCopyWith<$Res> {
  factory _$$PaceStateImplCopyWith(
    _$PaceStateImpl value,
    $Res Function(_$PaceStateImpl) then,
  ) = __$$PaceStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int totalSeconds,
    SwimmerLevel level,
    bool isLoading,
    String? errorMessage,
    bool isSubmitted,
  });
}

/// @nodoc
class __$$PaceStateImplCopyWithImpl<$Res>
    extends _$PaceStateCopyWithImpl<$Res, _$PaceStateImpl>
    implements _$$PaceStateImplCopyWith<$Res> {
  __$$PaceStateImplCopyWithImpl(
    _$PaceStateImpl _value,
    $Res Function(_$PaceStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PaceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalSeconds = null,
    Object? level = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
    Object? isSubmitted = null,
  }) {
    return _then(
      _$PaceStateImpl(
        totalSeconds: null == totalSeconds
            ? _value.totalSeconds
            : totalSeconds // ignore: cast_nullable_to_non_nullable
                  as int,
        level: null == level
            ? _value.level
            : level // ignore: cast_nullable_to_non_nullable
                  as SwimmerLevel,
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
        isSubmitted: null == isSubmitted
            ? _value.isSubmitted
            : isSubmitted // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$PaceStateImpl implements _PaceState {
  const _$PaceStateImpl({
    required this.totalSeconds,
    required this.level,
    this.isLoading = false,
    this.errorMessage,
    this.isSubmitted = false,
  });

  @override
  final int totalSeconds;
  @override
  final SwimmerLevel level;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? errorMessage;
  @override
  @JsonKey()
  final bool isSubmitted;

  @override
  String toString() {
    return 'PaceState(totalSeconds: $totalSeconds, level: $level, isLoading: $isLoading, errorMessage: $errorMessage, isSubmitted: $isSubmitted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaceStateImpl &&
            (identical(other.totalSeconds, totalSeconds) ||
                other.totalSeconds == totalSeconds) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.isSubmitted, isSubmitted) ||
                other.isSubmitted == isSubmitted));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    totalSeconds,
    level,
    isLoading,
    errorMessage,
    isSubmitted,
  );

  /// Create a copy of PaceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaceStateImplCopyWith<_$PaceStateImpl> get copyWith =>
      __$$PaceStateImplCopyWithImpl<_$PaceStateImpl>(this, _$identity);
}

abstract class _PaceState implements PaceState {
  const factory _PaceState({
    required final int totalSeconds,
    required final SwimmerLevel level,
    final bool isLoading,
    final String? errorMessage,
    final bool isSubmitted,
  }) = _$PaceStateImpl;

  @override
  int get totalSeconds;
  @override
  SwimmerLevel get level;
  @override
  bool get isLoading;
  @override
  String? get errorMessage;
  @override
  bool get isSubmitted;

  /// Create a copy of PaceState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaceStateImplCopyWith<_$PaceStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
