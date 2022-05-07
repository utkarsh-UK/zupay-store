import 'package:flutter/material.dart';
import 'package:zupay_store/core/utils/extensions.dart';
import 'package:zupay_store/presentation/widgets/bottom_nav_bar.dart';

class AppScaffold extends StatelessWidget {
  final List<Widget> children;
  final bool isBottomBarShown;

  const AppScaffold({
    Key? key,
    required this.children,
    this.isBottomBarShown = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: isBottomBarShown ? const CustomBottomNavBar() : null,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SizedBox(
            height: size.height - kToolbarHeight,
            width: size.width,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 2.0.wp,
                  vertical: 3.0.wp,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: children,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
