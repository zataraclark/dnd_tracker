import 'package:flutter/material.dart';

import '../Models/attack.dart';
import '../Widgets/entry.dart';
import '../Widgets/check_entry.dart';

class AttackEditor extends StatefulWidget {
  final Attack _attack;

  AttackEditor(this._attack);

  @override
  State<StatefulWidget> createState() {
    return AttackEditorState();
  }
}

class AttackEditorState extends State<AttackEditor> {

  AttackEditorState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // I would like to add a menu here where you can delete the attack from inside the attack editor screen
        title: Text("Edit Attack"),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Center(
          child: ListView(children: [
            Column(children: [
              Container(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                height: 60.0,
                width: 300.0,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "${this.widget._attack.name}",
                    hintStyle: TextStyle(fontSize: 18.0),
                  ),
                  textCapitalization: TextCapitalization.words,
                  onChanged: (text) {
                    this.widget._attack.name = text;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "${this.widget._attack.getTotalBonus() >= 0 ? "+" : ""}${this.widget._attack.getTotalBonus()}",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Row(children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(children: [
                    CheckEntry(
                        "BAB:", this.widget._attack.getBAB, this.widget._attack.setBAB, this.setState),
                    CheckEntry("Str Mod:",this.widget._attack.getStrMod, this.widget._attack.setStrMod,
                        this.setState),
                    CheckEntry("Dex Mod:", this.widget._attack.getDexMod, this.widget._attack.setDexMod,
                        this.setState),
                    CheckEntry("Con Mod:", this.widget._attack.getConMod, this.widget._attack.setConMod,
                        this.setState),
                  ]),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(children: [
                    Entry("Misc Mod", this.widget._attack.getMiscMod, (text) {
                      this.widget._attack.setMiscMod(int.parse(text));
                    }),
                    CheckEntry("Int Mod:", this.widget._attack.getIntMod, this.widget._attack.setIntMod,
                        this.setState),
                    CheckEntry("Wis Mod:", this.widget._attack.getWisMod, this.widget._attack.setWisMod,
                        this.setState),
                    CheckEntry("Cha Mod:", this.widget._attack.getChaMod, this.widget._attack.setChaMod,
                        this.setState),
                  ]),
                ),
              ]),
              Align(
                alignment: FractionalOffset.bottomRight,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: RaisedButton(
                      child: Text("Finish"),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ),
              ),
            ]),
          ]),
        ),
      ),
    );
  }
}
