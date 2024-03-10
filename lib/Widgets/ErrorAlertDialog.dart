import 'package:flutter/material.dart';

import '../welcome screen/welcome_screen.dart';

class ErrorAlertDialog extends StatelessWidget {

  final String Message;
  const ErrorAlertDialog({required this.Message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      key: key,
      content: Text(Message),
      actions: [
        ElevatedButton(onPressed: (){
          Navigator.pushReplacement
            (context, MaterialPageRoute(
              builder: (context) => WelcomeScreen()));
        }, child: const
        Center(child: Text('OK'),))
      ],
    );
  }
}
