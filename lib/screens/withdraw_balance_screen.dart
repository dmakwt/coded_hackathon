import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_coded/models/account/account.dart';

class WithdrawBalanceScreen extends StatefulWidget {
  const WithdrawBalanceScreen({super.key});

  @override
  State<WithdrawBalanceScreen> createState() => _WithdrawBalanceScreenState();
}

class _WithdrawBalanceScreenState extends State<WithdrawBalanceScreen> {
  final balanceController = TextEditingController();

  @override
  void dispose() {
    balanceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Withdraw Balance'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: balanceController,
                    decoration: const InputDecoration(hintText: 'Balance'),
                  ),
                ),
              ),
              const SizedBox(height: 60),
              Card(
                child: ListTile(
                  onTap: () {},
                  title: Text('Bank transaction'),
                  trailing: const Icon(Icons.check_circle_outline_outlined),
                ),
              ),
              const SizedBox(height: 60),
              SizedBox(
                width: 120,
                height: 44,
                child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .snapshots(),
                  builder: ((context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error = ${snapshot.error}');
                    }

                    if (snapshot.hasData) {
                      var output = snapshot.data!.data();
                      final data = Account.fromJson(output!);

                      return ElevatedButton(
                        onPressed: () {
                          if ((data.balance -
                                  double.parse(balanceController.text)) <
                              0) {
                            BotToast.showText(text: 'Not Enought Balance');
                            return;
                          }

                          final docOrder = FirebaseFirestore.instance
                              .collection('users')
                              .doc(FirebaseAuth.instance.currentUser!.uid);

                          docOrder.update({
                            'balance': FieldValue.increment(
                              -double.parse(balanceController.text),
                            ),
                          });

                          Navigator.pop(context);
                        },
                        child: const Text('Top-Up'),
                      );
                    }

                    return const Center(child: CircularProgressIndicator());
                  }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
