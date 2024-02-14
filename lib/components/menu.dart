import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/menu_pane.dart';
import '../main.dart';

class MenuAppBar extends StatefulWidget {
  const MenuAppBar({super.key});

  @override
  State<MenuAppBar> createState() => _MenuAppBarState();
}

class _MenuAppBarState extends State<MenuAppBar> {
  @override
  Widget build(BuildContext context) {
    final ordersModel = Provider.of<Orders>(context);

    String getCartNumber(int n) {
      if (n <= 99) {
        return n.toString();
      } else {
        return '99+';
      }
    }

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
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/cart');
                  },
                  child: Stack(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/shopping-cart-icon.png'
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        width: 30,
                        height: 30,
                      ),
                      if (ordersModel.getNumbersOfOrder() > 0) 
                        Transform.translate(
                          offset:const Offset(-8, -8),
                          child: NumberCircle(count: getCartNumber(ordersModel.getNumbersOfOrder())),
                        ),
                    ],
                  ),
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
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 3),
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

class NumberCircle extends StatelessWidget {
  final String count;

  const NumberCircle({Key? key, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 25,
      height: 25,
      decoration: const BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
      child: Text(
        count,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

