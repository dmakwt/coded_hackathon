import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_coded/models/account/account.dart';
import 'package:flutter_application_coded/screens/add_balance_screen.dart';
import 'package:flutter_application_coded/screens/withdraw_balance_screen.dart';
import 'package:flutterfire_ui/auth.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Wallet'),
        ),
        body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .snapshots(),
          builder: (_, snapshot) {
            if (snapshot.hasError) {
              return Text('Error = ${snapshot.error}');
            }

            if (snapshot.hasData) {
              var output = snapshot.data!.data();

              if (output == null) {
                return const Center(
                  child: SignOutButton(),
                );
              }
              final data = Account.fromJson(output);

              return SingleChildScrollView(
                child: Column(
                  children: [
                    Card(
                      child: Container(
                        padding: const EdgeInsets.all(30.0),
                        width: double.infinity,
                        child: Row(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://ui-avatars.com/api/?name=${data.email}'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: 16,),
                            Text(
                              'My email: ${FirebaseAuth.instance.currentUser!.email}',
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Spacer(),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Current Balance',
                                  style: TextStyle(
                                    fontSize: 21,
                                  ),
                                ),
                                Text(
                                  '${data.balance.toStringAsFixed(1)} KD',
                                  style: const TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            const VerticalDivider(),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'On Hold',
                                  style: TextStyle(
                                    fontSize: 21,
                                  ),
                                ),
                                Text(
                                  '${data.onHoldBalance.toStringAsFixed(1)} KD',
                                  style: const TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 120),
                    Card(
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AddBalanceScreen()),
                          );
                        },
                        title: const Text('Add balance'),
                        trailing: const Icon(Icons.arrow_right),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const WithdrawBalanceScreen()),
                          );
                        },
                        title: const Text('Withdraw balance'),
                        trailing: const Icon(Icons.arrow_right),
                      ),
                    ),
                    const SizedBox(height: 120),
                    const SignOutButton(),
                  ],
                ),
              );
            }

            return const Center(child: CircularProgressIndicator());
          },
        ));
  }
}
