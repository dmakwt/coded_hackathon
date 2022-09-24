import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_coded/models/invite/invite.dart';
import 'package:flutter_application_coded/models/quttia/quttia.dart';
import 'package:flutterfire_ui/firestore.dart';

import '../models/account/account.dart';

class NotifyScreen extends StatelessWidget {
  const NotifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Invites'),
      ),
      body: FirestoreListView<Invite>(
        query: inviteCollection
            .where('reciver', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .orderBy('createdAt', descending: true),
        itemBuilder: (context, snapshot) {
          final invite = snapshot.data();

          return Card(
            child: Column(
              children: [
                ListTile(
                  title: Text(invite.title),
                  subtitle: Text('Total amount: ${invite.amount}'),
                  trailing: Text(
                      '${(invite.amount / invite.numberOfUser).toStringAsFixed(1)} KD / per person'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () async {
                        final docAccount = await FirebaseFirestore.instance
                            .collection('users')
                            .doc(FirebaseAuth.instance.currentUser!.uid)
                            .get();

                        final account = Account.fromJson(docAccount.data()!);

                        final docQuttia = FirebaseFirestore.instance
                            .collection('quttaiat')
                            .doc(invite.quttiaId);

                        final docQuttia2 = await FirebaseFirestore.instance
                            .collection('quttaiat')
                            .doc(invite.quttiaId)
                            .get();

                        final quttia = Quttia.fromJson(docQuttia2.data()!);

                        final pricePerPerson =
                            (quttia.amount / quttia.numberOfUser);

                        if (account.balance - pricePerPerson < 0) {
                          BotToast.showText(text: 'Please, add more moeny');
                          return;
                        }

                        await docQuttia.update({
                          'usersId': FieldValue.arrayUnion(
                              [FirebaseAuth.instance.currentUser!.uid])
                        });

                        final docQuttia3 = await FirebaseFirestore.instance
                            .collection('quttaiat')
                            .doc(invite.quttiaId)
                            .get();

                        final quttia3 = Quttia.fromJson(docQuttia3.data()!);

                        if (quttia3.numberOfUser == quttia3.usersId.length) {
                          await docQuttia.update({
                            'status': 'DONE',
                          });
                        }

                        await FirebaseFirestore.instance
                            .collection('invites')
                            .doc(invite.id)
                            .delete();

                        // ignore: use_build_context_synchronously
                        Navigator.pop(context);
                      },
                      color: Colors.green,
                      iconSize: 50,
                      icon: const Icon(Icons.check_circle),
                    ),
                    IconButton(
                      onPressed: () async {
                        await FirebaseFirestore.instance
                            .collection('invites')
                            .doc(invite.id)
                            .delete();
                        // ignore: use_build_context_synchronously
                        Navigator.pop(context);
                      },
                      color: Colors.red,
                      iconSize: 50,
                      icon: const Icon(Icons.cancel),
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
