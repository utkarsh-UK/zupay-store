import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum ProductSize { s, m, l, xl, xxl }

@immutable
class Product extends Equatable {
  final int id;
  final String title;
  final double price;
  final String category;
  final String description;
  final String imageURL;

  final ProductSize size;
  final Color color;

  const Product({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    this.description = '',
    required this.imageURL,
    this.size = ProductSize.s,
    this.color = Colors.black,
  });

  @override
  List<Object?> get props => [id, title, price];
}
