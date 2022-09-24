import 'package:flutter/material.dart';

class QuttiaScreen extends StatefulWidget {
  const QuttiaScreen({super.key});

  @override
  State<QuttiaScreen> createState() => _QuttiaScreenState();
}

class _QuttiaScreenState extends State<QuttiaScreen> {
  final nameOfQuttiaController = TextEditingController();
  final totalPriceController = TextEditingController();
  final nameOfPeopleController = TextEditingController();

  @override
  void dispose() {
    nameOfQuttiaController.dispose();
    totalPriceController.dispose();
    nameOfPeopleController.dispose();
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
                    controller: nameOfPeopleController,
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
                  onPressed: () {},
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
