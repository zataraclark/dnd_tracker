import 'package:flutter/material.dart';

import '../Models/buff.dart';

class AttackBuffCard extends StatefulWidget {
  Buff _buff;
  Function _updateFunction;
  AttackBuffCard(this._buff, this._updateFunction);

  @override
  State<StatefulWidget> createState() {
    return AttackBuffCardState();
  }
}

class AttackBuffCardState extends State<AttackBuffCard> {

  @override
  Widget build(BuildContext context) {
    return Card(
      child: AppBar(
        leading: Container(), // This empty Container removes the back button
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        flexibleSpace: Column(children: [
          Row(
            children: [
              Checkbox(
                value: this.widget._buff.active,
                onChanged: (value) {
                  setState(() {
                    this.widget._buff.active = value;
                    this.widget._updateFunction((){});
                    });
                },
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    '${this.widget._buff.name}',
                    textScaleFactor: 1.3,
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Text("Attack Bonus: ${this.widget._buff.attackBonus}",
                      style: Theme.of(context).textTheme.body2)),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(children: [
              Expanded(
                  flex: 1,
                  child: Text("Str: ${this.widget._buff.strStat}",
                      style: Theme.of(context).textTheme.body2)),
              Expanded(
                  flex: 1,
                  child: Text("Dex: ${this.widget._buff.dexStat}",
                      style: Theme.of(context).textTheme.body2)),
              Expanded(
                  flex: 1,
                  child: Text("Con: ${this.widget._buff.conStat}",
                      style: Theme.of(context).textTheme.body2)),
              Expanded(
                  flex: 1,
                  child: Text("Int: ${this.widget._buff.intStat}",
                      style: Theme.of(context).textTheme.body2)),
              Expanded(
                  flex: 1,
                  child: Text("Wis: ${this.widget._buff.wisStat}",
                      style: Theme.of(context).textTheme.body2)),
              Expanded(
                  flex: 1,
                  child: Text("Cha: ${this.widget._buff.chaStat}",
                      style: Theme.of(context).textTheme.body2)),
            ]),
          ),
        ]),
      ),
    );
  }
}
