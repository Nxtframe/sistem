import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sistem/helpers/autoSign.dart';
import 'package:sistem/helpers/isRegisteredSP.dart';

class ConfirmationCode extends StatefulWidget {
  const ConfirmationCode(
      {super.key, required this.email, required this.password});
  final String email;
  final String password;
  @override
  State<ConfirmationCode> createState() => _ConfirmationCodeState();
}

class _ConfirmationCodeState extends State<ConfirmationCode> {
  late TextEditingController _activationCodeController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        TextFormField(
          controller: _activationCodeController,
          decoration: const InputDecoration(hintText: "Confirmation Code"),
        ),
        ElevatedButton(
            onPressed: () async {
              Amplify.Auth.confirmSignUp(
                      username: widget.email,
                      confirmationCode: _activationCodeController.text)
                  .then((value) async => {
                        await autoSignin(
                            email: widget.email, password: widget.password),
                        await isRegisteredSP(),
                      }); //(P1)Feels like digging into Props again, Riverpod next time
            },
            child: Text("Confirm")),
        ElevatedButton(
            onPressed: () {
              Amplify.Auth.resendSignUpCode(
                username: widget.email,
              );
            },
            child: Text("Resend"))
      ],
    ));
  }
}
