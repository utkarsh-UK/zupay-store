import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zupay_store/core/theme/colors.dart';
import 'package:zupay_store/core/utils/extensions.dart';
import 'package:zupay_store/presentation/provider/products_provider.dart';
import 'package:zupay_store/presentation/widgets/app_scaffold.dart';
import 'package:zupay_store/presentation/widgets/custom_icon_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AppScaffold(
      isBottomBarShown: false,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomIconButton(
              iconImage: const AssetImage('assets/icons/back.png'),
              onClick: () => Navigator.of(context).pop(),
            ),
            Text('Your Cart', style: textTheme.headline6),
            Text('', style: textTheme.headline6),
          ],
        ),
        SizedBox(height: 3.0.wp),
        Consumer<ProductsProvider>(
          builder: (context, provider, child) => provider.cart == null
              ? Center(
                  child:
                      Text('No Cart items added', style: textTheme.headline6),
                )
              : ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: provider.cart?.products.length ?? 0,
                  separatorBuilder: (_, __) =>
                      const Divider(color: borderColor),
                  itemBuilder: (_, index) {
                    final product = provider.cart!.products[index];
                    final quantity = provider.cart!.quantities['${product.id}'];

                    return Container(
                      margin: EdgeInsets.only(bottom: 1.0.wp, top: 1.0.wp),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 1.0.wp),
                            width: 6.0.wp,
                            height: 6.0.wp,
                            child: Image(
                              image: NetworkImage(
                                product.imageURL,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      flex: 3,
                                      child: Text(
                                        product.title,
                                        style: textTheme.subtitle1!.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: primaryTextColor,
                                          fontSize: 4.0.sp,
                                        ),
                                        softWrap: true,
                                      ),
                                    ),
                                    Flexible(
                                      child: Text(
                                        '\$ ${product.price * (quantity ?? 1)}',
                                        style: textTheme.subtitle1!.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: primaryTextColor,
                                          fontSize: 4.0.sp,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 1.0.wp),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'Size: ',
                                            style:
                                                textTheme.bodyText2!.copyWith(
                                              fontSize: 4.0.sp,
                                            ),
                                          ),
                                          TextSpan(
                                            text: 'S',
                                            style:
                                                textTheme.headline6!.copyWith(
                                              fontSize: 4.0.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Color',
                                          style: textTheme.bodyText2!.copyWith(
                                            fontSize: 4.0.sp,
                                          ),
                                        ),
                                        Container(
                                          width: 16.0,
                                          height: 16.0,
                                          margin: EdgeInsets.only(left: 1.0.wp),
                                          decoration: BoxDecoration(
                                            color: primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: () =>
                                              provider.removeProductFromCart(
                                                  product.id),
                                          child: Container(
                                            margin:
                                                EdgeInsets.only(right: 1.0.wp),
                                            padding: const EdgeInsets.all(2.0),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: borderColor,
                                                width: 1.0,
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            child: Icon(Icons.remove,
                                                size: 2.0.wp),
                                          ),
                                        ),
                                        Text(
                                          quantity.toString(),
                                          style: textTheme.headline6!.copyWith(
                                            fontSize: 4.0.sp,
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () => provider
                                              .addProductToCart(product),
                                          child: Container(
                                            margin:
                                                EdgeInsets.only(left: 1.0.wp),
                                            padding: const EdgeInsets.all(2.0),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: borderColor,
                                                width: 1.0,
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            child:
                                                Icon(Icons.add, size: 2.0.wp),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
        ),
        SizedBox(height: 2.0.wp),
        Consumer<ProductsProvider>(
          builder: (context, provider, child) => provider.cart == null
              ? const SizedBox.shrink()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Price',
                      style: textTheme.headline6!.copyWith(
                        fontSize: 4.0.sp,
                      ),
                    ),
                    Text(
                      '\$ ${provider.cart!.totalPrice.toStringAsFixed(2)}',
                      style: textTheme.headline6!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
        ),
        SizedBox(height: 1.0.wp),
        SizedBox(
          width: double.infinity,
          child: TextButton(
            onPressed: null,
            style: TextButton.styleFrom(
              backgroundColor: primaryColor,
              padding: EdgeInsets.symmetric(vertical: 1.5.wp),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
            ),
            child: Text(
              'Payment',
              style: textTheme.button!.copyWith(
                color: backgroundColor,
                fontSize: 4.5.sp,
                letterSpacing: 1.2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
