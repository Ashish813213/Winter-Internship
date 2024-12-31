import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Horizontal Scrolling List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HorizontalListViewExample(),
    );
  }
}

class HorizontalListViewExample extends StatelessWidget {
  const HorizontalListViewExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List of items for the horizontal scroll
    final List<String> items = List.generate(10, (index) => 'Item $index');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Horizontal Scrolling List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          // Set scroll direction to horizontal
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            // Each item will be a Card wrapped inside a Container
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Card(
                elevation: 5,
                color: Colors.blueAccent,
                child: Container(
                  width: 150,
                  height: 100,
                  alignment: Alignment.center,
                  child: Text(
                    items[index],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
