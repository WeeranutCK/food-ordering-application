import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/home.dart';
import 'pages/food.dart';
import 'pages/cart.dart';
import 'objects/dish.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => Orders(),
        child: MaterialApp(
          title: 'Flutter Demo',
          initialRoute: '/',
          routes: {
            '/': (context) => const Home(),
            '/dish': (context) =>
                Food(ordersModel: Provider.of<Orders>(context)),
            '/cart': (context) =>
                Cart(ordersModel: Provider.of<Orders>(context)),
          },
          theme: ThemeData(
            fontFamily: 'Roboto',
            colorScheme:
                ColorScheme.fromSeed(seedColor: Colors.lightGreenAccent),
            useMaterial3: true,
          ),
        ));
  }
}

class Orders with ChangeNotifier {
  List<Map<Dish, int>> _orders = <Map<Dish, int>>[];

  int getNumbersOfOrder() {
    int count = 0;
    for (Map<Dish, int> dishes in _orders) {
      for (int i in dishes.values.toList()) {
        count += i;
      }
    }
    return count;
  }

  void getMergedOrders() {
    final mergedOrders = <Dish, int>{};

    for (final order in _orders) {
      for (final entry in order.entries) {
        final dish = entry.key;
        final quantity = entry.value;

        if (mergedOrders.containsKey(dish)) {
          mergedOrders[dish] = mergedOrders[dish]! + quantity;
        } else {
          mergedOrders[dish] = quantity;
        }
      }
    }
    clearAllOrders();
    _orders = [mergedOrders];
  }

  void addOrders(Dish dish, int amount) {
    _orders.add({dish: amount});
    getMergedOrders();
    notifyListeners();
  }

  void removeOrder(Dish dish) {
    for (int i = 0; i < _orders.length; i++) {
      final Map<Dish, int> order = _orders[i];
      if (order.containsKey(dish)) {
        order.remove(dish);
        if (order.isEmpty) {
          _orders.removeAt(i);
        }
        notifyListeners();
        break;
      }
    }
  }

  void updateQuantity(Dish dish, int newQuantity) {
    for (int i = 0; i < _orders.length; i++) {
      final Map<Dish, int> order = _orders[i];
      if (order.containsKey(dish)) {
        if (newQuantity > 0 && newQuantity <= 10) {
          order[dish] = newQuantity;
        }
        getMergedOrders();
        notifyListeners();
        break;
      }
    }
  }

  void clearAllOrders() {
    _orders.clear();
    notifyListeners();
  }

  List<Map<Dish, int>> get getOrders => _orders;
}
