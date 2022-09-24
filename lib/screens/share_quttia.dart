// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_coded/models/account/account.dart';
import 'package:flutter_application_coded/models/invite/invite.dart';
import 'package:flutter_application_coded/models/quttia/quttia.dart';

class ShareQuttia extends StatefulWidget {
  const ShareQuttia({
    Key? key,
    required this.quttia,
  }) : super(key: key);

  final Quttia quttia;

  @override
  State<ShareQuttia> createState() => _ShareQuttiaState();
}

class _ShareQuttiaState extends State<ShareQuttia> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Invite To Quttia'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.close),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      hintText: 'Email',
                    ),
                  ),
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () async {
                final userReciverMap = await FirebaseFirestore.instance
                    .collection('users')
                    .where('email', isEqualTo: emailController.text)
                    .get();

                if (userReciverMap.docs.isEmpty) {
                  BotToast.showText(text: 'Not found');
                  return;
                }

                final userReciver =
                    Account.fromJson(userReciverMap.docs[0].data());

                final docQuttia =
                    FirebaseFirestore.instance.collection('invites').doc();

                final quttiaObj = Invite(
                  quttiaId: widget.quttia.id,
                  id: docQuttia.id,
                  ownerId: FirebaseAuth.instance.currentUser!.uid,
                  reciver: userReciver.id,
                  createdAt: DateTime.now(),
                  amount: widget.quttia.amount,
                  numberOfUser: widget.quttia.numberOfUser,
                  status: widget.quttia.status,
                  title: widget.quttia.title,
                  usersId: widget.quttia.usersId,
                );

                // // Creating & writing
                await docQuttia.set(quttiaObj.toJson());

                // ignore: use_build_context_synchronously
                Navigator.pop(context);
              },
              icon: const Icon(Icons.person_add_rounded),
              label: const Text('Invite'),
            ),
          ],
        ),
      ),
    );
  }
}
