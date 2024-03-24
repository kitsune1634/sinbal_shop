import 'package:flutter/material.dart';
import 'package:sinbal/BottomBar/catalog.dart';
import 'package:sinbal/BottomBar/favorites.dart';
import 'package:sinbal/BottomBar/home.dart';
import 'package:sinbal/BottomBar/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sinbal',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Sinbal'),
    );
  }
}

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

  @override
  Widget build(BuildContext context) {

    List<Widget> _pages = <Widget>[
      Home(),
      Catalog(),
      Card(),
      Favorites(),
      Profile(),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title:  Text(widget.title, textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Lobster',
              fontSize: 25,
            )),
      ),
      body: IndexedStack(
        children: _pages,
        index: _counter,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 13.0,
        unselectedFontSize: 13.0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor : Colors.black87,
        selectedItemColor: Colors.purple,

        currentIndex: _counter,
        onTap: (index) {
          setState(() {
            _counter = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home_filled), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.manage_search), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: ''),
        ],
      ),

    );
  }
}
