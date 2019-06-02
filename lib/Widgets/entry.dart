import 'package:flutter/material.dart';

class Entry extends StatelessWidget {
  final _text;
  final _hintTextFunction;
  final _onChangedFunction;

  Entry(this._text, this._hintTextFunction, this._onChangedFunction);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Row(
        children: [
          Text("$_text", style: Theme.of(context).textTheme.body2),
          Container(
            width: 40.0,
            height: 40.0,
            child: TextField(
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.body2,
              maxLength: 2,
              decoration: InputDecoration(
                hintText: "${_hintTextFunction()}",
                counterText: "",
              ),
              keyboardType: TextInputType.number,
              onChanged: _onChangedFunction,
            ),
          ),
        ],
      ),
    );
  }
}
