import 'package:care_4u/patients/patient_1vitals.dart';
import 'package:flutter/material.dart';
import 'first.dart';
import 'patient_list.dart';
import 'patients/patient_1.dart';
import 'patients/patient1_saline.dart';
import 'patients/patient1_pres.dart';
import 'landing_page.dart';
import 'auth/login_screen.dart';
import 'auth/reg_screen.dart';
import 'patients/patient1_chat.dart';

void main() => runApp(CareforU());

class CareforU extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LandingPage.id,
      routes: {
        Ward.id: (context) => Ward(),
        Patients.id: (context) => Patients(),
        FirstWardOne.id: (context) => FirstWardOne(),
        P1Vitals.id: (context) => P1Vitals(),
        P1Saline.id: (context) => P1Saline(),
        P1Prescription.id: (context) => P1Prescription(),
        LandingPage.id: (context) => LandingPage(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        P1Chats.id: (context) => P1Chats(),
      },
    );
  }
}
