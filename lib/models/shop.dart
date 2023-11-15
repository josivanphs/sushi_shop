import 'package:flutter/material.dart';

import 'food.dart';

class Shop extends ChangeNotifier {
  // list food menu
  final List<Food> _foodMenu = [
    //samon sushi
    Food(
      name: 'Temaki',
      price: '23.00',
      imagePath: 'assets/temaki.png',
      rating: "4.8",
    ),
    Food(
      name: 'Salmon',
      price: '28.00',
      imagePath: 'assets/sushi.png',
      rating: "5.0",
    ),
  ];

  List<Food> _card = [];

  List<Food> get foodMenu => _foodMenu;
  List<Food> get card => _card;

  void addToCard(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _card.add(foodItem);
    }
    notifyListeners();
  }

  void removeFromCart(Food food) {
    _card.remove(food);
    notifyListeners();
  }
}
