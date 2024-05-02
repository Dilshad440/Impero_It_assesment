import 'package:flutter/material.dart';
import 'package:impero_it_assesment/src/features/products/presentations/products_listing_screen.dart';

import 'core/api_config/api_const.dart';
import 'core/api_config/rest_client.dart';
import 'core/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  RestClient.getInstance(baseUrl: ApiConst.baseUrl);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "E-Cubix Assessment",
      theme: AppTheme.getAppTheme(),
      home: const ProductListingScreen(),
    );
  }
}
