import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sistem/providers/profile_info.dart';
import 'package:sistem/theme/app_theme.dart';

// ignore: must_be_immutable
class AppBarWidget extends ConsumerWidget with PreferredSizeWidget {
  AppBarWidget({
    super.key,
  });

  AppTheme appTheme = AppTheme();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final infoUser = ref.watch(userInfo).value ?? 'user';
    final userId =
        ref.watch(userInfoId).value ?? 'assets/profile/defaultimage.jpg';

    return AppBar(
        elevation: 0,
        backgroundColor: Color(appTheme.backgroundColor),
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Builder(builder: (context) {
                return IconButton(
                  icon: const FaIcon(FontAwesomeIcons.bars),
                  onPressed: () => {Scaffold.of(context).openDrawer()},
                );
              }),
            ),
            Tab(
              icon: Image.asset("assets/images/image-removebg.png"),
            ),
          ],
        ),
        actions: <Widget>[
          InkWell(
            onTap: () => Scaffold.of(context).openEndDrawer(),
            child: Row(
              children: [
                Row(
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.only(left: 0, right: 20),
                        child: Container(
                          padding: const EdgeInsets.all(0),
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border:
                                  Border.all(width: 1, color: Colors.yellow),
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: FutureBuilder<GetUrlResult>(
                                    future: Amplify.Storage.getUrl(
                                        key:
                                            userId), // Replace "userId" with your AWS Amplify Storage key
                                    builder: (BuildContext context,
                                        AsyncSnapshot<GetUrlResult> snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return const CircleAvatar(
                                            backgroundImage: AssetImage(
                                                "assets/images/default.png"));
                                      }
                                      if (snapshot.hasData) {
                                        try {
                                          final imageUrl = snapshot.data!;
                                          return CircleAvatar(
                                            backgroundImage:
                                                NetworkImage(imageUrl.url),
                                            child: imageUrl.url.isEmpty
                                                ? const Icon(
                                                    Icons.account_circle,
                                                    size:
                                                        80) // Placeholder icon if imageUrl is empty
                                                : null,
                                          );
                                        } catch (e) {
                                          return const CircleAvatar(
                                              backgroundImage: AssetImage(
                                                  "assets/images/default.png"));
                                        }
                                      } else if (snapshot.hasError) {
                                        return const Icon(Icons.error);
                                      } else {
                                        return const Icon(Icons.access_time,
                                            size:
                                                80); // Placeholder icon if imageUrl is empty
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 100,
                                  child: Text(
                                    infoUser,
                                    style: const TextStyle(color: Colors.black),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                )
                              ]),
                        ))
                  ],
                )
              ],
            ),
          )
        ]);
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
