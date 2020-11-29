import 'package:cookbook/screens/cart_screen.dart';
import 'package:cookbook/screens/productDetailsScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'screens/ProductOverviewScreen.dart';
import 'models/cart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: CartItem()),
          ChangeNotifierProvider.value(value: Cart()),
        ],
        child: MaterialApp(
            theme: ThemeData(
              primaryColor: Color(0xFFd52b1e),
              accentColor: Colors.white,
              textTheme: GoogleFonts.nunitoTextTheme().copyWith(
                headline1:
                    GoogleFonts.nunito(fontSize: 36, color: Color(0xFFd52b1e)),
                headline2:
                    GoogleFonts.nunito(fontSize: 36, color: Colors.white),
                headline3:
                    GoogleFonts.nunito(fontSize: 20, color: Color(0xFFd52b1e)),
                headline4:
                    GoogleFonts.nunito(fontSize: 20, color: Colors.white),
                bodyText1:
                    GoogleFonts.nunito(fontSize: 12, color: Color(0xFFd52b1e)),
                bodyText2:
                    GoogleFonts.nunito(fontSize: 12, color: Colors.white),
                button: GoogleFonts.nunito(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFd52b1e)),
              ),
            ),
            home: ProductOverviewScreen(),
            routes: {
              ProductDetailsScreen.routeName: (context) =>
                  ProductDetailsScreen(),
              CartScreen.routeName: (context) => CartScreen(),
              ProductOverviewScreen.routeName: (context) =>
                  ProductOverviewScreen()
            }));
  }
}
