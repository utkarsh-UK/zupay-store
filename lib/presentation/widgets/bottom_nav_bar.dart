import 'package:flutter/material.dart';
import 'package:zupay_store/core/theme/colors.dart';
import 'package:zupay_store/core/utils/extensions.dart';
import 'package:zupay_store/presentation/provider/products_provider.dart';
import 'package:zupay_store/presentation/screens/cart/view.dart';
import 'package:provider/provider.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({Key? key}) : super(key: key);
  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      context.read<ProductsProvider>().getAllProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 2.0.wp),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFEFF0F3),
              borderRadius: BorderRadius.circular(24.0),
            ),
            padding: EdgeInsets.symmetric(horizontal: 2.5.wp, vertical: 1.8.wp),
            child: Row(
              children: [
                SizedBox(
                  width: 2.0.wp,
                  height: 2.0.wp,
                  child: const Image(
                    image: AssetImage('assets/icons/home.png'),
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(width: 0.5.wp),
                Text(
                  'Home',
                  style: textTheme.subtitle2!.copyWith(
                    color: primaryTextColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 4.0.sp,
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const CartScreen(),
              ),
            ),
            child: SizedBox(
              width: 4.0.wp,
              height: 4.0.wp,
              child: const Image(
                image: AssetImage('assets/icons/cart.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
