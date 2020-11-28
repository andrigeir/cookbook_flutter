import 'package:flutter/material.dart';
import 'package:customtogglebuttons/customtogglebuttons.dart';

import '../items/toggle_button_item.dart';

class MyToggleButton extends StatefulWidget {
  final bool horizontalScroll;
  final List<String> titles;

  const MyToggleButton(
      {Key key, @required this.horizontalScroll, @required this.titles})
      : super(key: key);
  @override
  _MyToggleButtonState createState() => _MyToggleButtonState();
}

class _MyToggleButtonState extends State<MyToggleButton> {
  int i;
  List<bool> _isSelected;
  List<Color> _color;

  @override
  initState() {
    super.initState();
    i = widget.titles.length;
    _isSelected = List.generate(i, (_) => false);
    _color = List.generate(i, (_) => Colors.white.withOpacity(0.5));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Container(
            height: widget.horizontalScroll ? 75 : null,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 10),
              scrollDirection:
                  widget.horizontalScroll ? Axis.horizontal : Axis.vertical,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              children: [
                CustomToggleButtons(
                    children: <Widget>[
                      for (int a = 0; a < i; a++)
                        ToggleButtonItem(widget.titles[a], _color[a]),
                    ],
                    isSelected: _isSelected,
                    onPressed: (int index) {
                      setState(() {
                        _isSelected = List.generate(
                          i,
                          (_) => false,
                        );
                        _isSelected[index] = !_isSelected[index];
                        _color = List.generate(
                          i,
                          (_) => Colors.white.withOpacity(0.5),
                        );
                        _color[index] = Theme.of(context).accentColor;
                        // _setPrice(context, _title[index], []);
                        // _setSize(context, index);
                      });
                    },
                    borderColor: Theme.of(context).primaryColor,
                    selectedColor: Theme.of(context).primaryColor,
                    color: Theme.of(context).primaryColor,
                    selectedBorderColor: Theme.of(context).primaryColor,
                    spacing: 10,
                    borderWidth: 0,
                    elevation: 0,
                    unselectedFillColor: Theme.of(context).primaryColor)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
