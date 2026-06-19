// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'users_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$UsersState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      List<User> users,
      List<User> filteredUsers,
      String searchPrompt,
    )
    success,
    required TResult Function(String message) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      List<User> users,
      List<User> filteredUsers,
      String searchPrompt,
    )?
    success,
    TResult? Function(String message)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      List<User> users,
      List<User> filteredUsers,
      String searchPrompt,
    )?
    success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UsersInitial value) initial,
    required TResult Function(UsersLoading value) loading,
    required TResult Function(UsersSuccess value) success,
    required TResult Function(UsersError value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UsersInitial value)? initial,
    TResult? Function(UsersLoading value)? loading,
    TResult? Function(UsersSuccess value)? success,
    TResult? Function(UsersError value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UsersInitial value)? initial,
    TResult Function(UsersLoading value)? loading,
    TResult Function(UsersSuccess value)? success,
    TResult Function(UsersError value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsersStateCopyWith<$Res> {
  factory $UsersStateCopyWith(
    UsersState value,
    $Res Function(UsersState) then,
  ) = _$UsersStateCopyWithImpl<$Res, UsersState>;
}

/// @nodoc
class _$UsersStateCopyWithImpl<$Res, $Val extends UsersState>
    implements $UsersStateCopyWith<$Res> {
  _$UsersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UsersState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$UsersInitialImplCopyWith<$Res> {
  factory _$$UsersInitialImplCopyWith(
    _$UsersInitialImpl value,
    $Res Function(_$UsersInitialImpl) then,
  ) = __$$UsersInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UsersInitialImplCopyWithImpl<$Res>
    extends _$UsersStateCopyWithImpl<$Res, _$UsersInitialImpl>
    implements _$$UsersInitialImplCopyWith<$Res> {
  __$$UsersInitialImplCopyWithImpl(
    _$UsersInitialImpl _value,
    $Res Function(_$UsersInitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UsersState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UsersInitialImpl implements UsersInitial {
  const _$UsersInitialImpl();

  @override
  String toString() {
    return 'UsersState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UsersInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      List<User> users,
      List<User> filteredUsers,
      String searchPrompt,
    )
    success,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      List<User> users,
      List<User> filteredUsers,
      String searchPrompt,
    )?
    success,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      List<User> users,
      List<User> filteredUsers,
      String searchPrompt,
    )?
    success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UsersInitial value) initial,
    required TResult Function(UsersLoading value) loading,
    required TResult Function(UsersSuccess value) success,
    required TResult Function(UsersError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UsersInitial value)? initial,
    TResult? Function(UsersLoading value)? loading,
    TResult? Function(UsersSuccess value)? success,
    TResult? Function(UsersError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UsersInitial value)? initial,
    TResult Function(UsersLoading value)? loading,
    TResult Function(UsersSuccess value)? success,
    TResult Function(UsersError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class UsersInitial implements UsersState {
  const factory UsersInitial() = _$UsersInitialImpl;
}

/// @nodoc
abstract class _$$UsersLoadingImplCopyWith<$Res> {
  factory _$$UsersLoadingImplCopyWith(
    _$UsersLoadingImpl value,
    $Res Function(_$UsersLoadingImpl) then,
  ) = __$$UsersLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UsersLoadingImplCopyWithImpl<$Res>
    extends _$UsersStateCopyWithImpl<$Res, _$UsersLoadingImpl>
    implements _$$UsersLoadingImplCopyWith<$Res> {
  __$$UsersLoadingImplCopyWithImpl(
    _$UsersLoadingImpl _value,
    $Res Function(_$UsersLoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UsersState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UsersLoadingImpl implements UsersLoading {
  const _$UsersLoadingImpl();

  @override
  String toString() {
    return 'UsersState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UsersLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      List<User> users,
      List<User> filteredUsers,
      String searchPrompt,
    )
    success,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      List<User> users,
      List<User> filteredUsers,
      String searchPrompt,
    )?
    success,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      List<User> users,
      List<User> filteredUsers,
      String searchPrompt,
    )?
    success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UsersInitial value) initial,
    required TResult Function(UsersLoading value) loading,
    required TResult Function(UsersSuccess value) success,
    required TResult Function(UsersError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UsersInitial value)? initial,
    TResult? Function(UsersLoading value)? loading,
    TResult? Function(UsersSuccess value)? success,
    TResult? Function(UsersError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UsersInitial value)? initial,
    TResult Function(UsersLoading value)? loading,
    TResult Function(UsersSuccess value)? success,
    TResult Function(UsersError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class UsersLoading implements UsersState {
  const factory UsersLoading() = _$UsersLoadingImpl;
}

/// @nodoc
abstract class _$$UsersSuccessImplCopyWith<$Res> {
  factory _$$UsersSuccessImplCopyWith(
    _$UsersSuccessImpl value,
    $Res Function(_$UsersSuccessImpl) then,
  ) = __$$UsersSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<User> users, List<User> filteredUsers, String searchPrompt});
}

/// @nodoc
class __$$UsersSuccessImplCopyWithImpl<$Res>
    extends _$UsersStateCopyWithImpl<$Res, _$UsersSuccessImpl>
    implements _$$UsersSuccessImplCopyWith<$Res> {
  __$$UsersSuccessImplCopyWithImpl(
    _$UsersSuccessImpl _value,
    $Res Function(_$UsersSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UsersState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = null,
    Object? filteredUsers = null,
    Object? searchPrompt = null,
  }) {
    return _then(
      _$UsersSuccessImpl(
        users: null == users
            ? _value._users
            : users // ignore: cast_nullable_to_non_nullable
                  as List<User>,
        filteredUsers: null == filteredUsers
            ? _value._filteredUsers
            : filteredUsers // ignore: cast_nullable_to_non_nullable
                  as List<User>,
        searchPrompt: null == searchPrompt
            ? _value.searchPrompt
            : searchPrompt // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$UsersSuccessImpl implements UsersSuccess {
  const _$UsersSuccessImpl({
    required final List<User> users,
    required final List<User> filteredUsers,
    this.searchPrompt = '',
  }) : _users = users,
       _filteredUsers = filteredUsers;

  final List<User> _users;
  @override
  List<User> get users {
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  final List<User> _filteredUsers;
  @override
  List<User> get filteredUsers {
    if (_filteredUsers is EqualUnmodifiableListView) return _filteredUsers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteredUsers);
  }

  @override
  @JsonKey()
  final String searchPrompt;

  @override
  String toString() {
    return 'UsersState.success(users: $users, filteredUsers: $filteredUsers, searchPrompt: $searchPrompt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsersSuccessImpl &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            const DeepCollectionEquality().equals(
              other._filteredUsers,
              _filteredUsers,
            ) &&
            (identical(other.searchPrompt, searchPrompt) ||
                other.searchPrompt == searchPrompt));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_users),
    const DeepCollectionEquality().hash(_filteredUsers),
    searchPrompt,
  );

  /// Create a copy of UsersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UsersSuccessImplCopyWith<_$UsersSuccessImpl> get copyWith =>
      __$$UsersSuccessImplCopyWithImpl<_$UsersSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      List<User> users,
      List<User> filteredUsers,
      String searchPrompt,
    )
    success,
    required TResult Function(String message) error,
  }) {
    return success(users, filteredUsers, searchPrompt);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      List<User> users,
      List<User> filteredUsers,
      String searchPrompt,
    )?
    success,
    TResult? Function(String message)? error,
  }) {
    return success?.call(users, filteredUsers, searchPrompt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      List<User> users,
      List<User> filteredUsers,
      String searchPrompt,
    )?
    success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(users, filteredUsers, searchPrompt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UsersInitial value) initial,
    required TResult Function(UsersLoading value) loading,
    required TResult Function(UsersSuccess value) success,
    required TResult Function(UsersError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UsersInitial value)? initial,
    TResult? Function(UsersLoading value)? loading,
    TResult? Function(UsersSuccess value)? success,
    TResult? Function(UsersError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UsersInitial value)? initial,
    TResult Function(UsersLoading value)? loading,
    TResult Function(UsersSuccess value)? success,
    TResult Function(UsersError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class UsersSuccess implements UsersState {
  const factory UsersSuccess({
    required final List<User> users,
    required final List<User> filteredUsers,
    final String searchPrompt,
  }) = _$UsersSuccessImpl;

  List<User> get users;
  List<User> get filteredUsers;
  String get searchPrompt;

  /// Create a copy of UsersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UsersSuccessImplCopyWith<_$UsersSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UsersErrorImplCopyWith<$Res> {
  factory _$$UsersErrorImplCopyWith(
    _$UsersErrorImpl value,
    $Res Function(_$UsersErrorImpl) then,
  ) = __$$UsersErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$UsersErrorImplCopyWithImpl<$Res>
    extends _$UsersStateCopyWithImpl<$Res, _$UsersErrorImpl>
    implements _$$UsersErrorImplCopyWith<$Res> {
  __$$UsersErrorImplCopyWithImpl(
    _$UsersErrorImpl _value,
    $Res Function(_$UsersErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UsersState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$UsersErrorImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$UsersErrorImpl implements UsersError {
  const _$UsersErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'UsersState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsersErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of UsersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UsersErrorImplCopyWith<_$UsersErrorImpl> get copyWith =>
      __$$UsersErrorImplCopyWithImpl<_$UsersErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      List<User> users,
      List<User> filteredUsers,
      String searchPrompt,
    )
    success,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      List<User> users,
      List<User> filteredUsers,
      String searchPrompt,
    )?
    success,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      List<User> users,
      List<User> filteredUsers,
      String searchPrompt,
    )?
    success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UsersInitial value) initial,
    required TResult Function(UsersLoading value) loading,
    required TResult Function(UsersSuccess value) success,
    required TResult Function(UsersError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UsersInitial value)? initial,
    TResult? Function(UsersLoading value)? loading,
    TResult? Function(UsersSuccess value)? success,
    TResult? Function(UsersError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UsersInitial value)? initial,
    TResult Function(UsersLoading value)? loading,
    TResult Function(UsersSuccess value)? success,
    TResult Function(UsersError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class UsersError implements UsersState {
  const factory UsersError(final String message) = _$UsersErrorImpl;

  String get message;

  /// Create a copy of UsersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UsersErrorImplCopyWith<_$UsersErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
