import 'package:care_4u/patient_list.dart';
import 'package:flutter/material.dart';
import 'components/reusable_card.dart';

class Ward extends StatelessWidget {
  static String id = 'first';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wards'),
        backgroundColor: Color(0XFFFF033E),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Reusablebutton(
              onTap: () {
                Navigator.pushNamed(context, Patients.id);
              },
              buttonTitle: 'Ward 1',
              colour: Color(0XFFFF033E),
            ),
          ),
          Expanded(
            child: Reusablebutton(
              onTap: () {
                Navigator.pushNamed(context, Patients.id);
              },
              buttonTitle: 'Ward 2',
              colour: Color(0XFFFF033E),
            ),
          ),
          Expanded(
            child: Reusablebutton(
              onTap: () {
                Navigator.pushNamed(context, Patients.id);
              },
              buttonTitle: 'Ward 3',
              colour: Color(0XFFFF033E),
            ),
          ),
          Expanded(
            child: Reusablebutton(
              onTap: () {
                Navigator.pushNamed(context, Patients.id);
              },
              buttonTitle: 'Ward 4',
              colour: Color(0XFFFF033E),
            ),
          ),
          Expanded(
            child: Reusablebutton(
              onTap: () {
                Navigator.pushNamed(context, Patients.id);
              },
              buttonTitle: 'Ward 5',
              colour: Color(0XFFFF033E),
            ),
          )
        ],
      ),
    );
  }
}
