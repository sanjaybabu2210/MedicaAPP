import 'package:care_4u/components/patient_card.dart';
import 'package:care_4u/patient_list.dart';
import 'package:care_4u/patients/patient1_chat.dart';
import 'package:care_4u/patients/patient1_pres.dart';
import 'package:care_4u/patients/patient1_saline.dart';
import 'package:care_4u/patients/patient_1vitals.dart';
import 'package:flutter/material.dart';
import 'package:care_4u/components/icon_content.dart';

class FirstWardOne extends StatelessWidget {
  static String id = 'patient_1';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFFFF033E),
        title: Text('Patient 1 Details'),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.lightBlueAccent, Colors.white])),
        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding:
                      EdgeInsets.only(left: 80, right: 80, top: 45, bottom: 15),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xFF1D1E33),
                        borderRadius: BorderRadius.circular(5)),
                    height: 45,
                    width: 70,
                    child: Center(
                      child: Text(
                        'Name: Mahath',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xFF1D1E33),
                          borderRadius: BorderRadius.circular(5)),
                      height: 45,
                      width: 90,
                      child: Center(
                        child: Text(
                          'Age: 18',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xFF1D1E33),
                          borderRadius: BorderRadius.circular(5)),
                      height: 45,
                      width: 90,
                      child: Center(
                        child: Text(
                          'Sex: Male',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 80, right: 80, top: 15, bottom: 15),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xFF1D1E33),
                        borderRadius: BorderRadius.circular(5)),
                    height: 45,
                    width: 70,
                    child: Center(
                      child: Text(
                        'Ward: 1',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: PatientCard(
                    colour: color,
                    onPress: () {
                      Navigator.pushNamed(context, P1Vitals.id);
                    },
                    cardChild: IconContent(
                      icon: Icons.favorite,
                      label: 'Vitals',
                      color: Colors.pink,
                    ),
                  ),
                ),
                Expanded(
                  child: PatientCard(
                    colour: color1,
                    onPress: () {
                      Navigator.pushNamed(context, P1Saline.id);
                    },
                    cardChild: IconContent(
                      icon: Icons.opacity,
                      label: 'Saline',
                      color: Color(0xFF32A895),
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: PatientCard(
                    colour: Color(0xFF1D1E33),
                    onPress: () {
                      Navigator.pushNamed(context, P1Prescription.id);
                    },
                    cardChild: IconContent(
                      icon: Icons.assignment,
                      label: 'Prescription',
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: PatientCard(
                    colour: Color(0xFF1D1E33),
                    onPress: () {
                      Navigator.pushNamed(context, P1Chats.id);
                    },
                    cardChild: IconContent(
                      icon: Icons.chat,
                      label: 'Chat',
                      color: Color(0xFF37B82A),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
