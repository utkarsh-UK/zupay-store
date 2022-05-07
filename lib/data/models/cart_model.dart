// ignore_for_file: annotate_overrides, overridden_fields

import 'package:zupay_store/data/models/product_model.dart';
import 'package:zupay_store/domain/entities/cart.dart';
import 'package:zupay_store/domain/entities/product.dart';

class CartModel extends Cart {
  final int id;
  final int userId;
  final DateTime date;
  final double totalPrice;
  final List<Product> products;
  final Map<String, int> quantities;

  const CartModel({
    required this.id,
    required this.userId,
    required this.date,
    required this.totalPrice,
    required this.products,
    required this.quantities,
  }) : super(
          id: id,
          userId: userId,
          date: date,
          totalPrice: totalPrice,
          products: products,
          quantities: quantities,
        );

  @override
  List<Object?> get props => [id, userId, date, products];

  factory CartModel.fromJSON(Map<String, dynamic> json) => CartModel(
        id: num.parse('${json['id']}').toInt(),
        userId: num.parse('${json['id']}').toInt(),
        date: DateTime.now(),
        totalPrice: num.parse('${json['total']}').toDouble(),
        products: (json['products'] as List<dynamic>)
            .map((prod) => ProductModel.fromJSON(prod))
            .toList(),
        quantities: ('${json['quantities']}') as Map<String, int>,
      );

  CartModel copyWith({
    int? id,
    int? userId,
    DateTime? date,
    double? totalPrice,
    List<Product>? products,
    Map<String, int>? quantities,
  }) =>
      CartModel(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        date: date ?? this.date,
        totalPrice: totalPrice ?? this.totalPrice,
        products: products ?? this.products,
        quantities:  quantities ?? this.quantities,
      );
}
