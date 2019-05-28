import 'package:flutter/material.dart';

import '../Models/character.dart';
import '../Models/stat_buff.dart';
import '../Widgets/buff_card.dart';

enum ConfirmAction { DELETE, CANCEL }

enum BuffCardOption { clear_all }

class BuffEditor extends StatefulWidget {
  final Character _character;

  BuffEditor(this._character);
  @override
  State<StatefulWidget> createState() {
    return BuffEditorState(_character);
  }
}

class BuffEditorState extends State<BuffEditor> {
  final Character _character;

  BuffEditorState(this._character);

  Future<StatBuff> _addBuffDialog(BuildContext context, var ability) async {
    String buffName;
    int buffStat;
    int buffMod;
    String abilityString = "";
    String example = "";
    switch (ability) {
      case Ability.str:
        {
          abilityString = "Str";
          example = "Bull's Strength";
          break;
        }
      case Ability.dex:
        {
          abilityString = "Dex";
          example = "Cat's Grace";
          break;
        }
      case Ability.con:
        {
          abilityString = "Con";
          example = "Bear's Endurance";
          break;
        }
      case Ability.intel:
        {
          abilityString = "Int";
          example = "Fox's Cunning";
          break;
        }
      case Ability.wis:
        {
          abilityString = "Wis";
          example = "Owl's Wisdom";
          break;
        }
      case Ability.cha:
        {
          abilityString = "Cha";
          example = "Eagle's Splendor";
          break;
        }
    }
    return showDialog<StatBuff>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Text("$abilityString Buff",
                style: TextStyle(fontStyle: FontStyle.normal, fontSize: 20.0)),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("Finish"),
              onPressed: () {
                if (buffName == null || buffName == "") {
                  //
                } else {
                  Navigator.of(context)
                      .pop(StatBuff(buffName, buffStat, buffMod, ability));
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
                      labelText: 'Buff Name', hintText: "e.g. $example"),
                  onChanged: (text) {
                    buffName = text;
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                child: Row(children: [
                  Expanded(
                    flex: 2,
                    child: TextField(
                      textAlign: TextAlign.center,
                      maxLength: 2,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Stat Buff",
                        counterText: "",
                      ),
                      onChanged: (text) {
                        buffStat = int.parse(text);
                      },
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: TextField(
                      textAlign: TextAlign.center,
                      maxLength: 2,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Mod Buff",
                        counterText: "",
                      ),
                      onChanged: (text) {
                        buffMod = int.parse(text);
                      },
                    ),
                  ),
                ]),
              ),
            ]),
          ),
        );
      },
    );
  }

  void _deleteBuff(StatBuff victim) {
    setState(() {
      _character.buffs.remove(victim);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Buffs"), actions: [
        PopupMenuButton<BuffCardOption>(
            onSelected: (BuffCardOption result) {
              if (result == BuffCardOption.clear_all) {
                setState(() {
                  _character.buffs.clear();
                });
              }
            },
            itemBuilder: (BuildContext context) =>
                <PopupMenuEntry<BuffCardOption>>[
                  const PopupMenuItem<BuffCardOption>(
                    value: BuffCardOption.clear_all,
                    child: Text("Clear All Buffs"),
                  ),
                ]),
      ]),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Center(
          child: Column(children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Add Buff:"),
            ),
            Row(children: [
              Expanded(
                flex: 1,
                child: RaisedButton(
                    child: Text(
                      "Str Buff",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.body2,
                    ),
                    onPressed: () async {
                      final StatBuff newBuff =
                          await _addBuffDialog(context, Ability.str);
                      _character.addBuff(newBuff);
                    }),
              ),
              Expanded(
                flex: 1,
                child: RaisedButton(
                    child: Text(
                      "Dex Buff",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.body2,
                    ),
                    onPressed: () async {
                      final StatBuff newBuff =
                          await _addBuffDialog(context, Ability.dex);
                      _character.addBuff(newBuff);
                    }),
              ),
              Expanded(
                flex: 1,
                child: RaisedButton(
                    child: Text(
                      "Con Buff",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.body2,
                    ),
                    onPressed: () async {
                      final StatBuff newBuff =
                          await _addBuffDialog(context, Ability.con);
                      _character.addBuff(newBuff);
                    }),
              ),
            ]),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: RaisedButton(
                      child: Text(
                        "Int Buff",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.body2,
                      ),
                      onPressed: () async {
                        final StatBuff newBuff =
                            await _addBuffDialog(context, Ability.intel);
                        _character.addBuff(newBuff);
                      }),
                ),
                Expanded(
                  flex: 1,
                  child: RaisedButton(
                      child: Text(
                        "Wis Buff",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.body2,
                      ),
                      onPressed: () async {
                        final StatBuff newBuff =
                            await _addBuffDialog(context, Ability.wis);
                        _character.addBuff(newBuff);
                      }),
                ),
                Expanded(
                  flex: 1,
                  child: RaisedButton(
                      child: Text(
                        "Cha Buff",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.body2,
                      ),
                      onPressed: () async {
                        final StatBuff newBuff =
                            await _addBuffDialog(context, Ability.cha);
                        _character.addBuff(newBuff);
                      }),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _character.buffs.length,
                itemBuilder: (BuildContext context, int index) {
                  return BuffCard(_character.buffs[index], _deleteBuff);
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}