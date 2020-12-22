import 'package:flutter/material.dart';

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key key, @required this.routeName}) : super(key: key);

  final String routeName;

  @override
  MyCustomFormState createState() {
    return MyCustomFormState(routeName);
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  MyCustomFormState(this.routeName);
  final String routeName;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        color: Theme.of(context).primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  fillColor: Theme.of(context).primaryColor,
                  labelText: 'Adress',
                  labelStyle: Theme.of(context).textTheme.bodyText2,
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).accentColor, width: 0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).accentColor, width: 1),
                  ),
                  contentPadding: EdgeInsets.all(14),
                ),
                style: Theme.of(context).textTheme.headline4,
                cursorColor: Theme.of(context).accentColor,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Vinsamlegast settu inn heimilisfang';
                  }
                  return null;
                },
              ),
            ),
            Center(
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Theme.of(context).primaryColor),
                ),
                child: Text('Halda Afram'),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    Navigator.of(context).pushNamed(routeName);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
