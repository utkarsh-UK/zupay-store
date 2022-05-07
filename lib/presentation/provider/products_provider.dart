import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zupay_store/core/usecases/usecase.dart';
import 'package:zupay_store/core/utils/helpers.dart';
import 'package:zupay_store/domain/entities/cart.dart';
import 'package:zupay_store/domain/entities/product.dart';
import 'package:zupay_store/domain/usecase/user/get_all_products.dart';

class ProductsProvider extends ChangeNotifier {
  final GetAllProducts _getAllProducts;

  ProductsProvider({required GetAllProducts getAllProducts})
      : _getAllProducts = getAllProducts;

  List<Product> products = [];
  Cart? cart;

  bool isFetchingProducts = false;
  String failureMessage = '';

  Future<void> getAllProducts() async {
    isFetchingProducts = true;
    notifyListeners();

    final failureOrProducts = await _getAllProducts(NoParams());

    failureOrProducts.fold(
      (failure) {
        isFetchingProducts = false;
        failureMessage = Helpers.convertFailureToString(failure);
      },
      (fetchedProducts) {
        isFetchingProducts = false;
        products = fetchedProducts;
      },
    );

    notifyListeners();
  }

  void addProductToCart(Product product) {
    if (cart == null) {
      cart = Cart(
        id: Random().nextInt(100),
        userId: 1,
        date: DateTime.now(),
        totalPrice: product.price,
        products: [product],
        quantities: {product.id.toString(): 1},
      );
      Fluttertoast.showToast(msg: '${product.title} has been added to cart');
    } else if (cart != null && cart!.quantities.containsKey('${product.id}')) {
      final oldQuantities = cart!.quantities;
      oldQuantities['${product.id}'] = oldQuantities['${product.id}']! + 1;
      final totalPrice = cart!.totalPrice;

      cart = cart!.copyWith(
        quantities: oldQuantities,
        totalPrice: totalPrice + product.price,
      );
    } else {
      final oldQuantities = cart!.quantities;
      oldQuantities['${product.id}'] = 1;

      final totalPrice = cart!.totalPrice;
      final oldProducts = cart!.products;

      cart = cart!.copyWith(
        quantities: oldQuantities,
        totalPrice: totalPrice + product.price,
        products: oldProducts..add(product),
      );

      Fluttertoast.showToast(msg: '${product.title} has been added to cart');
    }

    notifyListeners();
  }

  void removeProductFromCart(int productId) {
    if (cart == null) return;

    if (cart != null && cart!.quantities.containsKey('$productId')) {
      final oldQuantities = cart!.quantities;
      final oldProducts = cart!.products;
      if (oldQuantities['$productId'] == 1) {
        oldQuantities.remove('$productId');
        oldProducts.removeWhere((prod) => prod.id == productId);
      } else {
        oldQuantities['$productId'] = oldQuantities['$productId']! - 1;
      }

      final totalPrice = cart!.totalPrice;
      final productPrice =
          products.firstWhere((prod) => prod.id == productId).price;

      cart = cart!.copyWith(
        quantities: oldQuantities,
        products: oldProducts,
        totalPrice: totalPrice - productPrice,
      );
    }

    if (cart!.products.isEmpty) {
      cart = null;
    }
    notifyListeners();
  }
}
