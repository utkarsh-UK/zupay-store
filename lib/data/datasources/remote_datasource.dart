import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:zupay_store/core/utils/constants.dart';
import 'package:zupay_store/core/utils/exceptions.dart';
import 'package:zupay_store/data/models/product_model.dart';

abstract class RemoteDatasource {
  Future<List<ProductModel>> getAllProducts();
}

class RemoteDatsourceImpl extends RemoteDatasource {
  final http.Client client;

  RemoteDatsourceImpl(this.client);

  @override
  Future<List<ProductModel>> getAllProducts() async {
    try {
      final url = Uri.https(Constants.baseUrl, '/products');
      final response = await client.get(url);

      if (response.statusCode == 200) {
        debugPrint('${response.body}');

        return (jsonDecode(response.body) as List<dynamic>)
            .map((prod) => ProductModel.fromJSON(prod))
            .toList();
      } else {
        throw ServerException(message: response.reasonPhrase!);
      }
    } catch (e, stack) {
      debugPrint('$e \n $stack');
      throw ServerException(message: e.toString());
    }
  }
}
