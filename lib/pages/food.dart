import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../objects/dish.dart';
import '../main.dart';

class Food extends StatefulWidget {
  final Orders ordersModel;

  const Food({Key? key, required this.ordersModel}) : super(key: key);

  @override
  State<Food> createState() => _FoodState();
}

class _FoodState extends State<Food> {
  int quantity = 0;
  static int maxQuantity = 10;

  void _incrementQuantity() {
    if (quantity < maxQuantity) {
      setState(() {
        quantity++;
      });
    }
  }

  void _decrementQuantity() {
    if (quantity > 0) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Dish dish = ModalRoute.of(context)!.settings.arguments as Dish;
    NumberFormat format = NumberFormat("#,##0.00");

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.9),
            ),
            padding: const EdgeInsets.all(8),
            child: const Icon(
              Icons.arrow_back,
              color: Color.fromARGB(255, 32, 32, 32),
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: Image.asset(
                'assets/images/dishes/${dish.image}',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.15,
                        child: Text(
                          dish.name,
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      _buildQuantityPane(),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "\$${dish.price.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: Row(
                          children: <Widget>[
                            const Icon(
                              Icons.access_time,
                              color: Colors.blueGrey,
                              size: 18,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Text(
                              "${dish.prepareTime} min.",
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Row(
                          children: <Widget>[
                            const Icon(
                              Icons.star_rate,
                              color: Colors.orangeAccent,
                              size: 18,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Text(
                              "${dish.ratings}",
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Divider(
                      thickness: 1,
                      height: 20,
                    ),
                  ),
                  Text(
                    dish.description,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Total Price: ',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    '\$${format.format(quantity * dish.price)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  widget.ordersModel.addOrders(dish, quantity);
                  Navigator.pop(context);
                },
                child: const Text('Place Order'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuantityPane() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              onTap: _incrementQuantity,
              child: Container(
                width: 30,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.black,
                ),
                child: const Icon(Icons.add, color: Colors.white),
              ),
            ),
            Text(
              '$quantity',
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            GestureDetector(
              onTap: _decrementQuantity,
              child: Container(
                width: 30,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.black,
                ),
                child: const Icon(Icons.remove, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
