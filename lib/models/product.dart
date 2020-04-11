import 'package:flutter/material.dart';

class Product {
  final int id;
  final String author;
  final String name;
  final double price;
  final double rating;
  final String assetPath;

  Product({
    @required this.author,
    @required this.name,
    @required this.id,
    @required this.price,
    @required this.rating,
  }) : assetPath = 'assets/images/$id.jpeg';

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        name: json['name'],
        author: json['author'],
        price: json['price'].toDouble(),
        rating: json['rating'].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'author': author,
        'price': price,
        'rating': rating,
      };

  @override
  String toString() => toJson().toString();
}
