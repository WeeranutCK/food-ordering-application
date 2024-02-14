import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../objects/dish.dart';
import '../main.dart';

class Cart extends StatefulWidget {
  final Orders ordersModel;

  const Cart({Key? key, required this.ordersModel}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  static int vatPercent = 7;
  double totalPrice = 0;

  void _clearCart() {
    setState(() {
      GlobalKey();
    });
  }

  void _updateQuantity(Dish dish, int newQuantity) {
    setState(() {
      widget.ordersModel.updateQuantity(dish, newQuantity);
    });
  }

  void _removeOrder(Dish dish) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        widget.ordersModel.removeOrder(dish);
      });
    });
  }

  void _findTotalPrice() {
    setState(() {
      totalPrice = 0;
      for (final Map<Dish, int> entry in widget.ordersModel.getOrders) {
        for (final MapEntry<Dish, int> mapEntry in entry.entries) {
          final Dish dish = mapEntry.key;
          final int quantity = mapEntry.value;
          totalPrice += dish.price * quantity;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    NumberFormat format = NumberFormat("#,##0.00");

    _clearCart();
    _findTotalPrice();

    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Cart",
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: () {
              List<Widget> widgets = [];
              if (widget.ordersModel.getOrders.isNotEmpty) {
                for (final Map<Dish, int> entry
                    in widget.ordersModel.getOrders) {
                  for (final MapEntry<Dish, int> mapEntry in entry.entries) {
                    final Dish dish = mapEntry.key;
                    final int quantity = mapEntry.value;
                    widgets.add(
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: OrderCard(
                          dish: dish,
                          quantity: quantity,
                          updateQuantity: _updateQuantity,
                          onCancelOrder: _removeOrder,
                          findTotalPrice: _findTotalPrice,
                        ),
                      ),
                    );
                  }
                }
              }
              return widgets;
            }(),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        height: MediaQuery.of(context).size.height / 6,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text('Total Price'),
                Text(
                  '\$${format.format(totalPrice)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Total Vat'),
                Text(
                  '+7.00%',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  'Total', 
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  '\$${format.format(totalPrice * vatPercent / 100 + totalPrice)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    widget.ordersModel.clearAllOrders();
                  },
                  child: const Text('Remove Order'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    widget.ordersModel.clearAllOrders();
                  },
                  child: const Text('Confirm Order'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final Dish dish;
  final int quantity;
  final Function(Dish, int) updateQuantity;
  final Function(Dish) onCancelOrder;
  final Function() findTotalPrice;

  const OrderCard({
    Key? key,
    required this.dish,
    required this.quantity,
    required this.updateQuantity,
    required this.onCancelOrder,
    required this.findTotalPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NumberFormat format = NumberFormat("#,##0.00");

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 2)
        ],
      ),
      child: Stack(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  'assets/images/dishes/${dish.image}',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dish.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Row(
                      children: [
                        const Text(
                          'Total Amount: ',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        _buildQuantityPane(),
                      ],
                    ),
                    Text.rich(
                      TextSpan(
                        text: 'Total Price: ',
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                        children: [
                          TextSpan(
                            text: '\$${format.format(dish.price * quantity)}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: -12,
            right: -12,
            child: IconButton(
              onPressed: () {
                onCancelOrder(dish);
                findTotalPrice();
              },
              icon: const Icon(
                Icons.close,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuantityPane() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5, 0, 50, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              onTap: () => {
                updateQuantity(dish, quantity + 1),
                findTotalPrice(),
              },
              child: Container(
                width: 20,
                height: 20,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.black,
                ),
                child: const Icon(Icons.add, color: Colors.white, size: 15),
              ),
            ),
            Text(
              '$quantity',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            GestureDetector(
              onTap: () => {
                updateQuantity(dish, quantity - 1),
                findTotalPrice(),
              },
              child: Container(
                width: 20,
                height: 20,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.black,
                ),
                child: const Icon(Icons.remove, color: Colors.white, size: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
