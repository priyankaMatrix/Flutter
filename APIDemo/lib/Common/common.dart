// import 'dart:ffi';
import 'package:flutter/material.dart';

showAlertDialog(BuildContext context,bool showContinue,String cancelText, String continueText,String alertTitle,String alertText) {

  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text(cancelText),
    onPressed:  () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = TextButton(
    child: Text(continueText),
    onPressed:  () {},
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(alertTitle),
    content: Text(alertText),
    actions: [
      cancelButton,
      continueButton,
    ],
  );
  if(showContinue == true)
  {
   alert = AlertDialog(
      title: Text(alertTitle),
      content: Text(alertText),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
  }



  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
