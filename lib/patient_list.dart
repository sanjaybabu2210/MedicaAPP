import 'package:care_4u/patients/patient_1.dart';
import 'package:flutter/material.dart';
import 'components/reusable_card.dart';

class Patients extends StatelessWidget {
  static String id = 'patient_list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Patients List'),
        backgroundColor: Color(0XFFFF033E),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.lightBlueAccent, Colors.white])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Reusablebutton(
              onTap: () {
                Navigator.pushNamed(context, FirstWardOne.id);
              },
              buttonTitle: 'Patient 1',
              colour: Color(0XFFFF033E),
            ),
            Reusablebutton(
              onTap: () {
                Navigator.pushNamed(context, Patients.id);
              },
              buttonTitle: 'Patient 2',
              colour: Color(0XFFFF033E),
            ),
            Reusablebutton(
              onTap: () {
                Navigator.pushNamed(context, Patients.id);
              },
              buttonTitle: 'Patient 3',
              colour: Color(0XFFFF033E),
            ),
            Reusablebutton(
              onTap: () {
                Navigator.pushNamed(context, Patients.id);
              },
              buttonTitle: '+ Add Patient',
              colour: Color(0XFFFF033E),
            ),
            Reusablebutton(
              onTap: () {
                Navigator.pushNamed(context, Patients.id);
              },
              buttonTitle: '+ Add Patient',
              colour: Color(0XFFFF033E),
            )
          ],
        ),
      ),
    );
  }
}
