// ignore_for_file: annotate_overrides, overridden_fields

import 'package:flutter/material.dart';
import 'package:zupay_store/domain/entities/product.dart';

class ProductModel extends Product {
  final int id;
  final String title;
  final double price;
  final String category;
  final String description;
  final String imageURL;

  final ProductSize size;
  final Color color;

  const ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.imageURL,
    required this.description,
    this.size = ProductSize.s,
    this.color = Colors.black,
  }) : super(
          id: id,
          title: title,
          price: price,
          category: category,
          imageURL: imageURL,
          color: color,
          description: description,
          size: size,
        );

  @override
  List<Object?> get props => [id, title, price];

  factory ProductModel.fromJSON(Map<String, dynamic> json) => ProductModel(
        id: int.parse('${json['id']}'),
        title: '${json['title']}',
        price: num.parse('${json['price']}').toDouble(),
        category: '${json['category']}',
        imageURL: '${json['image']}',
        description: '${json['description']}',
      );
}
