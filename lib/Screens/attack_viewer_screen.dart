import 'package:flutter/material.dart';

import './attack_editor_screen.dart';
import '../Models/character.dart';
import '../Models/attack.dart';
import '../Widgets/attack_card.dart';

class AttackViewer extends StatefulWidget {
  final Character _character;

  AttackViewer(this._character);

  createState() {
    return AttackViewerState();
  }
}

class AttackViewerState extends State<AttackViewer> {

  AttackViewerState();

  void createAttack() {
    Attack newAttack = new Attack(this.widget._character);
    this.widget._character.addAttack(newAttack);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AttackEditor(newAttack)),
    );
    setState(() {});
  }

  void _deleteAttack(Attack victim) {
    setState(() {
      this.widget._character.attacks.remove(victim);
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
            RaisedButton(
                child: Text(
                  "New Attack",
                  textAlign: TextAlign.center,
                ),
                onPressed: createAttack
                ),
            Expanded(
              child: ListView.builder(
                itemCount: this.widget._character.attacks.length,
                itemBuilder: (BuildContext context, int index) {
                  return AttackCard(this.widget._character.attacks[index], _deleteAttack);
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
