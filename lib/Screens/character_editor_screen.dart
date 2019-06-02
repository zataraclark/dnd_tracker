import 'package:flutter/material.dart';

import '../Models/character.dart';

class CharacterEditor extends StatefulWidget {
  final Character _character;

  CharacterEditor(this._character);

  @override
  State<StatefulWidget> createState() {
    return CharacterEditorState();
  }
}

class CharacterEditorState extends State<CharacterEditor> {

  CharacterEditorState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Character"),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Center(
          child: Column(children: [
            Container(
              height: 60.0,
              width: 300.0,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "${this.widget._character.name}",
                  hintStyle: TextStyle(fontSize: 18.0),
                ),
                textCapitalization: TextCapitalization.words,
                onChanged: (text) {
                  this.widget._character.name = text;
                },
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      Row(children: [
                        Text("Str: ", style: Theme.of(context).textTheme.body2),
                        Container(
                          width: 40.0,
                          height: 40.0,
                          child: TextField(
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.body2,
                            maxLength: 2,
                            decoration: InputDecoration(
                              hintText: "${this.widget._character.getBaseStr()}",
                              counterText: "",
                            ),
                            keyboardType: TextInputType.number,
                            onChanged: (text) {
                              this.widget._character.setBaseStr(int.parse(text));
                            },
                          ),
                        ),
                      ]),
                      Row(children: [
                        Text("Dex: ", style: Theme.of(context).textTheme.body2),
                        Container(
                          width: 40.0,
                          height: 40.0,
                          child: TextField(
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.body2,
                            maxLength: 2,
                            decoration: InputDecoration(
                              hintText: "${this.widget._character.getBaseDex()}",
                              counterText: "",
                            ),
                            keyboardType: TextInputType.number,
                            onChanged: (text) {
                              this.widget._character.setBaseDex(int.parse(text));
                            },
                          ),
                        ),
                      ]),
                      Row(children: [
                        Text("Con: ", style: Theme.of(context).textTheme.body2),
                        Container(
                          width: 40.0,
                          height: 40.0,
                          child: TextField(
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.body2,
                            maxLength: 2,
                            decoration: InputDecoration(
                              hintText: "${this.widget._character.getBaseCon()}",
                              counterText: "",
                            ),
                            keyboardType: TextInputType.number,
                            onChanged: (text) {
                              this.widget._character.setBaseCon(int.parse(text));
                            },
                          ),
                        ),
                      ]),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(children: [
                    Row(children: [
                      Text("Int: ", style: Theme.of(context).textTheme.body2),
                      Container(
                        width: 40.0,
                        height: 40.0,
                        child: TextField(
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.body2,
                          maxLength: 2,
                          decoration: InputDecoration(
                            hintText: "${this.widget._character.getBaseInt()}",
                            counterText: "",
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: (text) {
                            this.widget._character.setBaseInt(int.parse(text));
                          },
                        ),
                      ),
                    ]),
                    Row(children: [
                      Text("Wis: ", style: Theme.of(context).textTheme.body2),
                      Container(
                        width: 40.0,
                        height: 40.0,
                        child: TextField(
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.body2,
                          maxLength: 2,
                          decoration: InputDecoration(
                            hintText: "${this.widget._character.getBaseWis()}",
                            counterText: "",
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: (text) {
                            this.widget._character.setBaseWis(int.parse(text));
                          },
                        ),
                      ),
                    ]),
                    Row(children: [
                      Text("Cha: ", style: Theme.of(context).textTheme.body2),
                      Container(
                        width: 40.0,
                        height: 40.0,
                        child: TextField(
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.body2,
                          maxLength: 2,
                          decoration: InputDecoration(
                            hintText: "${this.widget._character.getBaseCha()}",
                            counterText: "",
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: (text) {
                            this.widget._character.setBaseCha(int.parse(text));
                          },
                        ),
                      ),
                    ]),
                  ]),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(children: [
                Text("BAB: ", style: Theme.of(context).textTheme.body2),
                Container(
                  width: 40.0,
                  height: 40.0,
                  child: TextField(
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.body2,
                    maxLength: 2,
                    decoration: InputDecoration(
                      hintText: "${this.widget._character.getBAB()}",
                      counterText: "",
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (text) {
                      this.widget._character.setBAB(int.parse(text));
                    },
                  ),
                ),
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
        ),
      ),
    );
  }
}
