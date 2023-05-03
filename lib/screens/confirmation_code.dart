import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:sistem/helpers/auto_sign.dart';
import 'package:sistem/screens/info_input_screen.dart';

class ConfirmationCode extends StatefulWidget {
  const ConfirmationCode(
      {super.key, required this.email, required this.password});
  final String email;
  final String password;
  @override
  State<ConfirmationCode> createState() => _ConfirmationCodeState();
}

class _ConfirmationCodeState extends State<ConfirmationCode> {
  late final TextEditingController _activationCodeController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      reverse: true,
      child: Column(
        children: [
          const SizedBox(
            height: 500,
          ),
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
                          await autosignin(
                              email: widget.email, password: widget.password),
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => const InfoInput())))
                        }); //(P1)Feels like digging into Props again, Riverpod next time
              },
              child: const Text("Confirm")),
          ElevatedButton(
              onPressed: () {
                Amplify.Auth.resendSignUpCode(
                  username: widget.email,
                );
              },
              child: const Text("Resend"))
        ],
      ),
    ));
  }
}
