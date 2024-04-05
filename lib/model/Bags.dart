import 'package:flutter/material.dart';

class Bags extends ChangeNotifier {
  // Method to sort bags by price in ascending order
  void sortByPriceAscending() {
    _coolBags.sort((a, b) => a.price.compareTo(b.price));
    notifyListeners();
  }

  // Method to sort bags by price in descending order
  void sortByPriceDescending() {
    _coolBags.sort((a, b) => b.price.compareTo(a.price));
    notifyListeners();
  }

  // Method to sort bags by customer reviews
  void sortByCustomerReview() {
    _coolBags.sort((a, b) => b.rate.compareTo(a.rate));
    notifyListeners();
  }

  // list of items on sale
  Bags({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.rate,
    required this.description,
  });

  String id;
  String image;
  String name;
  int price;
  double rate;
  String description;

  factory Bags.fromJson(Map<String, dynamic> json) => Bags(
        id: json["id"],
        image: json["image"],
        name: json["name"],
        price: json["price"],
        rate: json["rate"].toDouble(),
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "name": name,
        "price": price,
        "rate": rate,
        "description": description,
      };

  //bool isPriceAscending = true;
}

final List newbag = [
  Bags(
      id: '1',
      image: 'images/1.png',
      name: 'Sport Bag',
      price: 50,
      rate: 4.5,
      description: 'It might be pricy but it worth it'),
  Bags(
      id: '2',
      image: 'images/2.png',
      name: 'Back Bag',
      price: 20,
      rate: 4.5,
      description: 'This bag is so amazing'),
  Bags(
      id: '3',
      image: 'images/3.png',
      name: 'Traveling Bag',
      price: 10,
      rate: 4,
      description: 'This bag can hold all your staff'),
];

final List _coolBags = [
  Bags(
      id: '1',
      image: 'images/1.png',
      name: 'Sport Bag',
      price: 50,
      rate: 4.5,
      description: 'It might be pricy but it worth it'),
  Bags(
      id: '2',
      image: 'images/2.png',
      name: 'Back Bag',
      price: 20,
      rate: 4.5,
      description: 'This bag is so amazing'),
  Bags(
      id: '3',
      image: 'images/3.png',
      name: 'Traveling Bag',
      price: 10,
      rate: 4,
      description: 'This bag can hold all your staff'),
  Bags(
      id: '4',
      image: 'images/4.png',
      name: 'School Bag',
      price: 12,
      rate: 4.8,
      description: 'This bag is so amazing'),
  Bags(
      id: '5',
      image: 'images/5.png',
      name: 'Purs',
      price: 12,
      rate: 4.8,
      description: 'This is it it is your dream purs'),
  Bags(
      id: '6',
      image: 'images/6.png',
      name: 'Hicking Bag',
      price: 40,
      rate: 5,
      description: 'This bag can hold all your staff'),
];

// list of cart items
List _CartItems = [];
get coolBags => _coolBags;
get cartitems => _CartItems;

// add item to cart
void addItemsToCart(int index) {
  _CartItems.add(_coolBags[index]);
  ChangeNotifier();
}

// remove item form cart
void removeItemFromCart(int index) {
  _CartItems.removeAt(index);
  ChangeNotifier();
}

// calculate total price
String calculateTotal() {
  double totalPrice = 0;
  for (int i = 0; i < _coolBags.length; i++) {
    totalPrice += double.parse(_coolBags[i][1]);
  }
  return totalPrice.toStringAsFixed(2);
}
