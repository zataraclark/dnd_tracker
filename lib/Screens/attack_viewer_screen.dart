import 'package:flutter/material.dart';

import '../Models/character.dart';
import '../Models/attack.dart';
import '../Widgets/attack_card.dart';

class AttackViewer extends StatefulWidget {
  final Character _character;

  AttackViewer(this._character);

  createState() {
    return AttackViewerState(_character);
  }
}

class AttackViewerState extends State<AttackViewer> {
  Character _character;

  AttackViewerState(this._character);

  Future<Attack> _addAttackDialog(BuildContext context) async {
    String attackName;
    bool addDex = false;
    bool addStr = true;
    int miscMod = 0;
    String example = "Longsword";

    return showDialog<Attack>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Text("Attack",
                style: TextStyle(fontStyle: FontStyle.normal, fontSize: 20.0)),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("Finish"),
              onPressed: () {
                if (attackName == null || attackName == "") {
                  //
                } else {
                  Navigator.of(context).pop(Attack(_character, attackName, true, false, 0));
                }
              },
            ),
            FlatButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
          content: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: ListView(children: [
              Container(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  textCapitalization: TextCapitalization.words,
                  autofocus: true,
                  decoration: InputDecoration(
                      labelText: 'Attack Name', hintText: "e.g. $example"),
                  onChanged: (text) {
                    attackName = text;
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                child: Row(children: [
                  // Radio Buttons-----------------------------
                ]),
              ),
            ]),
          ),
        );
      },
    );
  }

  void _deleteAttack(Attack victim) {
    setState(() {
      _character.attacks.remove(victim);
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Attacks"),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Center(
          child: Column(children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Add Attack:"),
            ),
            RaisedButton(
                child: Text(
                  "New Attack",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.body2,
                ),
                onPressed: () async {
                  final Attack newAttack = await _addAttackDialog(context);
                  _character.addAttack(newAttack);
                }),
                Expanded(
              child: ListView.builder(
                itemCount: _character.buffs.length,
                itemBuilder: (BuildContext context, int index) {
                  return AttackCard(_character.attacks[index], _character);
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
