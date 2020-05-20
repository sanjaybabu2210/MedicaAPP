import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:percent_indicator/percent_indicator.dart';

Color color = Color(0xFF1D1E33);

class P1Vitals extends StatefulWidget {
  static String id = 'patient_1vitals';

  @override
  _P1VitalsState createState() => _P1VitalsState();
}

class _P1VitalsState extends State<P1Vitals> {
  final _firestore = Firestore.instance;
  void messageStreams() async {
    await for (var snapshots
        in _firestore.collection('Sensor Data').snapshots()) {
      for (var message in snapshots.documents) {
        print(message.data);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stats'),
        backgroundColor: Color(0XFFFF033E),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.lightBlueAccent, Colors.white])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              StreamBuilder<QuerySnapshot>(
                  stream: _firestore.collection('Sensor Data').snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.lightBlueAccent,
                        ),
                      );
                    }
                    final messages = snapshot.data.documents;
                    List<MessageBubble> messageWidgets = [];
                    for (var message in messages) {
                      final ecgValue = message.data['ECG'];
                      final pulsevalue = message.data['Pulse'];
                      final temperature = message.data['Temperature'];
                      final messageWidget =
                          MessageBubble(ecgValue, pulsevalue, temperature);
                      messageWidgets.add(messageWidget);
                    }
                    return Expanded(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: messageWidgets));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble(this.ecg, this.pulse, this.temp);

  final int ecg;
  final int pulse;
  final int temp;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 50.0),
          child: CircularPercentIndicator(
            radius: 100.0,
            lineWidth: 15.0,
            percent: ecg / 200,
            center: Text(
              ecg.toStringAsFixed(0),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.black),
            ),
            footer: Text(
              'ECG',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            circularStrokeCap: CircularStrokeCap.round,
            backgroundColor: Colors.white,
            progressColor: Colors.purple,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(15.0),
          child: CircularPercentIndicator(
            radius: 100.0,
            lineWidth: 13.0,
            percent: pulse / 220,
            center: Text(
              pulse.toStringAsFixed(0) + ' bpm',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.black),
            ),
            footer: Text(
              'Pulse',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: Colors.blue,
            backgroundColor: Colors.white,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(15.0),
          child: CircularPercentIndicator(
            radius: 100.0,
            lineWidth: 15.0,
            percent: temp / 60,
            center: Text(
              temp.toStringAsFixed(0) + '°C',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.black),
            ),
            footer: Text(
              'Body Temperature',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: Colors.red,
            backgroundColor: Colors.white,
          ),
        )
      ],
    );
  }
}
