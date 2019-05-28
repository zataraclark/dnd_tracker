import 'package:flutter/material.dart';

import './character.dart';
import './character_card.dart';
import './character_editor.dart';

enum ConfirmAction { DELETE, CANCEL }

class Manager extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _ManagerState();
  }
}

class _ManagerState extends State<Manager> {
  List<Character> _characters = [];

  Future<ConfirmAction> _deleteCharacterDialog() async {
    return showDialog<ConfirmAction>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Are You Sure You Want To Delete This Character?", style: TextStyle(fontStyle: FontStyle.normal,fontSize: 20.0)),
          content: Text("This cannot be undone!"),
          actions: <Widget>[
            FlatButton(
              child: Text("Delete"),
              onPressed: () {
                Navigator.of(context).pop(ConfirmAction.DELETE);
              },
            ),
            FlatButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop(ConfirmAction.CANCEL);
              },
            ),
          ],
        );
      },
    );
  }

  void createCharacter() {
    Character newCharacter = new Character();
    _characters.add(newCharacter);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CharacterEditor(newCharacter)),
    );
    setState(() {});
  }

  void deleteCharacter(Character victim) async {
    final ConfirmAction choice = await _deleteCharacterDialog();
    if (choice == ConfirmAction.CANCEL) {
      return;
    } else if (choice == ConfirmAction.DELETE) {
      setState(() {
        _characters.remove(victim);
        Navigator.pop(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: RaisedButton(
            onPressed: createCharacter,
            child: Text("Add"),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _characters.length,
            itemBuilder: (BuildContext context, int index) {
              return CharacterCard(_characters[index], deleteCharacter);
            },
          ),
        ),
      ],
    );
  }
}
