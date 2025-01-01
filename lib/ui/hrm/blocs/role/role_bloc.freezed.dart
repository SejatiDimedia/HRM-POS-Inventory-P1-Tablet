// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'role_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RoleEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() fetch,
    required TResult Function(Role newRole) addNewRole,
    required TResult Function(RoleRequestModel dataRequest) add,
    required TResult Function(RolePermissionRequestModel dataRequest, int id)
        edit,
    required TResult Function(Role updatedRole) updateRole,
    required TResult Function(int id) delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? fetch,
    TResult? Function(Role newRole)? addNewRole,
    TResult? Function(RoleRequestModel dataRequest)? add,
    TResult? Function(RolePermissionRequestModel dataRequest, int id)? edit,
    TResult? Function(Role updatedRole)? updateRole,
    TResult? Function(int id)? delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? fetch,
    TResult Function(Role newRole)? addNewRole,
    TResult Function(RoleRequestModel dataRequest)? add,
    TResult Function(RolePermissionRequestModel dataRequest, int id)? edit,
    TResult Function(Role updatedRole)? updateRole,
    TResult Function(int id)? delete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_AddNewRole value) addNewRole,
    required TResult Function(_Add value) add,
    required TResult Function(_Edit value) edit,
    required TResult Function(_UpdateRole value) updateRole,
    required TResult Function(_Delete value) delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AddNewRole value)? addNewRole,
    TResult? Function(_Add value)? add,
    TResult? Function(_Edit value)? edit,
    TResult? Function(_UpdateRole value)? updateRole,
    TResult? Function(_Delete value)? delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddNewRole value)? addNewRole,
    TResult Function(_Add value)? add,
    TResult Function(_Edit value)? edit,
    TResult Function(_UpdateRole value)? updateRole,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoleEventCopyWith<$Res> {
  factory $RoleEventCopyWith(RoleEvent value, $Res Function(RoleEvent) then) =
      _$RoleEventCopyWithImpl<$Res, RoleEvent>;
}

/// @nodoc
class _$RoleEventCopyWithImpl<$Res, $Val extends RoleEvent>
    implements $RoleEventCopyWith<$Res> {
  _$RoleEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$RoleEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'RoleEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() fetch,
    required TResult Function(Role newRole) addNewRole,
    required TResult Function(RoleRequestModel dataRequest) add,
    required TResult Function(RolePermissionRequestModel dataRequest, int id)
        edit,
    required TResult Function(Role updatedRole) updateRole,
    required TResult Function(int id) delete,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? fetch,
    TResult? Function(Role newRole)? addNewRole,
    TResult? Function(RoleRequestModel dataRequest)? add,
    TResult? Function(RolePermissionRequestModel dataRequest, int id)? edit,
    TResult? Function(Role updatedRole)? updateRole,
    TResult? Function(int id)? delete,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? fetch,
    TResult Function(Role newRole)? addNewRole,
    TResult Function(RoleRequestModel dataRequest)? add,
    TResult Function(RolePermissionRequestModel dataRequest, int id)? edit,
    TResult Function(Role updatedRole)? updateRole,
    TResult Function(int id)? delete,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_AddNewRole value) addNewRole,
    required TResult Function(_Add value) add,
    required TResult Function(_Edit value) edit,
    required TResult Function(_UpdateRole value) updateRole,
    required TResult Function(_Delete value) delete,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AddNewRole value)? addNewRole,
    TResult? Function(_Add value)? add,
    TResult? Function(_Edit value)? edit,
    TResult? Function(_UpdateRole value)? updateRole,
    TResult? Function(_Delete value)? delete,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddNewRole value)? addNewRole,
    TResult Function(_Add value)? add,
    TResult Function(_Edit value)? edit,
    TResult Function(_UpdateRole value)? updateRole,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements RoleEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$FetchImplCopyWith<$Res> {
  factory _$$FetchImplCopyWith(
          _$FetchImpl value, $Res Function(_$FetchImpl) then) =
      __$$FetchImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchImplCopyWithImpl<$Res>
    extends _$RoleEventCopyWithImpl<$Res, _$FetchImpl>
    implements _$$FetchImplCopyWith<$Res> {
  __$$FetchImplCopyWithImpl(
      _$FetchImpl _value, $Res Function(_$FetchImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchImpl implements _Fetch {
  const _$FetchImpl();

  @override
  String toString() {
    return 'RoleEvent.fetch()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() fetch,
    required TResult Function(Role newRole) addNewRole,
    required TResult Function(RoleRequestModel dataRequest) add,
    required TResult Function(RolePermissionRequestModel dataRequest, int id)
        edit,
    required TResult Function(Role updatedRole) updateRole,
    required TResult Function(int id) delete,
  }) {
    return fetch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? fetch,
    TResult? Function(Role newRole)? addNewRole,
    TResult? Function(RoleRequestModel dataRequest)? add,
    TResult? Function(RolePermissionRequestModel dataRequest, int id)? edit,
    TResult? Function(Role updatedRole)? updateRole,
    TResult? Function(int id)? delete,
  }) {
    return fetch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? fetch,
    TResult Function(Role newRole)? addNewRole,
    TResult Function(RoleRequestModel dataRequest)? add,
    TResult Function(RolePermissionRequestModel dataRequest, int id)? edit,
    TResult Function(Role updatedRole)? updateRole,
    TResult Function(int id)? delete,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_AddNewRole value) addNewRole,
    required TResult Function(_Add value) add,
    required TResult Function(_Edit value) edit,
    required TResult Function(_UpdateRole value) updateRole,
    required TResult Function(_Delete value) delete,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AddNewRole value)? addNewRole,
    TResult? Function(_Add value)? add,
    TResult? Function(_Edit value)? edit,
    TResult? Function(_UpdateRole value)? updateRole,
    TResult? Function(_Delete value)? delete,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddNewRole value)? addNewRole,
    TResult Function(_Add value)? add,
    TResult Function(_Edit value)? edit,
    TResult Function(_UpdateRole value)? updateRole,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements RoleEvent {
  const factory _Fetch() = _$FetchImpl;
}

/// @nodoc
abstract class _$$AddNewRoleImplCopyWith<$Res> {
  factory _$$AddNewRoleImplCopyWith(
          _$AddNewRoleImpl value, $Res Function(_$AddNewRoleImpl) then) =
      __$$AddNewRoleImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Role newRole});
}

