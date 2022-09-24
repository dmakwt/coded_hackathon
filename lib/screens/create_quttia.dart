import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_coded/models/account/account.dart';
import 'package:flutter_application_coded/models/quttia/quttia.dart';

class QuttiaScreen extends StatefulWidget {
  const QuttiaScreen({super.key});

  @override
  State<QuttiaScreen> createState() => _QuttiaScreenState();
}

class _QuttiaScreenState extends State<QuttiaScreen> {
  final nameOfQuttiaController = TextEditingController();
  final totalPriceController = TextEditingController();
  final numberOfPeopleController = TextEditingController();

  @override
  void dispose() {
    nameOfQuttiaController.dispose();
    totalPriceController.dispose();
    numberOfPeopleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.close),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: nameOfQuttiaController,
                    decoration:
                        const InputDecoration(hintText: 'Name of Quttia'),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: totalPriceController,
                    keyboardType: TextInputType.number,
                    decoration:
                        const InputDecoration(hintText: 'Total of price'),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: numberOfPeopleController,
                    keyboardType: TextInputType.number,
                    decoration:
                        const InputDecoration(hintText: 'Number of People'),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 200,
                height: 45,
                child: ElevatedButton(
                  onPressed: () async {
                    final docAccount = await FirebaseFirestore.instance
                        .collection('users')
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .get();

                    final account = Account.fromJson(docAccount.data()!);

                    final pricePerPeson =
                        double.parse(totalPriceController.text) /
                            int.parse(numberOfPeopleController.text);

                    if ((account.balance - pricePerPeson) < 0) {
                      BotToast.showText(text: 'Please, add more money');
                      return;
                    }

                    await FirebaseFirestore.instance
                        .collection('users')
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .update({
                      'balance': FieldValue.increment(-pricePerPeson),
                      'onHoldBalance': FieldValue.increment(pricePerPeson),
                    });

                    final docQuttia =
                        FirebaseFirestore.instance.collection('quttaiat').doc();

                    final quttiaObj = Quttia(
                      id: docQuttia.id,
                      title: nameOfQuttiaController.text,
                      amount: double.parse(totalPriceController.text),
                      status: 'PENDING',
                      numberOfUser: int.parse(numberOfPeopleController.text),
                      usersId: [
                        FirebaseAuth.instance.currentUser!.uid,
                      ],
                      createdAt: DateTime.now(),
                    );

                    // Creating & writing
                    await docQuttia.set(quttiaObj.toJson());
                    // ignore: use_build_context_synchronously
                    Navigator.pop(context);
                  },
                  child: const Text('Create'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
