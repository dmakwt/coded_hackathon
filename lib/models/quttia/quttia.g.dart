// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quttia.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Quttia _$$_QuttiaFromJson(Map<String, dynamic> json) => _$_Quttia(
      id: json['id'] as String? ?? '',
      title: json['title'] as String,
      amount: (json['amount'] as num).toDouble(),
      status: json['status'] as String,
      usersId: (json['usersId'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      numberOfUser: json['numberOfUser'] as int,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$_QuttiaToJson(_$_Quttia instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'amount': instance.amount,
      'status': instance.status,
      'usersId': instance.usersId,
      'numberOfUser': instance.numberOfUser,
      'createdAt': instance.createdAt.toIso8601String(),
    };