/// @nodoc
class __$$AddNewRoleImplCopyWithImpl<$Res>
    extends _$RoleEventCopyWithImpl<$Res, _$AddNewRoleImpl>
    implements _$$AddNewRoleImplCopyWith<$Res> {
  __$$AddNewRoleImplCopyWithImpl(
      _$AddNewRoleImpl _value, $Res Function(_$AddNewRoleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newRole = null,
  }) {
    return _then(_$AddNewRoleImpl(
      null == newRole
          ? _value.newRole
          : newRole // ignore: cast_nullable_to_non_nullable
              as Role,
    ));
  }
}

/// @nodoc

class _$AddNewRoleImpl implements _AddNewRole {
  const _$AddNewRoleImpl(this.newRole);

  @override
  final Role newRole;

  @override
  String toString() {
    return 'RoleEvent.addNewRole(newRole: $newRole)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddNewRoleImpl &&
            (identical(other.newRole, newRole) || other.newRole == newRole));
  }

  @override
  int get hashCode => Object.hash(runtimeType, newRole);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddNewRoleImplCopyWith<_$AddNewRoleImpl> get copyWith =>
      __$$AddNewRoleImplCopyWithImpl<_$AddNewRoleImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() fetch,
    required TResult Function(Role newRole) addNewRole,
    required TResult Function(RoleRequestModel dataRequest) add,
    required TResult Function(RolePermissionRequestModel dataRequest, int id)
        edit,
    required TResult Function(Role updatedRole) updateRole,
    required TResult Function(int id) delete,
  }) {
    return addNewRole(newRole);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? fetch,
    TResult? Function(Role newRole)? addNewRole,
    TResult? Function(RoleRequestModel dataRequest)? add,
    TResult? Function(RolePermissionRequestModel dataRequest, int id)? edit,
    TResult? Function(Role updatedRole)? updateRole,
    TResult? Function(int id)? delete,
  }) {
    return addNewRole?.call(newRole);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? fetch,
    TResult Function(Role newRole)? addNewRole,
    TResult Function(RoleRequestModel dataRequest)? add,
    TResult Function(RolePermissionRequestModel dataRequest, int id)? edit,
    TResult Function(Role updatedRole)? updateRole,
    TResult Function(int id)? delete,
    required TResult orElse(),
  }) {
    if (addNewRole != null) {
      return addNewRole(newRole);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_AddNewRole value) addNewRole,
    required TResult Function(_Add value) add,
    required TResult Function(_Edit value) edit,
    required TResult Function(_UpdateRole value) updateRole,
    required TResult Function(_Delete value) delete,
  }) {
    return addNewRole(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AddNewRole value)? addNewRole,
    TResult? Function(_Add value)? add,
    TResult? Function(_Edit value)? edit,
    TResult? Function(_UpdateRole value)? updateRole,
    TResult? Function(_Delete value)? delete,
  }) {
    return addNewRole?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddNewRole value)? addNewRole,
    TResult Function(_Add value)? add,
    TResult Function(_Edit value)? edit,
    TResult Function(_UpdateRole value)? updateRole,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (addNewRole != null) {
      return addNewRole(this);
    }
    return orElse();
  }
}

abstract class _AddNewRole implements RoleEvent {
  const factory _AddNewRole(final Role newRole) = _$AddNewRoleImpl;

