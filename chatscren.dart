//this screen is abt chat submitting

import 'package:chatapp/chat_message.dart';
import 'package:flutter/material.dart';

class ui extends StatefulWidget {
  const ui({super.key});

  @override
  State<ui> createState() => _uiState();
}

class _uiState extends State<ui> {

    final TextEditingController _textEditingController =
      new TextEditingController(); 
      final List<chatmessage>_message =<chatmessage>[];


  void onSubmitted(String text) {
    _textEditingController.clear();
    chatmessage message= new chatmessage(text: text,);
    setState(() {
      _message.insert(0, message);    
    });
  }
  
Widget  _textcomposerWidget(){
   return Scaffold(
    body: Expanded(
      child: Container(
        child: Container(
            // margin: const EdgeInsets.symmetric(horizontal: 8.0),
            child: new Row(
              children: <Widget>[
                new Flexible(
                  child: new TextField(
                    decoration:
                        new InputDecoration.collapsed(hintText: "Send a message"),
                    controller: _textEditingController,
                    onSubmitted: onSubmitted,
                  ),
                ),
                new Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: new IconButton(
                    icon: new Icon(Icons.send),
                    onPressed: () => onSubmitted(_textEditingController.text),
                  ),
                )
              ],
            ),
          ),
      ),
    ),
   ); 
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
          child: new Column(
            children: <Widget>[
              new Expanded(
                child: new ListView.builder(
                  padding: new EdgeInsets.all(8.0),
                  reverse: true,
                  itemBuilder: (_, int index) => _message[index],
                  itemCount: _message.length,
                ),
              ),
              new Divider(
                height: 1.0,
              ),
              new Container(
                decoration: new BoxDecoration(
                  color: Theme.of(context).cardColor,
                ),
                child: _textcomposerWidget(),
              ),
            ],
          ),
        
    );
    
  }
}