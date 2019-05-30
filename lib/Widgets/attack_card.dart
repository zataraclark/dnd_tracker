import 'package:flutter/material.dart';

import '../Models/character.dart';
import '../Models/attack.dart';
import '../Screens/attack_viewer_screen.dart';

class AttackCard extends StatelessWidget {
  final Attack _attack;
  final Character _character;

  AttackCard(this._attack, this._character);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AttackViewer(_character)),
        );
      },
      child: Card(
        child: Padding(
          padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    '${_attack.attack_name}',
                    textScaleFactor: 1.3,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