  Role get newRole;
  @JsonKey(ignore: true)
  _$$AddNewRoleImplCopyWith<_$AddNewRoleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddImplCopyWith<$Res> {
  factory _$$AddImplCopyWith(_$AddImpl value, $Res Function(_$AddImpl) then) =
      __$$AddImplCopyWithImpl<$Res>;
  @useResult
  $Res call({RoleRequestModel dataRequest});
}

/// @nodoc
class __$$AddImplCopyWithImpl<$Res>
    extends _$RoleEventCopyWithImpl<$Res, _$AddImpl>
    implements _$$AddImplCopyWith<$Res> {
  __$$AddImplCopyWithImpl(_$AddImpl _value, $Res Function(_$AddImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dataRequest = null,
  }) {
    return _then(_$AddImpl(
      null == dataRequest
          ? _value.dataRequest
          : dataRequest // ignore: cast_nullable_to_non_nullable
              as RoleRequestModel,
    ));
  }
}

/// @nodoc

class _$AddImpl implements _Add {
  const _$AddImpl(this.dataRequest);

  @override
  final RoleRequestModel dataRequest;

  @override
  String toString() {
    return 'RoleEvent.add(dataRequest: $dataRequest)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddImpl &&
            (identical(other.dataRequest, dataRequest) ||
                other.dataRequest == dataRequest));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dataRequest);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddImplCopyWith<_$AddImpl> get copyWith =>
      __$$AddImplCopyWithImpl<_$AddImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() fetch,
    required TResult Function(Role newRole) addNewRole,
    required TResult Function(RoleRequestModel dataRequest) add,
    required TResult Function(RolePermissionRequestModel dataRequest, int id)
        edit,
    required TResult Function(Role updatedRole) updateRole,
    required TResult Function(int id) delete,
  }) {
    return add(dataRequest);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? fetch,
    TResult? Function(Role newRole)? addNewRole,
    TResult? Function(RoleRequestModel dataRequest)? add,
    TResult? Function(RolePermissionRequestModel dataRequest, int id)? edit,
    TResult? Function(Role updatedRole)? updateRole,
    TResult? Function(int id)? delete,
  }) {
    return add?.call(dataRequest);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? fetch,
    TResult Function(Role newRole)? addNewRole,
    TResult Function(RoleRequestModel dataRequest)? add,
    TResult Function(RolePermissionRequestModel dataRequest, int id)? edit,
    TResult Function(Role updatedRole)? updateRole,
    TResult Function(int id)? delete,
    required TResult orElse(),
  }) {
    if (add != null) {
      return add(dataRequest);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_AddNewRole value) addNewRole,
    required TResult Function(_Add value) add,
    required TResult Function(_Edit value) edit,
    required TResult Function(_UpdateRole value) updateRole,
    required TResult Function(_Delete value) delete,
  }) {
    return add(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AddNewRole value)? addNewRole,
    TResult? Function(_Add value)? add,
    TResult? Function(_Edit value)? edit,
    TResult? Function(_UpdateRole value)? updateRole,
    TResult? Function(_Delete value)? delete,
  }) {
    return add?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddNewRole value)? addNewRole,
    TResult Function(_Add value)? add,
    TResult Function(_Edit value)? edit,
    TResult Function(_UpdateRole value)? updateRole,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (add != null) {
      return add(this);
    }
    return orElse();
  }
}

abstract class _Add implements RoleEvent {
  const factory _Add(final RoleRequestModel dataRequest) = _$AddImpl;

  RoleRequestModel get dataRequest;
  @JsonKey(ignore: true)
  _$$AddImplCopyWith<_$AddImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EditImplCopyWith<$Res> {
  factory _$$EditImplCopyWith(
          _$EditImpl value, $Res Function(_$EditImpl) then) =
      __$$EditImplCopyWithImpl<$Res>;
  @useResult
  $Res call({RolePermissionRequestModel dataRequest, int id});
}

/// @nodoc
class __$$EditImplCopyWithImpl<$Res>
    extends _$RoleEventCopyWithImpl<$Res, _$EditImpl>
    implements _$$EditImplCopyWith<$Res> {
  __$$EditImplCopyWithImpl(_$EditImpl _value, $Res Function(_$EditImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dataRequest = null,
    Object? id = null,
  }) {
    return _then(_$EditImpl(
      null == dataRequest
          ? _value.dataRequest
          : dataRequest // ignore: cast_nullable_to_non_nullable
              as RolePermissionRequestModel,
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$EditImpl implements _Edit {
  const _$EditImpl(this.dataRequest, this.id);

  @override
  final RolePermissionRequestModel dataRequest;
  @override
  final int id;

  @override
  String toString() {
    return 'RoleEvent.edit(dataRequest: $dataRequest, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditImpl &&
            (identical(other.dataRequest, dataRequest) ||
                other.dataRequest == dataRequest) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dataRequest, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditImplCopyWith<_$EditImpl> get copyWith =>
      __$$EditImplCopyWithImpl<_$EditImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() fetch,
    required TResult Function(Role newRole) addNewRole,
    required TResult Function(RoleRequestModel dataRequest) add,
    required TResult Function(RolePermissionRequestModel dataRequest, int id)
        edit,
    required TResult Function(Role updatedRole) updateRole,
    required TResult Function(int id) delete,
  }) {
    return edit(dataRequest, id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? fetch,
    TResult? Function(Role newRole)? addNewRole,
    TResult? Function(RoleRequestModel dataRequest)? add,
    TResult? Function(RolePermissionRequestModel dataRequest, int id)? edit,
    TResult? Function(Role updatedRole)? updateRole,
    TResult? Function(int id)? delete,
  }) {
    return edit?.call(dataRequest, id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? fetch,
    TResult Function(Role newRole)? addNewRole,
    TResult Function(RoleRequestModel dataRequest)? add,
    TResult Function(RolePermissionRequestModel dataRequest, int id)? edit,
    TResult Function(Role updatedRole)? updateRole,
    TResult Function(int id)? delete,
    required TResult orElse(),
  }) {
    if (edit != null) {
      return edit(dataRequest, id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_AddNewRole value) addNewRole,
    required TResult Function(_Add value) add,
    required TResult Function(_Edit value) edit,
    required TResult Function(_UpdateRole value) updateRole,
    required TResult Function(_Delete value) delete,
  }) {
    return edit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AddNewRole value)? addNewRole,
    TResult? Function(_Add value)? add,
    TResult? Function(_Edit value)? edit,
    TResult? Function(_UpdateRole value)? updateRole,
    TResult? Function(_Delete value)? delete,
  }) {
    return edit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddNewRole value)? addNewRole,
    TResult Function(_Add value)? add,
    TResult Function(_Edit value)? edit,
    TResult Function(_UpdateRole value)? updateRole,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (edit != null) {
      return edit(this);
    }
    return orElse();
  }
}

abstract class _Edit implements RoleEvent {
  const factory _Edit(
      final RolePermissionRequestModel dataRequest, final int id) = _$EditImpl;

