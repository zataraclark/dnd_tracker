import 'package:flutter/material.dart';

import '../Models/attack.dart';
import '../Models/character.dart';
import '../Screens/character_editor_screen.dart';
import '../Screens/buff_viewer_screen.dart';
import '../Screens/attack_viewer_screen.dart';
import '../Widgets/attack_card.dart';

enum CharacterCardOption { delete, edit }

class CharacterViewer extends StatefulWidget {
  final Character _character;
  final Function _deleteCharacter;
  CharacterViewer(this._character, this._deleteCharacter);

  @override
  State<StatefulWidget> createState() {
    return CharacterViewerState();
  }
}

class CharacterViewerState extends State<CharacterViewer> {

  CharacterViewerState();

  void _deleteAttack(Attack victim) {
    setState(() {
      this.widget._character.attacks.remove(victim);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${this.widget._character.name}"), actions: [
        PopupMenuButton<CharacterCardOption>(
            onSelected: (CharacterCardOption result) {
              if (result == CharacterCardOption.delete) {
                this.widget._deleteCharacter(this.widget._character);
              } else if (result == CharacterCardOption.edit) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CharacterEditor(this.widget._character)),
                );
              }
            },
            itemBuilder: (BuildContext context) =>
                <PopupMenuEntry<CharacterCardOption>>[
                  const PopupMenuItem<CharacterCardOption>(
                    value: CharacterCardOption.edit,
                    child: Text("Edit"),
                  ),
                  const PopupMenuItem<CharacterCardOption>(
                    value: CharacterCardOption.delete,
                    child: Text("Delete"),
                  ),
                ]),
      ]),
      body: Column(children: [
        Padding(
          padding: EdgeInsets.fromLTRB(0, 25, 0, 25),
          child: Column(children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.0),
              child: Row(children: [
                Text("Str: "),
                Text(
                  "${this.widget._character.getTotalStr()}   ",
                  style: this.widget._character.getBaseStr() != this.widget._character.getTotalStr()
                      ? TextStyle(color: Colors.green)
                      : TextStyle(color: Colors.black),
                ),
                Text(
                  "${this.widget._character.getTotalStrMod()}",
                  style: this.widget._character.getStrMod() != this.widget._character.getTotalStrMod()
                      ? TextStyle(color: Colors.green)
                      : TextStyle(color: Colors.black),
                ),
              ]),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.0),
              child: Row(children: [
                Text("Dex: "),
                Text(
                  "${this.widget._character.getTotalDex()}   ",
                  style: this.widget._character.getBaseDex() != this.widget._character.getTotalDex()
                      ? TextStyle(color: Colors.green)
                      : TextStyle(color: Colors.black),
                ),
                Text(
                  "${this.widget._character.getTotalDexMod()}",
                  style: this.widget._character.getDexMod() != this.widget._character.getTotalDexMod()
                      ? TextStyle(color: Colors.green)
                      : TextStyle(color: Colors.black),
                ),
              ]),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.0),
              child: Row(children: [
                Text("Con: "),
                Text(
                  "${this.widget._character.getTotalCon()}   ",
                  style: this.widget._character.getBaseCon() != this.widget._character.getTotalCon()
                      ? TextStyle(color: Colors.green)
                      : TextStyle(color: Colors.black),
                ),
                Text(
                  "${this.widget._character.getTotalConMod()}",
                  style: this.widget._character.getConMod() != this.widget._character.getTotalConMod()
                      ? TextStyle(color: Colors.green)
                      : TextStyle(color: Colors.black),
                ),
              ]),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.0),
              child: Row(children: [
                Text("Int: "),
                Text(
                  "${this.widget._character.getTotalInt()}   ",
                  style: this.widget._character.getBaseInt() != this.widget._character.getTotalInt()
                      ? TextStyle(color: Colors.green)
                      : TextStyle(color: Colors.black),
                ),
                Text(
                  "${this.widget._character.getTotalIntMod()}",
                  style: this.widget._character.getIntMod() != this.widget._character.getTotalIntMod()
                      ? TextStyle(color: Colors.green)
                      : TextStyle(color: Colors.black),
                ),
              ]),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.0),
              child: Row(children: [
                Text("Wis: "),
                Text(
                  "${this.widget._character.getTotalWis()}   ",
                  style: this.widget._character.getBaseWis() != this.widget._character.getTotalWis()
                      ? TextStyle(color: Colors.green)
                      : TextStyle(color: Colors.black),
                ),
                Text(
                  "${this.widget._character.getTotalWisMod()}",
                  style: this.widget._character.getWisMod() != this.widget._character.getTotalWisMod()
                      ? TextStyle(color: Colors.green)
                      : TextStyle(color: Colors.black),
                ),
              ]),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.0),
              child: Row(children: [
                Text("Cha: "),
                Text(
                  "${this.widget._character.getTotalCha()}   ",
                  style: this.widget._character.getBaseCha() != this.widget._character.getTotalCha()
                      ? TextStyle(color: Colors.green)
                      : TextStyle(color: Colors.black),
                ),
                Text(
                  "${this.widget._character.getTotalChaMod()}",
                  style: this.widget._character.getChaMod() != this.widget._character.getTotalChaMod()
                      ? TextStyle(color: Colors.green)
                      : TextStyle(color: Colors.black),
                ),
              ]),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.0),
              child: Row(children: [
                Text("BAB: "),
                Text("${this.widget._character.getTotalAttackBonus()}",
                    style:
                        this.widget._character.getBAB() != this.widget._character.getTotalAttackBonus()
                            ? TextStyle(color: Colors.green)
                            : TextStyle(color: Colors.black)),
              ]),
            ),
          ]),
        ),
        Center(
          child: Row(children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.fromLTRB(16.0, 8.0, 8.0, 8.0),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BuffViewer(this.widget._character)),
                    );
                  },
                  child: Text("Buffs"),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.fromLTRB(8.0, 8.0, 16.0, 8.0),
                child: RaisedButton(
                  child: Text("Attacks"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AttackViewer(this.widget._character)),
                    );
                  },
                ),
              ),
            ),
          ]),
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
    );
  }
}
