import 'package:flutter/material.dart';

class Product {
  int id;
  String author;
  String name;
  double price;
  int category;
  bool isFavourite;
  int rating;

  Product({
    @required this.author,
    @required this.name,
    @required this.id,
    @required this.category,
    @required this.price,
    @required this.rating,
    @required this.isFavourite,
  });
}
