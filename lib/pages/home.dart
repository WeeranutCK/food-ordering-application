import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/menu.dart';
import '../components/settings.dart';
import '../main.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<List<Widget>> widgetOption = const <List<Widget>>[
    <Widget>[MenuAppBar(), Menu()],
    <Widget>[Text("This is a wish list app bar!"), Text("This is a wish list!")],
    <Widget>[SettingsAppBar(), Settings()],
  ];
  int indexBottomNav = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: widgetOption[indexBottomNav][0],
      ),
      body: Consumer<Orders>(
        builder: (context, model, child) => widgetOption[indexBottomNav][1],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) => {
          setState(() => indexBottomNav = value)
        },
        currentIndex: indexBottomNav,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
