import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'first.dart';
import 'list_provider.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NumbersListProvider>(
      builder: (context, number, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Center(
              child: Text('Second Page'),
            ),
          ),
          body: Column(
            children: [
              Text(
                number.numbers.last.toString(),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Text(
                      number.numbers[index].toString(),
                      style: Theme.of(context).textTheme.headlineMedium,
                    );
                  },
                  itemCount: number.numbers.length,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FirstPage(),
                    ),
                  );
                },
                child: const Text('First Page'),
              ),
              const SizedBox(height: 20),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              number.addNumber();
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
