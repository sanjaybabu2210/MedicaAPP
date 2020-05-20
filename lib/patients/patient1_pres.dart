import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:care_4u/constants.dart';

class P1Prescription extends StatefulWidget {
  static String id = 'patient1_pres';

  @override
  _P1PrescriptionState createState() => _P1PrescriptionState();
}

class _P1PrescriptionState extends State<P1Prescription> {
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
        title: Text('Daily Checkup'),
        backgroundColor: Color(0XFFFF033E),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
                stream: _firestore.collection('messages').snapshots(),
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
                    final messageText = message.data['text'];
                    final messageBubble = MessageBubble(messageText);
                    messageBubbles.add(messageBubble);
                  }
                  return Expanded(
                      child: ListView(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 20.0),
                          children: messageBubbles));
                }),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      messageTextController.clear();
                      _firestore
                          .collection('messages')
                          .add({'text': messageText});
                    },
                    child: Text(
                      'Post',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
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
