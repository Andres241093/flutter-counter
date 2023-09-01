import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 10;

  void increase() {
    setState(() => counter++);
  }

  void decrease() {
    setState(() => counter--);
  }

  void reset() {
    setState(() => counter = 0);
  }

  @override
  Widget build(BuildContext context) {
    var fontSize30  = const TextStyle(fontSize: 30);
    

    return Scaffold(
      appBar: AppBar(
        title: const Text('CounterScreen'),
        elevation: 10,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Click counter', style: fontSize30),
            Text('$counter', style: fontSize30)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomFloatingActions(
        increaseFn: increase,
        decreaseFn: decrease,
        resetFn: reset
      ),
    );
  }
}

class CustomFloatingActions extends StatelessWidget {

  final Function increaseFn;
  final Function decreaseFn;
  final Function resetFn;
  
  const CustomFloatingActions({
    super.key, 
    required this.increaseFn, 
    required this.decreaseFn, 
    required this.resetFn,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        FloatingActionButton(
          child: const Icon(Icons.exposure_minus_1_outlined),
          onPressed: () => decreaseFn()
        ),

        FloatingActionButton(
          child: const Icon(Icons.exposure_zero_outlined),
          onPressed: () => resetFn()
        ),

        FloatingActionButton(
          child: const Icon(Icons.exposure_plus_1_outlined),
          onPressed: () => increaseFn()
        ),
      ],
    );
  }
}