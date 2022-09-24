import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddBalanceScreen extends StatefulWidget {
  const AddBalanceScreen({super.key});

  @override
  State<AddBalanceScreen> createState() => _AddBalanceScreenState();
}

class _AddBalanceScreenState extends State<AddBalanceScreen> {
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
        title: const Text('Add Balance'),
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
                child: ElevatedButton(
                  onPressed: () {
                    final docOrder = FirebaseFirestore.instance
                        .collection('users')
                        .doc(FirebaseAuth.instance.currentUser!.uid);

                    docOrder.update({
                      'balance': FieldValue.increment(
                        double.parse(balanceController.text),
                      ),
                    });

                    Navigator.pop(context);
                  },
                  child: const Text('Top-Up'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
