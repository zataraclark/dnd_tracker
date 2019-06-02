import 'package:flutter/material.dart';

import '../Models/character.dart';
import '../Models/attack.dart';
import '../Screens/attack_editor_screen.dart';
import '../Screens/attack_phase_screen.dart';

enum AttackCardOption { edit, delete }

class AttackCard extends StatelessWidget {
  final Attack _attack;
  final Function _deleteAttack;

  AttackCard(this._attack, this._deleteAttack);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AttackPhase(_attack)),
        );
      },
      child: Card(
        child: AppBar(
            leading:
                Container(), // This empty container removes the back button on the AppBar
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            flexibleSpace: Padding(
              padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
              child: Row(children: [
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      '${_attack.name}',
                      textScaleFactor: 1.3,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "${_attack.getTotalBonus() >= 0 ? "+" : ""}${_attack.getTotalBonus()}",
                  ),
                )
              ]),
            ),
            actions: [
              PopupMenuButton<AttackCardOption>(
                  onSelected: (AttackCardOption result) {
                    if (result == AttackCardOption.delete) {
                      _deleteAttack(_attack);
                    }
                    if (result == AttackCardOption.edit) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AttackEditor(_attack)),
                      );
                    }
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<AttackCardOption>>[
                        const PopupMenuItem<AttackCardOption>(
                          value: AttackCardOption.edit,
                          child: Text("Edit"),
                        ),
                        const PopupMenuItem<AttackCardOption>(
                          value: AttackCardOption.delete,
                          child: Text("Delete"),
                        ),
                      ]),
            ]),
      ),
    );
  }
}
