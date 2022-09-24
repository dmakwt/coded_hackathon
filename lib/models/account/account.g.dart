// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Account _$$_AccountFromJson(Map<String, dynamic> json) => _$_Account(
      id: json['id'] as String? ?? '',
      balance: (json['balance'] as num).toDouble(),
      email: json['email'] as String,
      name: json['name'] as String? ?? '',
      onHoldBalance: (json['onHoldBalance'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$_AccountToJson(_$_Account instance) =>
    <String, dynamic>{
      'id': instance.id,
      'balance': instance.balance,
      'email': instance.email,
      'name': instance.name,
      'onHoldBalance': instance.onHoldBalance,
      'createdAt': instance.createdAt.toIso8601String(),
    };
