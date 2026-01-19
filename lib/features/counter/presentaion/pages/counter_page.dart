import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_counter/features/counter/presentaion/provider/counter_provider.dart';
import 'package:test_counter/features/counter/presentaion/widgets/counter.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key, required this.title});

  final String title;

  @override
  State<CounterPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<CounterPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CounterProvider>().initCounter();
    });
    super.initState();
  }

  void _incrementCounter() {
    context.read<CounterProvider>().increment();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CounterProvider>(
      builder: (_, counterProvider, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,

            title: Text(widget.title),
          ),
          body: Center(
            child: Counter(
              title: "You have pushed the button this many times:",
              count: counterProvider.count.value,
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: _incrementCounter,

            tooltip: 'Increment',

            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
