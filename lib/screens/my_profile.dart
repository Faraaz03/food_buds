import 'package:flutter/material.dart';
import 'package:food_buds/screens/drawer_side.dart';

class MyProfile extends StatelessWidget {
  Widget listTile({
    required IconData icon,
    required String title,
  }) {
    return Column(
      children: [
        Divider(
          height: 1,
        ),
        ListTile(
          leading: Icon(icon),
          title: Text(title),
          trailing: Icon(Icons.arrow_forward_ios),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFFd4d181),
      appBar: AppBar(
        backgroundColor: Color(0xFFd4d181),
        elevation: 0.0,
        title: Text(
          "My Profile",
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
      drawer: DrawerSide(),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 100,
                color: Color(0xFFd4d181),
              ),
              Container(
                height: 510,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0))),
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 250,
                          height: 80,
                          padding: EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Faraaz",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text("faraazmfs.2001@gmail.com")
                                ],
                              ),
                              CircleAvatar(
                                radius: 17,
                                backgroundColor: Colors.lightBlue[300],
                                child: CircleAvatar(
                                  radius: 14,
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.black,
                                  ),
                                  backgroundColor: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    listTile(icon: Icons.shop_outlined, title: "My Orders"),
                    listTile(
                        icon: Icons.location_on_outlined,
                        title: "My Delivery Address"),
                    listTile(
                        icon: Icons.person_outline, title: "Refer a Friend"),
                    listTile(
                        icon: Icons.file_copy_outlined,
                        title: "Terms & Conditions"),
                    listTile(
                        icon: Icons.privacy_tip_outlined,
                        title: "Privacy Policy"),
                    listTile(icon: Icons.add_chart, title: "About"),
                    listTile(
                        icon: Icons.exit_to_app_outlined, title: "Log Out"),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40.0, left: 30.0),
            child: CircleAvatar(
              radius: 50.0,
              backgroundColor: Color(0xFFd4d181),
              child: CircleAvatar(
                radius: 45,
                backgroundColor: Colors.red,
              ),
            ),
          )
        ],
      ),
    );
  }
}
