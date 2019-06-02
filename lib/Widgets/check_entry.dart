import 'package:flutter/material.dart';

class CheckEntry extends StatefulWidget {
  final _text;
  final Function _originalValue;
  final Function _onChanged;
  final Function _updateFunction;

  CheckEntry(this._text, this._originalValue, this._onChanged, this._updateFunction);

  @override
  State<StatefulWidget> createState() {
    return CheckEntryState();
  }
}

class CheckEntryState extends State<CheckEntry> {
  CheckEntryState();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
      child: Row(children: [
        Text("${this.widget._text}", style: Theme.of(context).textTheme.body2),
        Checkbox(
          value: this.widget._originalValue(),
          onChanged: (value) {
            
            setState(() {
              this.widget._onChanged(value);
              this.widget._updateFunction((){});
            });
            
          },
        )
      ]),
    );
  }
}
