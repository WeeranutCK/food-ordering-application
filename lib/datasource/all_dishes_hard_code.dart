import 'package:flutter/material.dart';
import '../components/dish_box.dart';
import '../objects/dish.dart';

class Datasource {
  final List<String> _categoriesList; 

  Datasource(this._categoriesList);

  List<Widget> getDatasource(String filter) {
    List<Dish> dishes = [
      Dish(
        'Fresh Pasta',
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        35,
        34.99,
        4.8,
        'pasta.jpg',
        [_categoriesList[5]],
      ),
      Dish(
        'Bouillabaisse',
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        65,
        49.99,
        4.6,
        'bouillabaisse.jpg',
        [_categoriesList[4]],
      ),
      Dish(
        'Lobster',
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        15,
        34.99,
        4.8,
        'lobster.jpg',
        [_categoriesList[5]],
      ),
      Dish(
        'Hamburger',
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        25,
        29.99,
        3.9,
        'hamburger.jpg',
        [_categoriesList[1]],
      ),
      Dish(
        'Pudding',
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        90,
        19.99,
        4.2,
        'pudding.jpg',
        [_categoriesList[3]],
      ),
      Dish(
        'Bruschetta',
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        45,
        24.99,
        4.3,
        'bruschetta.jpg',
        [_categoriesList[3]],
      ),
      Dish(
        'Ceasar Salad',
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        10,
        29.99,
        3.9,
        'salad.jpg',
        [_categoriesList[5]],
      ),
      Dish(
        'Salmon Steak',
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        25,
        49.99,
        4.5,
        'salmon-steak.jpg',
        [_categoriesList[5]],
      ),
      Dish(
        'Tomato Soup',
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        60,
        19.99,
        4.7,
        'tomato-soup.jpg',
        [_categoriesList[4]],
      ),
      Dish(
        'Strawberry Waffle',
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        75,
        24.99,
        5.0,
        'waffle.jpg',
        [_categoriesList[2]],
      ),
    ];

    List<DishesBox> dishBoxes = dishes.map((dish) => DishesBox(dish: dish)).toList();

    if (filter != 'All') {
      List<Widget> filteredDishes = [];
      for (DishesBox dishBox in dishBoxes) {
        for (String category in dishBox.dish.categories) {
          if (category == filter) {
            filteredDishes.add(dishBox);
          }
        }
      }
      return filteredDishes;
    } else {
      return dishBoxes;
    }
  }
}
