// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'quttia.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Quttia _$QuttiaFromJson(Map<String, dynamic> json) {
  return _Quttia.fromJson(json);
}

/// @nodoc
mixin _$Quttia {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  List<String> get usersId => throw _privateConstructorUsedError;
  int get numberOfUser => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuttiaCopyWith<Quttia> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuttiaCopyWith<$Res> {
  factory $QuttiaCopyWith(Quttia value, $Res Function(Quttia) then) =
      _$QuttiaCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String title,
      double amount,
      String status,
      List<String> usersId,
      int numberOfUser,
      DateTime createdAt});
}

/// @nodoc
class _$QuttiaCopyWithImpl<$Res> implements $QuttiaCopyWith<$Res> {
  _$QuttiaCopyWithImpl(this._value, this._then);

  final Quttia _value;
  // ignore: unused_field
  final $Res Function(Quttia) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? amount = freezed,
    Object? status = freezed,
    Object? usersId = freezed,
    Object? numberOfUser = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      usersId: usersId == freezed
          ? _value.usersId
          : usersId // ignore: cast_nullable_to_non_nullable
              as List<String>,
      numberOfUser: numberOfUser == freezed
          ? _value.numberOfUser
          : numberOfUser // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$$_QuttiaCopyWith<$Res> implements $QuttiaCopyWith<$Res> {
  factory _$$_QuttiaCopyWith(_$_Quttia value, $Res Function(_$_Quttia) then) =
      __$$_QuttiaCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String title,
      double amount,
      String status,
      List<String> usersId,
      int numberOfUser,
      DateTime createdAt});
}

/// @nodoc
class __$$_QuttiaCopyWithImpl<$Res> extends _$QuttiaCopyWithImpl<$Res>
    implements _$$_QuttiaCopyWith<$Res> {
  __$$_QuttiaCopyWithImpl(_$_Quttia _value, $Res Function(_$_Quttia) _then)
      : super(_value, (v) => _then(v as _$_Quttia));

  @override
  _$_Quttia get _value => super._value as _$_Quttia;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? amount = freezed,
    Object? status = freezed,
    Object? usersId = freezed,
    Object? numberOfUser = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$_Quttia(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      usersId: usersId == freezed
          ? _value._usersId
          : usersId // ignore: cast_nullable_to_non_nullable
              as List<String>,
      numberOfUser: numberOfUser == freezed
          ? _value.numberOfUser
          : numberOfUser // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Quttia implements _Quttia {
  const _$_Quttia(
      {this.id = '',
      required this.title,
      required this.amount,
      required this.status,
      final List<String> usersId = const [],
      required this.numberOfUser,
      required this.createdAt})
      : _usersId = usersId;

  factory _$_Quttia.fromJson(Map<String, dynamic> json) =>
      _$$_QuttiaFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  final String title;
  @override
  final double amount;
  @override
  final String status;
  final List<String> _usersId;
  @override
  @JsonKey()
  List<String> get usersId {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_usersId);
  }

  @override
  final int numberOfUser;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'Quttia(id: $id, title: $title, amount: $amount, status: $status, usersId: $usersId, numberOfUser: $numberOfUser, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Quttia &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other._usersId, _usersId) &&
            const DeepCollectionEquality()
                .equals(other.numberOfUser, numberOfUser) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(_usersId),
      const DeepCollectionEquality().hash(numberOfUser),
      const DeepCollectionEquality().hash(createdAt));

  @JsonKey(ignore: true)
  @override
  _$$_QuttiaCopyWith<_$_Quttia> get copyWith =>
      __$$_QuttiaCopyWithImpl<_$_Quttia>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuttiaToJson(
      this,
    );
  }
}

abstract class _Quttia implements Quttia {
  const factory _Quttia(
      {final String id,
      required final String title,
      required final double amount,
      required final String status,
      final List<String> usersId,
      required final int numberOfUser,
      required final DateTime createdAt}) = _$_Quttia;

  factory _Quttia.fromJson(Map<String, dynamic> json) = _$_Quttia.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  double get amount;
  @override
  String get status;
  @override
  List<String> get usersId;
  @override
  int get numberOfUser;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_QuttiaCopyWith<_$_Quttia> get copyWith =>
      throw _privateConstructorUsedError;
}