  RolePermissionRequestModel get dataRequest;
  int get id;
  @JsonKey(ignore: true)
  _$$EditImplCopyWith<_$EditImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateRoleImplCopyWith<$Res> {
  factory _$$UpdateRoleImplCopyWith(
          _$UpdateRoleImpl value, $Res Function(_$UpdateRoleImpl) then) =
      __$$UpdateRoleImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Role updatedRole});
}

/// @nodoc
class __$$UpdateRoleImplCopyWithImpl<$Res>
    extends _$RoleEventCopyWithImpl<$Res, _$UpdateRoleImpl>
    implements _$$UpdateRoleImplCopyWith<$Res> {
  __$$UpdateRoleImplCopyWithImpl(
      _$UpdateRoleImpl _value, $Res Function(_$UpdateRoleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? updatedRole = null,
  }) {
    return _then(_$UpdateRoleImpl(
      null == updatedRole
          ? _value.updatedRole
          : updatedRole // ignore: cast_nullable_to_non_nullable
              as Role,
    ));
  }
}

/// @nodoc

class _$UpdateRoleImpl implements _UpdateRole {
  const _$UpdateRoleImpl(this.updatedRole);

  @override
  final Role updatedRole;

  @override
  String toString() {
    return 'RoleEvent.updateRole(updatedRole: $updatedRole)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateRoleImpl &&
            (identical(other.updatedRole, updatedRole) ||
                other.updatedRole == updatedRole));
  }

  @override
  int get hashCode => Object.hash(runtimeType, updatedRole);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateRoleImplCopyWith<_$UpdateRoleImpl> get copyWith =>
      __$$UpdateRoleImplCopyWithImpl<_$UpdateRoleImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() fetch,
    required TResult Function(Role newRole) addNewRole,
    required TResult Function(RoleRequestModel dataRequest) add,
    required TResult Function(RolePermissionRequestModel dataRequest, int id)
        edit,
    required TResult Function(Role updatedRole) updateRole,
    required TResult Function(int id) delete,
  }) {
    return updateRole(updatedRole);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? fetch,
    TResult? Function(Role newRole)? addNewRole,
    TResult? Function(RoleRequestModel dataRequest)? add,
    TResult? Function(RolePermissionRequestModel dataRequest, int id)? edit,
    TResult? Function(Role updatedRole)? updateRole,
    TResult? Function(int id)? delete,
  }) {
    return updateRole?.call(updatedRole);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? fetch,
    TResult Function(Role newRole)? addNewRole,
    TResult Function(RoleRequestModel dataRequest)? add,
    TResult Function(RolePermissionRequestModel dataRequest, int id)? edit,
    TResult Function(Role updatedRole)? updateRole,
    TResult Function(int id)? delete,
    required TResult orElse(),
  }) {
    if (updateRole != null) {
      return updateRole(updatedRole);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_AddNewRole value) addNewRole,
    required TResult Function(_Add value) add,
    required TResult Function(_Edit value) edit,
    required TResult Function(_UpdateRole value) updateRole,
    required TResult Function(_Delete value) delete,
  }) {
    return updateRole(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AddNewRole value)? addNewRole,
    TResult? Function(_Add value)? add,
    TResult? Function(_Edit value)? edit,
    TResult? Function(_UpdateRole value)? updateRole,
    TResult? Function(_Delete value)? delete,
  }) {
    return updateRole?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddNewRole value)? addNewRole,
    TResult Function(_Add value)? add,
    TResult Function(_Edit value)? edit,
    TResult Function(_UpdateRole value)? updateRole,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (updateRole != null) {
      return updateRole(this);
    }
    return orElse();
  }
}

abstract class _UpdateRole implements RoleEvent {
  const factory _UpdateRole(final Role updatedRole) = _$UpdateRoleImpl;

