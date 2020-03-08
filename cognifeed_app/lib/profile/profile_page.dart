import 'package:cached_network_image/cached_network_image.dart';
import 'package:cognifeed_app/profile/bloc/profile_bloc.dart';
import 'package:cognifeed_app/profile/bloc/profile_event.dart';
import 'package:cognifeed_app/profile/bloc/profile_state.dart';
import 'package:cognifeed_app/profile/edit_profile.dart';
import 'package:cognifeed_app/widgets/application_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../constants/cognifeed_constants.dart';

class ProfilePage extends StatefulWidget {
  static final String route = "/profile";

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    BlocProvider.of<ProfileBloc>(context).add(GetProfileInfoEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ApplicationScaffold(
      backgroundColor: Colors.grey.shade300,
      child: BlocBuilder<ProfileBloc, ProfileState>(
          bloc: BlocProvider.of<ProfileBloc>(context),
          builder: (BuildContext context, ProfileState state) {
            if (state is ProfileFetchedState) {
              return SingleChildScrollView(
                child: Stack(
                  children: <Widget>[
                    SizedBox(
                      height: 250,
                      width: double.infinity,
                      child: CachedNetworkImage(
                        imageUrl: state.profileResponseModel.imageUrl ??
                            "https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(16.0, 200.0, 16.0, 16.0),
                      child: Column(
                        children: <Widget>[
                          Stack(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(
                                    left: 16.0, top: 16.0, right: 10),
                                margin: EdgeInsets.only(top: 16.0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5.0),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 3,
                                        spreadRadius: .03,
                                        color: Colors.black.withOpacity(.3),
                                      )
                                    ]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(left: 96.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            state.profileResponseModel.name,
                                            style: Theme.of(context)
                                                .textTheme
                                                .title,
                                          ),
                                          ListTile(
                                            contentPadding: EdgeInsets.all(0),
                                            title: Text(state
                                                    .profileResponseModel.bio ??
                                                "Add your bio"),
                                            subtitle: Text("Kathmandu"),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Hero(
                                tag: "ProfilePic",
                                child: Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      image: DecorationImage(
                                          image: CachedNetworkImageProvider(state
                                                  .profileResponseModel
                                                  .imageUrl ??
                                              "https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80"),
                                          fit: BoxFit.cover)),
                                  margin: EdgeInsets.only(left: 16.0),
                                ),
                              ),
                              Positioned(
                                right: 30,
                                top: 40,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (_) => EditProfile(
                                                  profileResponseModel: state
                                                      .profileResponseModel,
                                                )));
                                  },
                                  child: Column(
                                    children: <Widget>[
                                      Icon(
                                        Feather.edit_3,
                                        size: 18,
                                      ),
                                      Text("Edit Profile")
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 20.0),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5.0),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 3,
                                    spreadRadius: .03,
                                    color: Colors.black.withOpacity(.3),
                                  )
                                ]),
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                  title: Text(
                                    "User information",
                                    style: CognifeedTypography.articleTitle
                                        .copyWith(fontSize: 20),
                                  ),
                                ),
                                ListTile(
                                  title: Text("Email"),
                                  subtitle:
                                      Text(state.profileResponseModel.email),
                                  leading: Icon(
                                    FontAwesome.envelope_o,
                                    color: Colors.black,
                                  ),
                                ),
                                ListTile(
                                  title: Text("Phone"),
                                  subtitle:
                                      Text(state.profileResponseModel.phone),
                                  leading: Icon(
                                    Feather.phone,
                                    color: Colors.black,
                                  ),
                                ),
                                ListTile(
                                  title: Text("Website"),
                                  subtitle: Text(
                                      state.profileResponseModel.website ??
                                          "Add your website."),
                                  leading: Icon(
                                    Icons.web_asset,
                                    color: Colors.black,
                                  ),
                                ),
                                ListTile(
                                  title: Text("About"),
                                  subtitle: Text(
                                      state.profileResponseModel.about ??
                                          "Write about you."),
                                  leading: Icon(
                                    Feather.user_plus,
                                    color: Colors.black,
                                  ),
                                ),
                                ListTile(
                                  title: Text("Joined Date"),
                                  subtitle: Text(
                                      state.profileResponseModel.joinedDate),
                                  leading: Icon(
                                    Feather.calendar,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is ProfileErrorState) {
              return Container(
                child: Text(state.error),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
