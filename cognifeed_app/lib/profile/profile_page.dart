import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../constants/cognifeed_constants.dart';

class ProfilePage extends StatefulWidget {
  static final String route = "/profile";

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            SizedBox(
              height: 250,
              width: double.infinity,
              child: Image.network(
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
                        padding:
                            EdgeInsets.only(left: 16.0, top: 16.0, right: 10),
                        margin: EdgeInsets.only(top: 16.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 96.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Little Butterfly",
                                    style: Theme.of(context).textTheme.title,
                                  ),
                                  ListTile(
                                    contentPadding: EdgeInsets.all(0),
                                    title: Text("Product Designer"),
                                    subtitle: Text("Kathmandu"),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                                image: CachedNetworkImageProvider(
                                    "https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80"),
                                fit: BoxFit.cover)),
                        margin: EdgeInsets.only(left: 16.0),
                      ),
                      Positioned(
                        right: 30,
                        top: 40,
                        child: Column(
                          children: <Widget>[
                            Icon(
                              Feather.edit_3,
                              size: 25,
                            ),
                            SizedBox(height: 10),
                            Text("Edit Profile")
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
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
                          subtitle: Text("butterfly.little@gmail.com"),
                          leading: Icon(
                            FontAwesome.envelope_o,
                            color: Colors.black,
                          ),
                        ),
                        ListTile(
                          title: Text("Phone"),
                          subtitle: Text("+977-9815225566"),
                          leading: Icon(
                            Feather.phone,
                            color: Colors.black,
                          ),
                        ),
                        ListTile(
                          title: Text("Website"),
                          subtitle: Text("https://www.littlebutterfly.com"),
                          leading: Icon(
                            Icons.web_asset,
                            color: Colors.black,
                          ),
                        ),
                        ListTile(
                          title: Text("About"),
                          subtitle: Text(
                              "Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nulla, illo repellendus quas beatae reprehenderit nemo, debitis explicabo officiis sit aut obcaecati iusto porro? Exercitationem illum consequuntur magnam eveniet delectus ab."),
                          leading: Icon(
                            Feather.user_plus,
                            color: Colors.black,
                          ),
                        ),
                        ListTile(
                          title: Text("Joined Date"),
                          subtitle: Text("15 February 2019"),
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
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            )
          ],
        ),
      ),
    );
  }
}