  Role get updatedRole;
  @JsonKey(ignore: true)
  _$$UpdateRoleImplCopyWith<_$UpdateRoleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteImplCopyWith<$Res> {
  factory _$$DeleteImplCopyWith(
          _$DeleteImpl value, $Res Function(_$DeleteImpl) then) =
      __$$DeleteImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$DeleteImplCopyWithImpl<$Res>
    extends _$RoleEventCopyWithImpl<$Res, _$DeleteImpl>
    implements _$$DeleteImplCopyWith<$Res> {
  __$$DeleteImplCopyWithImpl(
      _$DeleteImpl _value, $Res Function(_$DeleteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$DeleteImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DeleteImpl implements _Delete {
  const _$DeleteImpl(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'RoleEvent.delete(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteImplCopyWith<_$DeleteImpl> get copyWith =>
      __$$DeleteImplCopyWithImpl<_$DeleteImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() fetch,
    required TResult Function(Role newRole) addNewRole,
    required TResult Function(RoleRequestModel dataRequest) add,
    required TResult Function(RolePermissionRequestModel dataRequest, int id)
        edit,
    required TResult Function(Role updatedRole) updateRole,
    required TResult Function(int id) delete,
  }) {
    return delete(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? fetch,
    TResult? Function(Role newRole)? addNewRole,
    TResult? Function(RoleRequestModel dataRequest)? add,
    TResult? Function(RolePermissionRequestModel dataRequest, int id)? edit,
    TResult? Function(Role updatedRole)? updateRole,
    TResult? Function(int id)? delete,
  }) {
    return delete?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? fetch,
    TResult Function(Role newRole)? addNewRole,
    TResult Function(RoleRequestModel dataRequest)? add,
    TResult Function(RolePermissionRequestModel dataRequest, int id)? edit,
    TResult Function(Role updatedRole)? updateRole,
    TResult Function(int id)? delete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_AddNewRole value) addNewRole,
    required TResult Function(_Add value) add,
    required TResult Function(_Edit value) edit,
    required TResult Function(_UpdateRole value) updateRole,
    required TResult Function(_Delete value) delete,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AddNewRole value)? addNewRole,
    TResult? Function(_Add value)? add,
    TResult? Function(_Edit value)? edit,
    TResult? Function(_UpdateRole value)? updateRole,
    TResult? Function(_Delete value)? delete,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddNewRole value)? addNewRole,
    TResult Function(_Add value)? add,
    TResult Function(_Edit value)? edit,
    TResult Function(_UpdateRole value)? updateRole,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class _Delete implements RoleEvent {
  const factory _Delete(final int id) = _$DeleteImpl;

  int get id;
  @JsonKey(ignore: true)
  _$$DeleteImplCopyWith<_$DeleteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RoleState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Role> data) success,
    required TResult Function(AddRoleResponseModel data) successAdd,
    required TResult Function(EditRolePermissionResponseModel data) successEdit,
    required TResult Function(DeleteResponseModel data) successDelete,
    required TResult Function(String message) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Role> data)? success,
    TResult? Function(AddRoleResponseModel data)? successAdd,
    TResult? Function(EditRolePermissionResponseModel data)? successEdit,
    TResult? Function(DeleteResponseModel data)? successDelete,
    TResult? Function(String message)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Role> data)? success,
    TResult Function(AddRoleResponseModel data)? successAdd,
    TResult Function(EditRolePermissionResponseModel data)? successEdit,
    TResult Function(DeleteResponseModel data)? successDelete,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_SuccessAdd value) successAdd,
    required TResult Function(_SuccessEdit value) successEdit,
    required TResult Function(_SuccessDelete value) successDelete,
    required TResult Function(_Failed value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_SuccessAdd value)? successAdd,
    TResult? Function(_SuccessEdit value)? successEdit,
    TResult? Function(_SuccessDelete value)? successDelete,
    TResult? Function(_Failed value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_SuccessAdd value)? successAdd,
    TResult Function(_SuccessEdit value)? successEdit,
    TResult Function(_SuccessDelete value)? successDelete,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoleStateCopyWith<$Res> {
  factory $RoleStateCopyWith(RoleState value, $Res Function(RoleState) then) =
      _$RoleStateCopyWithImpl<$Res, RoleState>;
}

