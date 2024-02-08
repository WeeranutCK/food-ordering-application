import 'package:flutter/material.dart';
import '../components/menu_pane.dart';

class MenuAppBar extends StatelessWidget {
  const MenuAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  "Menu",
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Image.asset(
                  'assets/images/shopping-cart-icon.png',
                  width: 35,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  List<String> categoriesList = <String>[
    'All',
    'Breakfast',
    'Snacks',
    'Lunch',
    'Dinner',
    'Drinks'
  ];

  String selected = 'All';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: SearchBar(
              leading: const Icon(Icons.search),
              hintText: "Search...",
              shape: MaterialStateProperty.all(
                  const ContinuousRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
              backgroundColor: const MaterialStatePropertyAll(Colors.white)),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              for (String category in categoriesList)
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selected = category;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          category == selected ? null : Colors.white,
                    ),
                    child: Text(
                      category,
                      style: TextStyle(
                        fontWeight: category == selected
                            ? FontWeight.bold
                            : FontWeight.normal,
                        fontSize: category == selected ? 18 : 16,
                        color:
                            category == selected ? null : Colors.grey,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        MenuPane(categoriesList: categoriesList, filter: selected),
      ],
    );
  }
}
