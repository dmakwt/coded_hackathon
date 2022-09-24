import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quttia.freezed.dart';

part 'quttia.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs

@freezed
class Quttia with _$Quttia {
  const factory Quttia({
    @Default('') String id,
    required String title,
    required double amount,
    required String status,
    @Default([]) List<String> usersId,
    required int numberOfUser,
    required DateTime createdAt,
  }) = _Quttia;

  factory Quttia.fromJson(Map<String, dynamic> json) => _$QuttiaFromJson(json);
}

final quttiaCollection =
    FirebaseFirestore.instance.collection('quttaiat').withConverter<Quttia>(
          fromFirestore: (snapshot, _) => Quttia.fromJson(snapshot.data()!),
          toFirestore: (data, _) => data.toJson(),
        );