/// @nodoc
class _$RoleStateCopyWithImpl<$Res, $Val extends RoleState>
    implements $RoleStateCopyWith<$Res> {
  _$RoleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$RoleStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'RoleState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Role> data) success,
    required TResult Function(AddRoleResponseModel data) successAdd,
    required TResult Function(EditRolePermissionResponseModel data) successEdit,
    required TResult Function(DeleteResponseModel data) successDelete,
    required TResult Function(String message) failed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Role> data)? success,
    TResult? Function(AddRoleResponseModel data)? successAdd,
    TResult? Function(EditRolePermissionResponseModel data)? successEdit,
    TResult? Function(DeleteResponseModel data)? successDelete,
    TResult? Function(String message)? failed,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Role> data)? success,
    TResult Function(AddRoleResponseModel data)? successAdd,
    TResult Function(EditRolePermissionResponseModel data)? successEdit,
    TResult Function(DeleteResponseModel data)? successDelete,
    TResult Function(String message)? failed,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_SuccessAdd value) successAdd,
    required TResult Function(_SuccessEdit value) successEdit,
    required TResult Function(_SuccessDelete value) successDelete,
    required TResult Function(_Failed value) failed,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_SuccessAdd value)? successAdd,
    TResult? Function(_SuccessEdit value)? successEdit,
    TResult? Function(_SuccessDelete value)? successDelete,
    TResult? Function(_Failed value)? failed,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_SuccessAdd value)? successAdd,
    TResult Function(_SuccessEdit value)? successEdit,
    TResult Function(_SuccessDelete value)? successDelete,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements RoleState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$RoleStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'RoleState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Role> data) success,
    required TResult Function(AddRoleResponseModel data) successAdd,
    required TResult Function(EditRolePermissionResponseModel data) successEdit,
    required TResult Function(DeleteResponseModel data) successDelete,
    required TResult Function(String message) failed,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Role> data)? success,
    TResult? Function(AddRoleResponseModel data)? successAdd,
    TResult? Function(EditRolePermissionResponseModel data)? successEdit,
    TResult? Function(DeleteResponseModel data)? successDelete,
    TResult? Function(String message)? failed,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Role> data)? success,
    TResult Function(AddRoleResponseModel data)? successAdd,
    TResult Function(EditRolePermissionResponseModel data)? successEdit,
    TResult Function(DeleteResponseModel data)? successDelete,
    TResult Function(String message)? failed,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_SuccessAdd value) successAdd,
    required TResult Function(_SuccessEdit value) successEdit,
    required TResult Function(_SuccessDelete value) successDelete,
    required TResult Function(_Failed value) failed,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_SuccessAdd value)? successAdd,
    TResult? Function(_SuccessEdit value)? successEdit,
    TResult? Function(_SuccessDelete value)? successDelete,
    TResult? Function(_Failed value)? failed,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_SuccessAdd value)? successAdd,
    TResult Function(_SuccessEdit value)? successEdit,
    TResult Function(_SuccessDelete value)? successDelete,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements RoleState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Role> data});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$RoleStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$SuccessImpl(
      null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Role>,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(final List<Role> data) : _data = data;

  final List<Role> _data;
  @override
  List<Role> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'RoleState.success(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Role> data) success,
    required TResult Function(AddRoleResponseModel data) successAdd,
    required TResult Function(EditRolePermissionResponseModel data) successEdit,
    required TResult Function(DeleteResponseModel data) successDelete,
    required TResult Function(String message) failed,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Role> data)? success,
    TResult? Function(AddRoleResponseModel data)? successAdd,
    TResult? Function(EditRolePermissionResponseModel data)? successEdit,
    TResult? Function(DeleteResponseModel data)? successDelete,
    TResult? Function(String message)? failed,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Role> data)? success,
    TResult Function(AddRoleResponseModel data)? successAdd,
    TResult Function(EditRolePermissionResponseModel data)? successEdit,
    TResult Function(DeleteResponseModel data)? successDelete,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_SuccessAdd value) successAdd,
    required TResult Function(_SuccessEdit value) successEdit,
    required TResult Function(_SuccessDelete value) successDelete,
    required TResult Function(_Failed value) failed,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_SuccessAdd value)? successAdd,
    TResult? Function(_SuccessEdit value)? successEdit,
    TResult? Function(_SuccessDelete value)? successDelete,
    TResult? Function(_Failed value)? failed,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_SuccessAdd value)? successAdd,
    TResult Function(_SuccessEdit value)? successEdit,
    TResult Function(_SuccessDelete value)? successDelete,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements RoleState {
  const factory _Success(final List<Role> data) = _$SuccessImpl;

  List<Role> get data;
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessAddImplCopyWith<$Res> {
  factory _$$SuccessAddImplCopyWith(
          _$SuccessAddImpl value, $Res Function(_$SuccessAddImpl) then) =
      __$$SuccessAddImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AddRoleResponseModel data});
}

/// @nodoc
class __$$SuccessAddImplCopyWithImpl<$Res>
    extends _$RoleStateCopyWithImpl<$Res, _$SuccessAddImpl>
    implements _$$SuccessAddImplCopyWith<$Res> {
  __$$SuccessAddImplCopyWithImpl(
      _$SuccessAddImpl _value, $Res Function(_$SuccessAddImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$SuccessAddImpl(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as AddRoleResponseModel,
    ));
  }
}

/// @nodoc

class _$SuccessAddImpl implements _SuccessAdd {
  const _$SuccessAddImpl(this.data);

  @override
  final AddRoleResponseModel data;

