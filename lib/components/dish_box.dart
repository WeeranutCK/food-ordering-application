import 'package:flutter/material.dart';
import '../objects/dish.dart';

class DishesBox extends StatelessWidget {
  const DishesBox({
      Key? key,
      required this.dish,
    })
      : super(key: key);

  final Dish dish;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () => {
          Navigator.pushNamed(context, '/dish', arguments: dish)
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 1,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset(
                    'assets/images/dishes/${dish.image}',
                    height: 90,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 4,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          dish.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Flexible(
                            child: Row(
                              children: <Widget>[
                                const Icon(
                                  Icons.access_time,
                                  color: Colors.blueGrey,
                                  size: 15,
                                ),
                                const SizedBox(width: 3,),
                                Text(
                                  "${dish.prepareTime} min.",
                                  style: const TextStyle(
                                    fontSize: 15,
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
                                  size: 15,
                                ),
                                const SizedBox(width: 3,),
                                Text(
                                  "${dish.ratings}",
                                  style: const TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Flexible(
                        child: Text(
                          "\$${dish.price.toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
