import 'package:flutter/material.dart';

import '../Models/attack.dart';
import '../Widgets/attack_buff_card.dart';
import '../src/misc_buffs.dart';

class AttackPhase extends StatefulWidget {
  final Attack _attack;

  AttackPhase(this._attack);

  @override
  State<StatefulWidget> createState() {
    return AttackPhaseState();
  }
}

class AttackPhaseState extends State<AttackPhase> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${this.widget._attack.name}")),
      body: Center(
        child: Column(children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "${this.widget._attack.getActiveBonus() + getMiscMod() >= 0 ? "+" : ""}${this.widget._attack.getActiveBonus() + getMiscMod()}",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Align(
            alignment: FractionalOffset.centerLeft,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Character Buffs"),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: this.widget._attack.character.buffs.length,
                itemBuilder: (BuildContext context, int index) {
                  return AttackBuffCard(
                      this.widget._attack.character.buffs[index], this.setState);
                }),
          ),
          Align(
            alignment: FractionalOffset.centerLeft,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Misc Buffs"),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: misc_buffs.length,
              itemBuilder: (BuildContext context, int index) {
                return AttackBuffCard(misc_buffs[index], this.setState);
              },
            ),
          ),
        ]),
      ),
    );
  }
}
