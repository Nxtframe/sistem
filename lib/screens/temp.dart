// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           title: IconButton(
//             icon: FaIcon(FontAwesomeIcons.bars),
//             onPressed: () => {print("test")},
//           ),
          
//           toolbarOpacity: 1,
//           elevation: 0,
//           // shape: const RoundedRectangleBorder(
//           //     borderRadius: BorderRadius.only(
//           //         bottomLeft: Radius.circular(40),
//           //         bottomRight: Radius.circular(40))),
//           actions: <Widget>[
//             SizedBox(
//               height: 100,
//               width: 100,
//               child: DecoratedBox(
                
//                 decoration: BoxDecoration(
//                     border: Border.all(width: 0.5),
//                     borderRadius: const BorderRadius.horizontal(
//                         left: Radius.circular(50), right: Radius.circular(50))),
//                 child: SizedBox(
//                   height: 10,
//                   child: Row(children: [
//                     IconButton(
//                         onPressed: (() => {print("LAALAL")}),
//                         icon: const FaIcon(FontAwesomeIcons.solidUser)),
//                         Text("test")
//                   ]),
//                 ),
//               ),
//             )
//           ]),
//           extendBodyBehindAppBar: true,
//       body: Container(
//         child: Row(
//           children: [],
//         ),
//       ),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// var alternateImage =
//     "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcS_KHSomPJYHhzvhZGL8qO7WXZm053aU6MgS3i-DywZgW24DecF";

// class _HomePageState extends State<HomePage> {
//   AppTheme appTheme = AppTheme();

//   @override
//   Widget build(BuildContext context) {
//     String userProfilePictureValue =
//         "https://fastly.picsum.photos/id/1008/200/200.jpg?hmac=I0T_cpYR-61pUlB0jVB4I5B7tL0fvzN5MgslAOirM50";
//     return Scaffold(
//       backgroundColor: Color(appTheme.backgroundColor),
//       appBar: AppBar(
//           title: IconButton(
//             icon: FaIcon(FontAwesomeIcons.bars),
//             onPressed: () => {print("test")},
//           ),
//           actions: <Widget>[
//             Row(
//               children: [
//                 Container(
//                   child: Row(
//                     children: <Widget>[
//                       CircleAvatar(
//                         radius: 20,
//                         backgroundImage: userProfilePictureValue != null
//                             ? NetworkImage(
//                                 userProfilePictureValue,
//                               )
//                             : NetworkImage(
//                                 alternateImage,
//                               ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(left: 0,),
//                         child: Container(
//                             decoration: const BoxDecoration(
//                                 border: Border(
//                                     right: BorderSide(width: 1),
//                                     // top: BorderSide(width: 1),
//                                     // bottom: BorderSide(width: 1)
//                                     ),
//                                 borderRadius: BorderRadius.horizontal(
//                                     left: Radius.circular(2))),
//                             child: Text("Fersdwadawdawwadwa")),
//                       )
//                     ],
//                   ),
//                 )
//               ],
//             )
//           ]),
//       body: Container(
//         child: Row(
//           children: [
//             CircleAvatar(
//               backgroundColor: Color.fromARGB(255, 253, 8, 8),
//               radius: 115,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