  @override
  String toString() {
    return 'RoleState.successAdd(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessAddImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessAddImplCopyWith<_$SuccessAddImpl> get copyWith =>
      __$$SuccessAddImplCopyWithImpl<_$SuccessAddImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Role> data) success,
    required TResult Function(AddRoleResponseModel data) successAdd,
    required TResult Function(EditRolePermissionResponseModel data) successEdit,
    required TResult Function(DeleteResponseModel data) successDelete,
    required TResult Function(String message) failed,
  }) {
    return successAdd(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Role> data)? success,
    TResult? Function(AddRoleResponseModel data)? successAdd,
    TResult? Function(EditRolePermissionResponseModel data)? successEdit,
    TResult? Function(DeleteResponseModel data)? successDelete,
    TResult? Function(String message)? failed,
  }) {
    return successAdd?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Role> data)? success,
    TResult Function(AddRoleResponseModel data)? successAdd,
    TResult Function(EditRolePermissionResponseModel data)? successEdit,
    TResult Function(DeleteResponseModel data)? successDelete,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) {
    if (successAdd != null) {
      return successAdd(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_SuccessAdd value) successAdd,
    required TResult Function(_SuccessEdit value) successEdit,
    required TResult Function(_SuccessDelete value) successDelete,
    required TResult Function(_Failed value) failed,
  }) {
    return successAdd(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_SuccessAdd value)? successAdd,
    TResult? Function(_SuccessEdit value)? successEdit,
    TResult? Function(_SuccessDelete value)? successDelete,
    TResult? Function(_Failed value)? failed,
  }) {
    return successAdd?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_SuccessAdd value)? successAdd,
    TResult Function(_SuccessEdit value)? successEdit,
    TResult Function(_SuccessDelete value)? successDelete,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (successAdd != null) {
      return successAdd(this);
    }
    return orElse();
  }
}

abstract class _SuccessAdd implements RoleState {
  const factory _SuccessAdd(final AddRoleResponseModel data) = _$SuccessAddImpl;

  AddRoleResponseModel get data;
  @JsonKey(ignore: true)
  _$$SuccessAddImplCopyWith<_$SuccessAddImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessEditImplCopyWith<$Res> {
  factory _$$SuccessEditImplCopyWith(
          _$SuccessEditImpl value, $Res Function(_$SuccessEditImpl) then) =
      __$$SuccessEditImplCopyWithImpl<$Res>;
  @useResult
  $Res call({EditRolePermissionResponseModel data});
}

/// @nodoc
class __$$SuccessEditImplCopyWithImpl<$Res>
    extends _$RoleStateCopyWithImpl<$Res, _$SuccessEditImpl>
    implements _$$SuccessEditImplCopyWith<$Res> {
  __$$SuccessEditImplCopyWithImpl(
      _$SuccessEditImpl _value, $Res Function(_$SuccessEditImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$SuccessEditImpl(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as EditRolePermissionResponseModel,
    ));
  }
}

/// @nodoc

class _$SuccessEditImpl implements _SuccessEdit {
  const _$SuccessEditImpl(this.data);

  @override
  final EditRolePermissionResponseModel data;

  @override
  String toString() {
    return 'RoleState.successEdit(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessEditImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessEditImplCopyWith<_$SuccessEditImpl> get copyWith =>
      __$$SuccessEditImplCopyWithImpl<_$SuccessEditImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Role> data) success,
    required TResult Function(AddRoleResponseModel data) successAdd,
    required TResult Function(EditRolePermissionResponseModel data) successEdit,
    required TResult Function(DeleteResponseModel data) successDelete,
    required TResult Function(String message) failed,
  }) {
    return successEdit(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Role> data)? success,
    TResult? Function(AddRoleResponseModel data)? successAdd,
    TResult? Function(EditRolePermissionResponseModel data)? successEdit,
    TResult? Function(DeleteResponseModel data)? successDelete,
    TResult? Function(String message)? failed,
  }) {
    return successEdit?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Role> data)? success,
    TResult Function(AddRoleResponseModel data)? successAdd,
    TResult Function(EditRolePermissionResponseModel data)? successEdit,
    TResult Function(DeleteResponseModel data)? successDelete,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) {
    if (successEdit != null) {
      return successEdit(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_SuccessAdd value) successAdd,
    required TResult Function(_SuccessEdit value) successEdit,
    required TResult Function(_SuccessDelete value) successDelete,
    required TResult Function(_Failed value) failed,
  }) {
    return successEdit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_SuccessAdd value)? successAdd,
    TResult? Function(_SuccessEdit value)? successEdit,
    TResult? Function(_SuccessDelete value)? successDelete,
    TResult? Function(_Failed value)? failed,
  }) {
    return successEdit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_SuccessAdd value)? successAdd,
    TResult Function(_SuccessEdit value)? successEdit,
    TResult Function(_SuccessDelete value)? successDelete,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (successEdit != null) {
      return successEdit(this);
    }
    return orElse();
  }
}

abstract class _SuccessEdit implements RoleState {
  const factory _SuccessEdit(final EditRolePermissionResponseModel data) =
      _$SuccessEditImpl;

  EditRolePermissionResponseModel get data;
  @JsonKey(ignore: true)
  _$$SuccessEditImplCopyWith<_$SuccessEditImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessDeleteImplCopyWith<$Res> {
  factory _$$SuccessDeleteImplCopyWith(
          _$SuccessDeleteImpl value, $Res Function(_$SuccessDeleteImpl) then) =
      __$$SuccessDeleteImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DeleteResponseModel data});
}

