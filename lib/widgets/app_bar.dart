import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sistem/models/app_theme.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  AppBarWidget({super.key});

  AppTheme appTheme = AppTheme();

  @override
  Widget build(BuildContext context) {
    String userProfilePictureValue =
        "https://fastly.picsum.photos/id/1008/200/200.jpg?hmac=I0T_cpYR-61pUlB0jVB4I5B7tL0fvzN5MgslAOirM50";
        var alternateImage =
    "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcS_KHSomPJYHhzvhZGL8qO7WXZm053aU6MgS3i-DywZgW24DecF";

    return AppBar(
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Builder(
              builder: (context) {
                return IconButton(
                  icon: FaIcon(FontAwesomeIcons.bars),
                  onPressed: () => {Scaffold.of(context).openDrawer()},
                );
              }
            ),
          ),
          actions: <Widget>[
            InkWell(onTap: () => Scaffold.of(context).openEndDrawer(),
              child: Row(
                children: [
                  Row(
                    children: <Widget>[
                     
                      Padding(
                        padding: EdgeInsets.only(left: 0,right: 20),
                        child: Container(
                          padding: EdgeInsets.all(0),
                          height: 40,
                            decoration: BoxDecoration(
                                border: Border.all(width: 1, color: Colors.yellow),
                                borderRadius: BorderRadius.circular(20)
                                ),
                            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [ Padding(
                              padding: const EdgeInsets.all(0),
                              child: CircleAvatar(
                          radius: 20,
                        backgroundImage: userProfilePictureValue != null
                              ? NetworkImage(
                                  userProfilePictureValue,
                                )
                              : NetworkImage(
                                  alternateImage,
                                ),
                      ),
                            ),Text("Username",style: TextStyle(color: Colors.black),)]),
                      )
                  )],
                  )
                ],
              ),
            )
          ]);
     
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

