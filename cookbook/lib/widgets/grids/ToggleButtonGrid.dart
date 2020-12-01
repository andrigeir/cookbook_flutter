import 'package:flutter/material.dart';
import 'package:customtogglebuttons/customtogglebuttons.dart';
import 'package:provider/provider.dart';

import '../items/toggle_button_item.dart';
import '../../models/cart.dart';

class MyToggleButton extends StatefulWidget {
  final bool horizontalScroll;
  final List<String> titles;
  final int method;

  const MyToggleButton(
      {Key key,
      @required this.horizontalScroll,
      @required this.titles,
      @required this.method})
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

  void _setSize(BuildContext context, String _title) {
    Provider.of<CartItem>(context, listen: false).setSize(_title);
  }

  void _setType(BuildContext context, String _title) {
    Provider.of<CartItem>(context, listen: false).setType(_title);
  }

  void _addCandy(BuildContext context, String _candy) {
    Provider.of<CartItem>(context, listen: false).addCandy(_candy);
  }

  void _removeCandy(BuildContext context, String _candy) {
    Provider.of<CartItem>(context, listen: false).removeCandy(_candy);
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
                        if (widget.method != 3) {
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
                        }

                        if (widget.method == 1) {
                          _setSize(context, widget.titles[index]);
                        } else if (widget.method == 2) {
                          _setType(context, widget.titles[index]);
                        } else {
                          if (_isSelected.where((item) => item == true).length <
                                  4 &&
                              !_isSelected[index]) {
                            _isSelected[index] = true;
                            _color[index] = Theme.of(context).accentColor;
                            _addCandy(context, widget.titles[index]);
                          } else {
                            _isSelected[index] = false;
                            _color[index] = Colors.white.withOpacity(0.5);
                            _removeCandy(context, widget.titles[index]);
                          }
                        }
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
