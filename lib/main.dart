import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search for fruits'),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: CostomSearchDelegate(),
              );
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}

class CostomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    'Apple',
    'Banana',
    'Pear',
    'Watermelons',
    'Oranges',
    'Blueberries',
    'Strawberries',
    'Raspberries',
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }

    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var results = matchQuery[index];

          return ListTile(
            title: Text(results),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];

    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var results = matchQuery[index];
        return ListTile(
          title: Text(results),
        );
      },
    );
  }
}
