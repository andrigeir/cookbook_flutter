import './screens/auth_screen.dart';
import './screens/cart_screen.dart';
import './screens/confirm_order_screen.dart';
import './screens/orders_screen.dart';
import './screens/productDetailsScreen.dart';
import './screens/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'screens/ProductOverviewScreen.dart';
import 'screens/user_profile_screen.dart';
import 'screens/auth_screen.dart';
import 'screens/delivery_adress_screen.dart';
import 'screens/all_stores_screen.dart';
import 'screens/delivery_screen.dart';
import 'models/cart.dart';
import 'models/orders.dart';
import 'models/auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
        ChangeNotifierProvider.value(value: CartItem()),
        ChangeNotifierProvider.value(value: Cart()),
        ChangeNotifierProxyProvider<Auth, Orders>(
          create: null,
          update: (context, auth, previousOrders) => Orders(auth.token,
              auth.userId, previousOrders == null ? [] : previousOrders.orders),
        ),
      ],
      child: Consumer<Auth>(
        builder: (_, auth, child) => MaterialApp(
          theme: ThemeData(
            primaryColor: Color(0xFFd52b1e),
            accentColor: Colors.white,
            textTheme: GoogleFonts.nunitoTextTheme().copyWith(
              caption: GoogleFonts.nunito(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              headline1:
                  GoogleFonts.nunito(fontSize: 36, color: Color(0xFFd52b1e)),
              headline2: GoogleFonts.nunito(fontSize: 36, color: Colors.white),
              headline3:
                  GoogleFonts.nunito(fontSize: 20, color: Color(0xFFd52b1e)),
              headline4: GoogleFonts.nunito(fontSize: 20, color: Colors.white),
              headline5:
                  GoogleFonts.nunito(fontSize: 16, color: Color(0xFFd52b1e)),
              headline6: GoogleFonts.nunito(fontSize: 16, color: Colors.white),
              bodyText1:
                  GoogleFonts.nunito(fontSize: 12, color: Color(0xFFd52b1e)),
              bodyText2: GoogleFonts.nunito(fontSize: 12, color: Colors.white),
              button: GoogleFonts.nunito(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFd52b1e)),
            ),
          ),
          home: auth.isAuth ? DeliveryScreen() : AuthScreen(),
          routes: {
            ProductDetailsScreen.routeName: (context) => ProductDetailsScreen(),
            CartScreen.routeName: (context) => CartScreen(),
            ProductOverviewScreen.routeName: (context) =>
                ProductOverviewScreen(),
            UserProfile.routeName: (context) => UserProfile(),
            OrderScreen.routeName: (context) => OrderScreen(),
            AuthScreen.routeName: (context) => AuthScreen(),
            ConfirmOrderScreen.routeName: (context) => ConfirmOrderScreen(),
            DeliveryScreen.routeName: (context) => DeliveryScreen(),
            AllStoresScreen.routeName: (context) => AllStoresScreen(),
            DeliveryAdressScreen.routeName: (context) => DeliveryAdressScreen(),
          },
        ),
      ),
    );
  }
}
