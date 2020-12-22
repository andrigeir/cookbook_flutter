import 'package:flutter/material.dart';

class BackAppBar extends StatelessWidget {
  final String text;

  BackAppBar(this.text);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () => Navigator.of(context).pop(),
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Center(
                      child: Text(text,
                          style: Theme.of(context).textTheme.headline4),
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  )
                ],
              ),
            ),
          ],
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.85,
          height: 2,
          color: Theme.of(context).accentColor,
        )
      ],
    );
  }
}
