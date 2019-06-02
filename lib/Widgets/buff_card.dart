import 'package:flutter/material.dart';

import '../Screens/buff_editor_screen.dart';
import '../Models/buff.dart';

enum BuffCardOption { delete }

class BuffCard extends StatelessWidget {
  final Buff _buff;
  final Function _deleteBuff;

  BuffCard(this._buff, this._deleteBuff);

  @override
  Widget build(BuildContext context) {

    return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BuffEditor(_buff)),
          );
        },
        child: Card(
          child: AppBar(
              leading:
                  Container(), // This empty container removes the back button on the AppBar
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(color: Colors.black),
              flexibleSpace: Padding(
                padding: EdgeInsets.fromLTRB(8.0, 8.0, 25.0, 8.0),
                child: Column(children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            '${_buff.name}',
                            textScaleFactor: 1.3,
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: Text("Attack Bonus: ${_buff.attackBonus}",
                              style: Theme.of(context).textTheme.body2)),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(children: [
                      Expanded(
                          flex: 1,
                          child: Text("Str: ${_buff.strStat}",
                              style: Theme.of(context).textTheme.body2)),
                      Expanded(
                          flex: 1,
                          child: Text("Dex: ${_buff.dexStat}",
                              style: Theme.of(context).textTheme.body2)),
                      Expanded(
                          flex: 1,
                          child: Text("Con: ${_buff.conStat}",
                              style: Theme.of(context).textTheme.body2)),
                      Expanded(
                          flex: 1,
                          child: Text("Int: ${_buff.intStat}",
                              style: Theme.of(context).textTheme.body2)),
                      Expanded(
                          flex: 1,
                          child: Text("Wis: ${_buff.wisStat}",
                              style: Theme.of(context).textTheme.body2)),
                      Expanded(
                          flex: 1,
                          child: Text("Cha: ${_buff.chaStat}",
                              style: Theme.of(context).textTheme.body2)),
                    ]),
                  ),
                ]),
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
        ));
  }
}
