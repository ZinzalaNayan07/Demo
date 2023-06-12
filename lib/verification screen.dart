import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseotp/main.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class Verifysceen extends StatefulWidget {
  Verifysceen({Key? key}) : super(key: key);

  @override
  State<Verifysceen> createState() => _verifysceenState();
}

class _verifysceenState extends State<Verifysceen> {
  // work space
  var code = '';
  Homepage home = Homepage();

FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Pinput(
              onChanged: (value) {
                code = value;
              },
              length: 6,
              showCursor: true,
            ),
            ElevatedButton(
              onPressed: () async{
                PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: Homepage.verify, smsCode: code);
                await auth.signInWithCredential(credential);
              },
              child: Text('Verifycode'),
            )
          ],
        ),
      ),
    );
  }
}
