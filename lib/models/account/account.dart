import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account.freezed.dart';

part 'account.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs

@freezed
class Account with _$Account {
  const factory Account({
    @Default('') String id,
    required double balance,
    required String email,
    @Default('') String name,
    required double onHoldBalance,
    required DateTime createdAt,
  }) = _Account;

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
}

final orderCollection =
    FirebaseFirestore.instance.collection('users').withConverter<Account>(
          fromFirestore: (snapshot, _) => Account.fromJson(snapshot.data()!),
          toFirestore: (data, _) => data.toJson(),
        );
