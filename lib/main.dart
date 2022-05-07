import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zupay_store/core/theme/theme.dart';
import 'package:zupay_store/presentation/screens/home/view.dart';

import 'di/locator.dart' as di;
import 'presentation/provider/products_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  di.inject();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => di.locator<ProductsProvider>(),
      child: MaterialApp(
        title: 'Store',
        debugShowCheckedModeBanner: false,
        theme: ApplicationTheme.getAppThemeData(),
        home: const HomeScreen(),
      ),
    );
  }
}
