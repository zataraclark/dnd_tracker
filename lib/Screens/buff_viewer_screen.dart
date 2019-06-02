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
    return BuffViewerState();
  }
}

class BuffViewerState extends State<BuffViewer> {

  BuffViewerState();

  void createBuff() {
    Buff newBuff = new Buff();
    this.widget._character.addBuff(newBuff);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BuffEditor(newBuff)),
    );
    setState(() {});
  }

  void _deleteBuff(Buff victim) {
    setState(() {
      this.widget._character.buffs.remove(victim);
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
                  this.widget._character.buffs.clear();
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
                ),
                onPressed: createBuff
                ),
            Expanded(
              child: ListView.builder(
                itemCount: this.widget._character.buffs.length,
                itemBuilder: (BuildContext context, int index) {
                  return BuffCard(this.widget._character.buffs[index], _deleteBuff);
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}