import 'package:flutter/material.dart';

import '../Models/character.dart';
import '../Screens/character_viewer_screen.dart';

class CharacterCard extends StatelessWidget {
  final Character _character;
  final Function _deleteCharacter;

  CharacterCard(this._character, this._deleteCharacter);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  CharacterViewer(_character, _deleteCharacter)),
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
                    '${_character.name}',
                    textScaleFactor: 1.3,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Text("Str: ${_character.getBaseStr()}"),
                    Text("Dex: ${_character.getBaseDex()}"),
                    Text("Con: ${_character.getBaseCon()}"),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Text("Int: ${_character.getBaseInt()}"),
                    Text("Wis: ${_character.getBaseWis()}"),
                    Text("Cha: ${_character.getBaseCha()}"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
