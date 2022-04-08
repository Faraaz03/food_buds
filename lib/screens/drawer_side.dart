import 'package:flutter/material.dart';
import 'package:food_buds/screens/my_profile.dart';
import 'package:food_buds/screens/review_cart.dart';

class DrawerSide extends StatelessWidget {
  Widget listTile(
      {required IconData icon,
      required String title,
      required void Function() onTap}) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        size: 32,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.black54),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xffd1ad17),
        child: ListView(
          children: [
            DrawerHeader(
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white54,
                    radius: 43,
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 40.0,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Welcome Guest"),
                      SizedBox(
                        height: 7,
                      ),
                      Container(
                        height: 26.0,
                        child: OutlineButton(
                          onPressed: () {},
                          child: Text("Login"),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: BorderSide(width: 2)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            listTile(
                icon: Icons.home_outlined,
                title: "Home",
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MyProfile()));
                }),
            listTile(
                icon: Icons.shop_outlined,
                title: "Review Cart",
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ReviewCart()));
                }),
            listTile(
                icon: Icons.person_outline,
                title: "My Profile",
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MyProfile()));
                }),
            listTile(
                icon: Icons.notifications_outlined,
                title: "Notification",
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MyProfile()));
                }),
            listTile(
                icon: Icons.star_outline,
                title: "Rating & Review",
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MyProfile()));
                }),
            listTile(
                icon: Icons.favorite_outline,
                title: "Wishlist",
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MyProfile()));
                }),
            listTile(
                icon: Icons.copy_outlined,
                title: "Raise a complaint",
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MyProfile()));
                }),
            listTile(
                icon: Icons.format_quote_outlined,
                title: "FAQs",
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MyProfile()));
                }),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 350,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Contact Support",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text("Call Us:"),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "+917737039598",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text("Mail Us"),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "info@foodbuds.com",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
