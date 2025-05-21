import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  var isHorizontal = true;
  @override
  Widget build(BuildContext context) {
    isHorizontal = MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.grid_view),
            onPressed: () {
              setState(() {
                isHorizontal = !isHorizontal;
              });
            },
          ),
        ],
      ),
      body: Center(
        child: Flex(
          direction: isHorizontal ? Axis.horizontal : Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
