import 'package:flutter/material.dart';

import '../Models/stat_buff.dart';

enum BuffCardOption { delete }

class BuffCard extends StatelessWidget {
  final StatBuff _buff;
  final Function _deleteBuff;

  BuffCard(this._buff, this._deleteBuff);

  @override
  Widget build(BuildContext context) {
    String abilityString = "";
    switch (_buff.ability) {
      case Ability.str: {
        abilityString = "Str";
        break;
      }
      case Ability.dex: {
        abilityString = "Dex";
        break;
      }
      case Ability.con: {
        abilityString = "Con";
        break;
      }
      case Ability.intel: {
        abilityString = "Int";
        break;
      }
      case Ability.wis: {
        abilityString = "Wis";
        break;
      }
      case Ability.cha: {
        abilityString = "Cha";
        break;
      }
    }
    return Card(
      child: AppBar(
          // This empty container removes the back button on the AppBar
          leading: Container(),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          flexibleSpace: Padding(
            padding: EdgeInsets.fromLTRB(8.0, 8.0, 25.0, 8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      '${_buff.buffName}',
                      textScaleFactor: 1.3,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Text("$abilityString: ${_buff.buffStat}"),
                      Text("$abilityString: ${_buff.buffMod}"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          actions: [
            PopupMenuButton<BuffCardOption>(
                onSelected: (BuffCardOption result) {
                  if (result == BuffCardOption.delete) {
                    _deleteBuff(_buff);
                  }
                },
                itemBuilder: (BuildContext context) =>
                    <PopupMenuEntry<BuffCardOption>>[
                      const PopupMenuItem<BuffCardOption>(
                        value: BuffCardOption.delete,
                        child: Text("Delete"),
                      ),
                    ]),
          ]),
    );
  }
}
