import 'package:flutter/material.dart';

import '../Models/character.dart';
import '../Screens/character_editor_screen.dart';
import '../Screens/buff_editor_screen.dart';
import '../Screens/attack_editor_screen.dart';
import '../Widgets/attack_card.dart';

enum CharacterCardOption { delete, edit }

class CharacterViewer extends StatefulWidget {
  final Character _character;
  final Function _deleteCharacter;
  CharacterViewer(this._character, this._deleteCharacter);

  @override
  State<StatefulWidget> createState() {
    return CharacterViewerState(_character, _deleteCharacter);
  }
}

class CharacterViewerState extends State<CharacterViewer> {
  final Character _character;
  final Function _deleteCharacter;
  CharacterViewerState(this._character, this._deleteCharacter);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${_character.name}"), actions: [
        PopupMenuButton<CharacterCardOption>(
            onSelected: (CharacterCardOption result) {
              if (result == CharacterCardOption.delete) {
                _deleteCharacter(_character);
              } else if (result == CharacterCardOption.edit) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CharacterEditor(_character)),
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
                  "${_character.getTotalStr()}   ",
                  style: _character.getBaseStr() != _character.getTotalStr()
                      ? TextStyle(color: Colors.green)
                      : TextStyle(color: Colors.black),
                ),
                Text(
                  "${_character.getTotalStrMod()}",
                  style: _character.getStrMod() != _character.getTotalStrMod()
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
                  "${_character.getTotalDex()}   ",
                  style: _character.getBaseDex() != _character.getTotalDex()
                      ? TextStyle(color: Colors.green)
                      : TextStyle(color: Colors.black),
                ),
                Text(
                  "${_character.getTotalDexMod()}",
                  style: _character.getDexMod() != _character.getTotalDexMod()
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
                  "${_character.getTotalCon()}   ",
                  style: _character.getBaseCon() != _character.getTotalCon()
                      ? TextStyle(color: Colors.green)
                      : TextStyle(color: Colors.black),
                ),
                Text(
                  "${_character.getTotalConMod()}",
                  style: _character.getConMod() != _character.getTotalConMod()
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
                  "${_character.getTotalInt()}   ",
                  style: _character.getBaseInt() != _character.getTotalInt()
                      ? TextStyle(color: Colors.green)
                      : TextStyle(color: Colors.black),
                ),
                Text(
                  "${_character.getTotalIntMod()}",
                  style: _character.getIntMod() != _character.getTotalIntMod()
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
                  "${_character.getTotalWis()}   ",
                  style: _character.getBaseWis() != _character.getTotalWis()
                      ? TextStyle(color: Colors.green)
                      : TextStyle(color: Colors.black),
                ),
                Text(
                  "${_character.getTotalWisMod()}",
                  style: _character.getWisMod() != _character.getTotalWisMod()
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
                  "${_character.getTotalCha()}   ",
                  style: _character.getBaseCha() != _character.getTotalCha()
                      ? TextStyle(color: Colors.green)
                      : TextStyle(color: Colors.black),
                ),
                Text(
                  "${_character.getTotalChaMod()}",
                  style: _character.getChaMod() != _character.getTotalChaMod()
                      ? TextStyle(color: Colors.green)
                      : TextStyle(color: Colors.black),
                ),
              ]),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.0),
              child: Row(children: [
                Text("BAB: ${_character.getBAB()}"),
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
                          builder: (context) => BuffEditor(_character)),
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
                          builder: (context) => AttackEditor(_character)),
                    );
                  },
                ),
              ),
            ),
          ]),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _character.attacks.length,
            itemBuilder: (BuildContext context, int index) {
              return AttackCard(_character.attacks[index], _character);
            },
          ),
        ),
      ]),
    );
  }
}
