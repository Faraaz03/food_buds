import 'package:flutter/material.dart';
import 'package:food_buds/providers/user_provider.dart';
import 'package:food_buds/screens/my_profile.dart';
import 'package:food_buds/screens/review_cart.dart';
import 'package:food_buds/screens/wishlist.dart';

class DrawerSide extends StatefulWidget {
  UserProvider? userProvider;
  DrawerSide({this.userProvider});

  @override
  State<DrawerSide> createState() => _DrawerSideState();
}

class _DrawerSideState extends State<DrawerSide> {
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
    var userData = widget.userProvider?.currentUserData;

    return Drawer(
      child: Container(
        color: Color(0xffd1ad17),
        child: ListView(
          children: [
            DrawerHeader(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white54,
                      radius: 43,
                      child: CircleAvatar(
                        backgroundColor: Colors.red,
                        backgroundImage: NetworkImage(userData?.userImage ??
                            "https://previews.123rf.com/images/wectors/wectors1705/wectors170500066/78149699-men-face-vector-illustration-style-flat-front.jpg"),
                        radius: 40.0,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(userData!.userName.toString()),
                        Text(
                          userData!.userEmail.toString(),
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    )
                  ],
                ),
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
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MyProfile(
                            userProvider: widget.userProvider,
                          )));
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
                      MaterialPageRoute(builder: (context) => WishList()));
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
