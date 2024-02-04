import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'list_provider.dart';
import 'second.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NumbersListProvider>(
      builder: (context, number, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Center(
              child: Text('First Page'),
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
                      builder: (context) => const SecondPage(),
                    ),
                  );
                },
                child: const Text('Second Page'),
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
