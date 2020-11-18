import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFFd52b1e),
        accentColor: Colors.white,
        textTheme: GoogleFonts.nunitoTextTheme().copyWith(
          headline1: GoogleFonts.nunito(fontSize: 36, color: Color(0xFFd52b1e)),
          headline2: GoogleFonts.nunito(fontSize: 36, color: Colors.white),
          headline3: GoogleFonts.nunito(fontSize: 20, color: Color(0xFFd52b1e)),
          headline4: GoogleFonts.nunito(fontSize: 20, color: Colors.white),
          bodyText1: GoogleFonts.nunito(fontSize: 12, color: Color(0xFFd52b1e)),
          bodyText2: GoogleFonts.nunito(fontSize: 12, color: Colors.white),
          button: GoogleFonts.nunito(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Color(0xFFd52b1e)),
        ),
      ),
      home: new Builder(
        builder: (context) => new Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          appBar: AppBar(
            backgroundColor: Theme.of(context).accentColor,
            title: Text(
              'Flutter Cookbook Demo',
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          body: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Center(
                    child: Container(
                      margin: EdgeInsets.all(8),
                      height: 150,
                      width: 150,
                      child: Image.asset('assets/Icecream_logo.png'),
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(8),
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/storm.jpg'),
                              fit: BoxFit.cover),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(8),
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/iceInABox.jpg'),
                              fit: BoxFit.cover),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(8),
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/iceInACone.jpg'),
                              fit: BoxFit.cover),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(8),
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/shake.jpg'),
                              fit: BoxFit.cover),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(8),
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/iceInABox.jpg'),
                              fit: BoxFit.cover),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(8),
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/iceInABox.jpg'),
                              fit: BoxFit.cover),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
