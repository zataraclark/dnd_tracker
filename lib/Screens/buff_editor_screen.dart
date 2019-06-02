import 'package:flutter/material.dart';

import '../Models/buff.dart';
import '../Widgets/entry.dart';

class BuffEditor extends StatefulWidget {
  final Buff _buff;

  BuffEditor(this._buff);

  @override
  State<StatefulWidget> createState() {
    return BuffEditorState();
  }
}

class BuffEditorState extends State<BuffEditor> {
  
  BuffEditorState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( // I would like to add a menu here where you can delete the buff from inside the buff editor screen
        title: Text("Edit Buff"),
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
                padding:EdgeInsets.fromLTRB(0, 10, 0, 0),
                height: 60.0,
                width: 300.0,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "${this.widget._buff.name}",
                    hintStyle: TextStyle(fontSize: 18.0),
                  ),
                  textCapitalization: TextCapitalization.words,
                  onChanged: (text) {
                    this.widget._buff.name = text;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(children: [
                  Row(children: [
                    Column(children: [
                      Entry("Str Stat", this.widget._buff.getStrStat, (text) {
                        if(text == "") {
                          text = "0";
                        }
                        this.widget._buff.setStrStat(int.parse(text));
                      }),
                      Entry("Dex Stat", this.widget._buff.getDexStat, (text) {
                        if(text == "") {
                          text = "0";
                        }
                        this.widget._buff.setDexStat(int.parse(text));
                      }),
                      Entry("Con Stat", this.widget._buff.getConStat, (text) {
                        if(text == "") {
                          text = "0";
                        }
                        this.widget._buff.setConStat(int.parse(text));
                      }),
                      Entry("Int Stat", this.widget._buff.getIntStat, (text) {
                        if(text == "") {
                          text = "0";
                        }
                        this.widget._buff.setIntStat(int.parse(text));
                      }),
                      Entry("Wis Stat", this.widget._buff.getWisStat, (text) {
                        if(text == "") {
                          text = "0";
                        }
                        this.widget._buff.setWisStat(int.parse(text));
                      }),
                      Entry("Cha Stat", this.widget._buff.getChaStat, (text) {
                        if(text == "") {
                          text = "0";
                        }
                        this.widget._buff.setChaStat(int.parse(text));
                      }),
                    ]),
                    Column(children: [
                      Entry("Str Mod", this.widget._buff.getStrMod, (text) {
                        if(text == "") {
                          text = "0";
                        }
                        this.widget._buff.setStrMod(int.parse(text));
                      }),
                      Entry("Dex Mod", this.widget._buff.getDexMod, (text) {
                        if(text == "") {
                          text = "0";
                        }
                        this.widget._buff.setDexMod(int.parse(text));
                      }),
                      Entry("Con Mod", this.widget._buff.getConMod, (text) {
                        if(text == "") {
                          text = "0";
                        }
                        this.widget._buff.setConMod(int.parse(text));
                      }),
                      Entry("Int Mod", this.widget._buff.getIntMod, (text) {
                        if(text == "") {
                          text = "0";
                        }
                        this.widget._buff.setIntMod(int.parse(text));
                      }),
                      Entry("Wis Mod", this.widget._buff.getWisMod, (text) {
                        if(text == "") {
                          text = "0";
                        }
                        this.widget._buff.setWisMod(int.parse(text));
                      }),
                      Entry("Cha Mod", this.widget._buff.getChaMod, (text) {
                        if(text == "") {
                          text = "0";
                        }
                        this.widget._buff.setChaMod(int.parse(text));
                      }),
                    ])
                  ]),
                  Entry("Attack Bonus", this.widget._buff.getAttackBonus, (text) {
                    if(text == "") {
                          text = "0";
                        }
                    this.widget._buff.setAttackBonus(int.parse(text));
                  }),
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
          ]),
        ),
      ),
    );
  }
}
