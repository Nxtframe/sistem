import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ConfirmationCode extends StatefulWidget {
  const ConfirmationCode({super.key});

  @override
  State<ConfirmationCode> createState() => _ConfirmationCodeState();
}

class _ConfirmationCodeState extends State<ConfirmationCode> {
  
  late final String email;

  late TextEditingController _activationCodeController; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        TextFormField(
          controller: _activationCodeController,
          decoration: const InputDecoration(hintText: "Confirmation Code"),
        ),
        ElevatedButton(onPressed: (){
           Amplify.Auth.confirmSignUp(
                  username: email,
                  confirmationCode: _activationCodeController.text);
        }, child: Text("Confirm"))
      ],)
    );
  }
}