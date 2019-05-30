import 'package:flutter/material.dart';

import '../Models/buff.dart';
import '../Widgets/entry.dart';

class BuffEditor extends StatefulWidget {
  final Buff _buff;

  BuffEditor(this._buff);

  @override
  State<StatefulWidget> createState() {
    return BuffEditorState(_buff);
  }
}

class BuffEditorState extends State<BuffEditor> {
  Buff _buff;

  BuffEditorState(this._buff);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Buff"),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Center(
          child: Column(children: [
            Container(
              height: 60.0,
              width: 300.0,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "${_buff.buffName}",
                  hintStyle: TextStyle(fontSize: 18.0),
                ),
                textCapitalization: TextCapitalization.words,
                onChanged: (text) {
                  _buff.buffName = text;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(children: [
                Row(children: [
                  Column(children: [
                    Entry("Str Stat", _buff.getStrStat, (text) {
                      _buff.setStrStat(int.parse(text));
                    }),
                    Entry("Dex Stat", _buff.getDexStat, (text) {
                      _buff.setDexStat(int.parse(text));
                    }),
                    Entry("Con Stat", _buff.getConStat, (text) {
                      _buff.setConStat(int.parse(text));
                    }),
                    Entry("Int Stat", _buff.getIntStat, (text) {
                      _buff.setIntStat(int.parse(text));
                    }),
                    Entry("Wis Stat", _buff.getWisStat, (text) {
                      _buff.setWisStat(int.parse(text));
                    }),
                    Entry("Cha Stat", _buff.getChaStat, (text) {
                      _buff.setChaStat(int.parse(text));
                    }),
                  ]),
                  Column(children: [
                    Entry("Str Mod", _buff.getStrMod, (text) {
                      _buff.setStrMod(int.parse(text));
                    }),
                    Entry("Dex Mod", _buff.getDexMod, (text) {
                      _buff.setDexMod(int.parse(text));
                    }),
                    Entry("Con Mod", _buff.getDexMod, (text) {
                      _buff.setDexMod(int.parse(text));
                    }),
                    Entry("Int Mod", _buff.getDexMod, (text) {
                      _buff.setDexMod(int.parse(text));
                    }),
                    Entry("Wis Mod", _buff.getDexMod, (text) {
                      _buff.setDexMod(int.parse(text));
                    }),
                    Entry("Cha Mod", _buff.getDexMod, (text) {
                      _buff.setDexMod(int.parse(text));
                    }),
                  ])
                ]),
                Entry("Attack Bonus", _buff.getAttackBonus, (text) {
                    _buff.setAttackBonus(int.parse(text));
                  })
              ]),
            ),
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
        ),
      ),
    );
  }
}
