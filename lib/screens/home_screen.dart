import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_coded/models/invite/invite.dart';
import 'package:flutter_application_coded/models/quttia/quttia.dart';
import 'package:flutter_application_coded/providers/refresh_home_page.dart';
import 'package:flutter_application_coded/screens/add_balance_screen.dart';
import 'package:flutter_application_coded/screens/create_quttia.dart';
import 'package:flutter_application_coded/screens/notify_screen.dart';
import 'package:flutter_application_coded/screens/share_quttia.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../models/account/account.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Reading Data
  Stream<List<Quttia>> readQuttia() => FirebaseFirestore.instance
      .collection('quttaiat')
      .orderBy('createdAt', descending: true)
      .snapshots()
      .map(
        (snapshot) =>
            snapshot.docs.map((doc) => Quttia.fromJson(doc.data())).toList(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quttia'),
        leading: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('invites')
              .where('reciver',
                  isEqualTo: FirebaseAuth.instance.currentUser!.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(child: Text('Something went wrong'));
            }

            if (snapshot.hasData) {
              final invites = snapshot.data!.size;

              return Badge(
                badgeContent: Text('$invites'),
                showBadge: !(invites <= 0),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NotifyScreen(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.notifications),
                ),
              );
            }

            return IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications),
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              showMaterialModalBottomSheet(
                context: context,
                builder: (context) => const QuttiaScreen(),
              );
            },
            iconSize: 40,
            icon: const Icon(
              Icons.add,
            ),
          )
        ],
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final provider = ref.watch(refreshHomeProvider);
          return RefreshIndicator(
              onRefresh: () async {
                ref.read(refreshHomeProvider.notifier).setIsLoading(true);

                await Future.delayed(const Duration(milliseconds: 200), () {
                  ref.read(refreshHomeProvider.notifier).setIsLoading(false);
                });

                // setState(() {});
              },
              child: provider.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : FirestoreListView<Quttia>(
                      query: quttiaCollection
                          .where('usersId',
                              arrayContains:
                                  FirebaseAuth.instance.currentUser!.uid)
                          .orderBy('createdAt', descending: true),
                      itemBuilder: (context, snapshot) {
                        final quttia = snapshot.data();
                        return Card(
                          child: Column(
                            children: [
                              ListTile(
                                title: Text(quttia.title),
                                subtitle: Text(
                                    'Total price: ${quttia.amount.toStringAsFixed(1)}'),
                                trailing: Text(
                                    '${(quttia.amount / quttia.numberOfUser).toStringAsFixed(1)} KD / per person'),
                              ),
                              Text(quttia.status),
                              ListTile(
                                title: TextButton.icon(
                                  onPressed: () {
                                    showMaterialModalBottomSheet(
                                      context: context,
                                      builder: (context) => ShareQuttia(
                                        quttia: quttia,
                                      ),
                                    );
                                  },
                                  icon: const Icon(Icons.share),
                                  label: const Text('Share'),
                                ),
                              ),
                              SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: ListView.builder(
                                  itemCount: quttia.usersId.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: ((context, index) {
                                    final userId = quttia.usersId[index];

                                    return StreamBuilder<
                                            DocumentSnapshot<
                                                Map<String, dynamic>>>(
                                        stream: FirebaseFirestore.instance
                                            .collection('users')
                                            .doc(userId)
                                            .snapshots(),
                                        builder: ((context, snapshot) {
                                          if (snapshot.hasError) {
                                            return Text(
                                                'Error = ${snapshot.error}');
                                          }
                                          if (snapshot.hasData) {
                                            var output = snapshot.data!.data();
                                            final data =
                                                Account.fromJson(output!);

                                            // var value = output!['name']; // <-- Your value
                                            return Center(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(data.email),
                                              ),
                                            );
                                          }

                                          return const Center(
                                              child:
                                                  CircularProgressIndicator());
                                        }));

                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(userId),
                                    );
                                  }),
                                ),
                              ),
                            ],
                          ),
                        );
                        ;
                      },
                    )

              // StreamBuilder<List<Quttia>>(
              //   stream: readQuttia(),
              //   builder: (context, snapshot) {
              //     if (snapshot.hasError) {
              //       return const Center(child: Text('Something went wrong'));
              //     }
              //     if (snapshot.hasData) {
              //       final quttias = snapshot.data!;

              //       return ListView.builder(
              //           itemCount: quttias.length,
              //           itemBuilder: ((context, index) {
              //             final quttia = quttias[index];

              );
        },
      ),
    );
  }
}
