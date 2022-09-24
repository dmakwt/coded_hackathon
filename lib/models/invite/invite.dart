import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'invite.freezed.dart';

part 'invite.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs

@freezed
class Invite with _$Invite {
  const factory Invite({
    @Default('') String id,
    required String ownerId,
    required String quttiaId,
    required String reciver,
    required DateTime createdAt,
    required String title,
    required double amount,
    required String status,
    @Default([]) List<String> usersId,
    required int numberOfUser,
  }) = _Invite;

  factory Invite.fromJson(Map<String, dynamic> json) => _$InviteFromJson(json);
}

final inviteCollection =
    FirebaseFirestore.instance.collection('invites').withConverter<Invite>(
          fromFirestore: (snapshot, _) => Invite.fromJson(snapshot.data()!),
          toFirestore: (data, _) => data.toJson(),
        );
