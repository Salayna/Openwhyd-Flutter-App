import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:openwhyd_app/constants/dimension.dart';
import 'package:openwhyd_app/models/user_model.dart';
import 'package:openwhyd_app/data_providers/user_provider.dart';
import 'package:openwhyd_app/ui/profile_view/profile_playlist_component.dart';
import 'package:openwhyd_app/ui/profile_view/profile_social_component.dart';
class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  Future<User> user;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user = UserProvider().getprofile();
    print(user);
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: FutureBuilder<User>(
          future: user,
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              return Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: screenWidth(context),
                        child: Image.network("https://openwhyd.org"+snapshot.data?.cvrImg)
                    ),
                      Container(
                        width: 50,
                        height: 50,
                        alignment: Alignment.topRight,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: screenWidth(context, dividedBy: 4),
                    height: screenWidth(context,dividedBy: 4),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://openwhyd.org"+snapshot.data?.img
                          ),
                          fit: BoxFit.fill,
                        )
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    snapshot.data?.name,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                  Text(
                    snapshot.data?.loc,
                    style: TextStyle(
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    snapshot.data?.bio,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Social",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SocialComponent(),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Playlists",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ListView.builder(
                    itemCount: 5,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PlaylistComponent(
                          name: snapshot.data?.pl[index]?.name,
                          nbTracks: snapshot.data?.pl[index]?.nbTracks,
                          url: snapshot.data?.pl[index]?.url,
                        ),
                      );
                  }),
                  TextButton(
                      onPressed: () => {print("See More Clicked")},
                      child: Container(
                        width: 200,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.grey
                          ),
                          child: Center(
                            child: Text(
                              "See More",
                              style: TextStyle(
                                  color: Colors.white,
                                fontSize: 20
                              ),
                            ),
                          ),
                      ),
                  ),
                ],
              );
            }  else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return Center(child: CircularProgressIndicator());
          },
        )
    );
  }
}