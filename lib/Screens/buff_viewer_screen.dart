import 'package:flutter/material.dart';

import './buff_editor_screen.dart';
import '../Models/character.dart';
import '../Models/buff.dart';
import '../Widgets/buff_card.dart';

enum ConfirmAction { DELETE, CANCEL }

enum BuffCardOption { clear_all }

class BuffViewer extends StatefulWidget {
  final Character _character;

  BuffViewer(this._character);
  @override
  State<StatefulWidget> createState() {
    return BuffViewerState(_character);
  }
}

class BuffViewerState extends State<BuffViewer> {
  final Character _character;

  BuffViewerState(this._character);

  void createBuff() {
    Buff newBuff = new Buff();
    _character.addBuff(newBuff);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BuffEditor(newBuff)),
    );
    setState(() {});
  }

  // void deleteCharacter(Character victim) async {
  //   final ConfirmAction choice = await _deleteCharacterDialog();
  //   if (choice == ConfirmAction.CANCEL) {
  //     return;
  //   } else if (choice == ConfirmAction.DELETE) {
  //     setState(() {
  //       _characters.remove(victim);
  //       Navigator.pop(context);
  //     });
  //   }
  // }

  // This is the old deleteBuff. I think I want to edit the one above
  void _deleteBuff(Buff victim) {
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
            RaisedButton(
                child: Text(
                  "New Buff",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.body2,
                ),
                onPressed: createBuff
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