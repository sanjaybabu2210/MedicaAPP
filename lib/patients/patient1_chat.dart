import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class P1Chats extends StatefulWidget {
  static String id = 'patient1_chat';

  @override
  _P1ChatsState createState() => _P1ChatsState();
}

class _P1ChatsState extends State<P1Chats> {
  final messageTextController = TextEditingController();
  final _firestore = Firestore.instance;
  String messageText;

  void messageStreams() async {
    await for (var snapshots in _firestore.collection('messages').snapshots()) {
      for (var message in snapshots.documents) {
        print(message.data);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
//        actions: <Widget>[
//          IconButton(
//              icon: Icon(Icons.close),
//              onPressed: () {
//                messageStreams();
////                _auth.signOut();
////                Navigator.pop(context);
//              }),
//        ],
        title: Text('Chats'),
        backgroundColor: Color(0XFFFF033E),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
                stream: _firestore.collection('Voice').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Color(0XFFFF033E),
                      ),
                    );
                  }
                  final messages = snapshot.data.documents;
                  List<MessageBubble> messageBubbles = [];
                  for (var message in messages) {
                    final messageText = message.data['audiio'];
                    final messageBubble = MessageBubble(messageText);
                    messageBubbles.add(messageBubble);
                  }
                  return Expanded(
                      child: ListView(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 20.0),
                          children: messageBubbles));
                }),
          ],
        ),
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble(
    this.text,
  );

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Material(
          elevation: 5.0,
          color: Color(0XFFFF033E),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Text(
              '$text',
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
          )),
    );
  }
}
