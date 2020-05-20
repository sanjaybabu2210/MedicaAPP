import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:percent_indicator/percent_indicator.dart';

Color color1 = Color(0xFF1D1E33);
double value = 20;

void main() {
  runApp(const P1Saline());
}

class P1Saline extends StatelessWidget {
  const P1Saline();
  static String id = 'patient1_saline';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Saline Data',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage();

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 80,
          ),
          Padding(
            padding: EdgeInsets.only(top: 80.0, left: 55, bottom: 10),
            child: LinearPercentIndicator(
              width: 250.0,
              lineHeight: 50.0,
              percent: (document['Saline'].toDouble() / 15) > 1
                  ? 1
                  : document['Saline'].toDouble() / 15,
              center: Text(
                document['Saline'].toString() + '/15',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              backgroundColor: Colors.white,
              progressColor: Color(0xFFEB1555),
              linearStrokeCap: LinearStrokeCap.roundAll,
            ),
          ),
          Text(
            'Current Level',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.only(top: 30),
            child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  inactiveTrackColor: Color(0xFF8D8E98),
                  activeTrackColor: Colors.white,
                  thumbColor: Color(0xFFEB1555),
                  overlayColor: Color(0x29EB1555),
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                ),
                child: Slider(
                  value: value,
                  min: 10,
                  max: 50,
                  onChanged: (double newValue) {
                    value = newValue;
                  },
                )),
          ),
          Center(
              child: Text(
            'Control the Valve',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color(0xFFEB1555)),
          ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saline Data'),
        backgroundColor: Color(0XFFFF033E),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.lightBlueAccent, Colors.white])),
        child: StreamBuilder(
          stream: Firestore.instance.collection('Saline').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.lightBlueAccent,
                ),
              );
            }
            return ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) =>
                    _buildListItem(context, snapshot.data.documents[index]));
          },
        ),
      ),
    );
  }
}
