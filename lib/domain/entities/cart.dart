import 'package:equatable/equatable.dart';
import 'package:zupay_store/domain/entities/product.dart';

class Cart extends Equatable {
  final int id;
  final int userId;
  final DateTime date;
  final double totalPrice;
  final List<Product> products;
  final Map<String, int> quantities;

  const Cart({
    required this.id,
    required this.userId,
    required this.date,
    required this.totalPrice,
    required this.products,
    required this.quantities,
  });

  @override
  List<Object?> get props => [id, userId, date, products];

  
  Cart copyWith({
    int? id,
    int? userId,
    DateTime? date,
    double? totalPrice,
    List<Product>? products,
    Map<String, int>? quantities,
  }) =>
      Cart(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        date: date ?? this.date,
        totalPrice: totalPrice ?? this.totalPrice,
        products: products ?? this.products,
        quantities:  quantities ?? this.quantities,
      );
}