/// @nodoc
class __$$SuccessDeleteImplCopyWithImpl<$Res>
    extends _$RoleStateCopyWithImpl<$Res, _$SuccessDeleteImpl>
    implements _$$SuccessDeleteImplCopyWith<$Res> {
  __$$SuccessDeleteImplCopyWithImpl(
      _$SuccessDeleteImpl _value, $Res Function(_$SuccessDeleteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$SuccessDeleteImpl(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DeleteResponseModel,
    ));
  }
}

/// @nodoc

class _$SuccessDeleteImpl implements _SuccessDelete {
  const _$SuccessDeleteImpl(this.data);

  @override
  final DeleteResponseModel data;

  @override
  String toString() {
    return 'RoleState.successDelete(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessDeleteImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessDeleteImplCopyWith<_$SuccessDeleteImpl> get copyWith =>
      __$$SuccessDeleteImplCopyWithImpl<_$SuccessDeleteImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Role> data) success,
    required TResult Function(AddRoleResponseModel data) successAdd,
    required TResult Function(EditRolePermissionResponseModel data) successEdit,
    required TResult Function(DeleteResponseModel data) successDelete,
    required TResult Function(String message) failed,
  }) {
    return successDelete(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Role> data)? success,
    TResult? Function(AddRoleResponseModel data)? successAdd,
    TResult? Function(EditRolePermissionResponseModel data)? successEdit,
    TResult? Function(DeleteResponseModel data)? successDelete,
    TResult? Function(String message)? failed,
  }) {
    return successDelete?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Role> data)? success,
    TResult Function(AddRoleResponseModel data)? successAdd,
    TResult Function(EditRolePermissionResponseModel data)? successEdit,
    TResult Function(DeleteResponseModel data)? successDelete,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) {
    if (successDelete != null) {
      return successDelete(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_SuccessAdd value) successAdd,
    required TResult Function(_SuccessEdit value) successEdit,
    required TResult Function(_SuccessDelete value) successDelete,
    required TResult Function(_Failed value) failed,
  }) {
    return successDelete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_SuccessAdd value)? successAdd,
    TResult? Function(_SuccessEdit value)? successEdit,
    TResult? Function(_SuccessDelete value)? successDelete,
    TResult? Function(_Failed value)? failed,
  }) {
    return successDelete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_SuccessAdd value)? successAdd,
    TResult Function(_SuccessEdit value)? successEdit,
    TResult Function(_SuccessDelete value)? successDelete,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (successDelete != null) {
      return successDelete(this);
    }
    return orElse();
  }
}

abstract class _SuccessDelete implements RoleState {
  const factory _SuccessDelete(final DeleteResponseModel data) =
      _$SuccessDeleteImpl;

  DeleteResponseModel get data;
  @JsonKey(ignore: true)
  _$$SuccessDeleteImplCopyWith<_$SuccessDeleteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailedImplCopyWith<$Res> {
  factory _$$FailedImplCopyWith(
          _$FailedImpl value, $Res Function(_$FailedImpl) then) =
      __$$FailedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$FailedImplCopyWithImpl<$Res>
    extends _$RoleStateCopyWithImpl<$Res, _$FailedImpl>
    implements _$$FailedImplCopyWith<$Res> {
  __$$FailedImplCopyWithImpl(
      _$FailedImpl _value, $Res Function(_$FailedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$FailedImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FailedImpl implements _Failed {
  const _$FailedImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'RoleState.failed(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailedImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailedImplCopyWith<_$FailedImpl> get copyWith =>
      __$$FailedImplCopyWithImpl<_$FailedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Role> data) success,
    required TResult Function(AddRoleResponseModel data) successAdd,
    required TResult Function(EditRolePermissionResponseModel data) successEdit,
    required TResult Function(DeleteResponseModel data) successDelete,
    required TResult Function(String message) failed,
  }) {
    return failed(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Role> data)? success,
    TResult? Function(AddRoleResponseModel data)? successAdd,
    TResult? Function(EditRolePermissionResponseModel data)? successEdit,
    TResult? Function(DeleteResponseModel data)? successDelete,
    TResult? Function(String message)? failed,
  }) {
    return failed?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Role> data)? success,
    TResult Function(AddRoleResponseModel data)? successAdd,
    TResult Function(EditRolePermissionResponseModel data)? successEdit,
    TResult Function(DeleteResponseModel data)? successDelete,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_SuccessAdd value) successAdd,
    required TResult Function(_SuccessEdit value) successEdit,
    required TResult Function(_SuccessDelete value) successDelete,
    required TResult Function(_Failed value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_SuccessAdd value)? successAdd,
    TResult? Function(_SuccessEdit value)? successEdit,
    TResult? Function(_SuccessDelete value)? successDelete,
    TResult? Function(_Failed value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_SuccessAdd value)? successAdd,
    TResult Function(_SuccessEdit value)? successEdit,
    TResult Function(_SuccessDelete value)? successDelete,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class _Failed implements RoleState {
  const factory _Failed(final String message) = _$FailedImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$FailedImplCopyWith<_$FailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
