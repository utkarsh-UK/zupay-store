import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zupay_store/core/theme/colors.dart';
import 'package:zupay_store/core/utils/extensions.dart';
import 'package:zupay_store/presentation/provider/products_provider.dart';
import 'package:zupay_store/presentation/widgets/app_scaffold.dart';
import 'package:zupay_store/presentation/widgets/custom_icon_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AppScaffold(
      children: [
        SizedBox(height: 2.0.wp),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            CustomIconButton(
              iconImage: AssetImage('assets/icons/menu.png'),
            ),
            CustomIconButton(
              iconImage: AssetImage('assets/icons/search.png'),
            ),
          ],
        ),
        SizedBox(height: 3.0.wp),
        Text('New Arrivals', style: textTheme.headline6),
        SizedBox(height: 2.0.wp),
        Consumer<ProductsProvider>(
          builder: (context, provider, child) => provider.isFetchingProducts
              ? const CircularProgressIndicator()
              : GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: provider.products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 1.0.wp,
                    mainAxisSpacing: 1.2.wp,
                    // childAspectRatio:
                    //     (size.width / 2) / (size.height - kToolbarHeight - 24) / 2,
                    childAspectRatio: 2 / 3.5,
                  ),
                  itemBuilder: (_, index) {
                    final product = provider.products[index];

                    return Container(
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // grid image
                          Expanded(
                            flex: 2,
                            child: Image(
                              image: NetworkImage(
                                product.imageURL,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          // tile details
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 1.0.wp,
                                vertical: 1.0.wp,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.title,
                                    style: textTheme.subtitle2!.copyWith(
                                      color: secondaryColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 3.5.sp,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    product.description,
                                    style: textTheme.subtitle1!.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: primaryTextColor,
                                      fontSize: 4.0.sp,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const Spacer(),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          '\$ ${product.price}',
                                          style: textTheme.headline6!.copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 5.0.sp,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        InkWell(
                                          onTap: () => provider.addProductToCart(product) ,
                                          child: SizedBox(
                                            width: 3.0.wp,
                                            height: 3.0.wp,
                                            child: const Image(
                                              image: AssetImage(
                                                'assets/icons/cart.png',
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
  
}
