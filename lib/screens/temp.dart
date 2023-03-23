


//   @override
//   void dispose() {
//     _activationCodeController.dispose();
//     _phoneNumberController.dispose();
//     _passwordController.dispose();
//     _emailController.dispose();
//     super.dispose();
//   }

//   Future<void> signUpUser( String username, String password, String email ) async {

//   if (_formKey.currentState!.validate()) {
//     // (1)
//      Map<CognitoUserAttributeKey, String> userAttributes = {
//       CognitoUserAttributeKey.email: _emailController.text,
//       // 'phone_number': '+15559101234',
//       // additional attributes as needed
//     };
//      SignUpResult res = await Amplify.Auth.signUp(
//       username: _userController.text,
//       password: _passwordController.text,
//       options: CognitoSignUpOptions(
//         userAttributes: userAttributes
//       )
//     );
//     setState(() {
//       _isLoading = true;
//       _errorMessage = null;
//       isSignUpComplete = res.isSignUpComplete;
//     });
//    if (res.isSignUpComplete) {
//       debugPrint('Sign up is done.');
//     } else{
//       showDialog<void>(
//         context: context,
//         builder: (context) => AlertDialog(
//           title: const Text('Confirm the user'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const Text('Check your phone number and enter the code below'),
//               OutlinedAutomatedNextFocusableTextFormField(
//                 controller: _activationcodeController,
//                 padding: const EdgeInsets.only(top: 16),
//                 labelText: 'Activation Code',
//                 inputType: TextInputType.number,
//               ),
//             ],
//           )
//           )
//           );
//   }
// }
