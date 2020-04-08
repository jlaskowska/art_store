import 'package:flutter/material.dart';
import 'package:art_store/enums/category.dart';

class Product {
  final int id;
  final String author;
  final String name;
  final double price;
  final Category category;
  final double rating;
  final String assetPath;

  Product({
    @required this.author,
    @required this.name,
    @required this.id,
    @required this.category,
    @required this.price,
    @required this.rating,
  }) : assetPath = 'assets/images/$id.jpeg';

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        name: json['name'],
        author: json['author'],
        category: Category.values[json['category']],
        price: json['price'].toDouble(),
        rating: json['rating'].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'author': author,
        'category': category.index,
        'price': price,
        'rating': rating,
      };

  @override
  String toString() => toJson().toString();
}
