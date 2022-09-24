// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Invite _$$_InviteFromJson(Map<String, dynamic> json) => _$_Invite(
      id: json['id'] as String? ?? '',
      ownerId: json['ownerId'] as String,
      quttiaId: json['quttiaId'] as String,
      reciver: json['reciver'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      title: json['title'] as String,
      amount: (json['amount'] as num).toDouble(),
      status: json['status'] as String,
      usersId: (json['usersId'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      numberOfUser: json['numberOfUser'] as int,
    );

Map<String, dynamic> _$$_InviteToJson(_$_Invite instance) => <String, dynamic>{
      'id': instance.id,
      'ownerId': instance.ownerId,
      'quttiaId': instance.quttiaId,
      'reciver': instance.reciver,
      'createdAt': instance.createdAt.toIso8601String(),
      'title': instance.title,
      'amount': instance.amount,
      'status': instance.status,
      'usersId': instance.usersId,
      'numberOfUser': instance.numberOfUser,
    };
