import 'package:flutter/material.dart';
import 'package:food_buds/home/single_product.dart';
import 'package:food_buds/screens/product_overview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget listTile({required IconData icon, required String title}) {
    return ListTile(
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
    return Scaffold(
      backgroundColor: Color(0xffcbcbcb),
      drawer: Drawer(
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
              listTile(icon: Icons.home_outlined, title: "Home"),
              listTile(icon: Icons.shop_outlined, title: "Review Cart"),
              listTile(icon: Icons.person_outline, title: "My Profile"),
              listTile(
                  icon: Icons.notifications_outlined, title: "Notification"),
              listTile(icon: Icons.star_outline, title: "Rating & Review"),
              listTile(icon: Icons.favorite_outline, title: "Wishlist"),
              listTile(icon: Icons.copy_outlined, title: "Raise a complaint"),
              listTile(icon: Icons.format_quote_outlined, title: "FAQs"),
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
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Home",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          CircleAvatar(
            radius: 15,
            backgroundColor: Color(0xFFd4d181),
            child: Icon(
              Icons.search,
              size: 17,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: CircleAvatar(
              radius: 15,
              backgroundColor: Color(0xFFd4d181),
              child: Icon(
                Icons.shop,
                size: 17,
                color: Colors.black,
              ),
            ),
          )
        ],
        backgroundColor: Color(0xFFd6b738),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        child: ListView(
          children: [
            Container(
              height: 159,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://image.shutterstock.com/image-photo/burgers-hamburgers-cheeseburgers-on-black-260nw-542899306.jpg'),
                  ),
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(right: 120.0, bottom: 10.0),
                            child: Container(
                              height: 40.0,
                              width: 100.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFd1ad17),
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(50.0),
                                  bottomLeft: Radius.circular(50.0),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "FB",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white,
                                      shadows: [
                                        BoxShadow(
                                            color: Colors.red,
                                            blurRadius: 10.0,
                                            offset: Offset(3, 3))
                                      ]),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "30% Off",
                            style: TextStyle(
                                fontSize: 33.0,
                                color: Colors.red[400],
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              "On all food products",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Sizzling Burgers",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "View All",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SingleProdcut(onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductOverview(),
                      ),
                    );
                  }),
                  SingleProdcut(onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductOverview(),
                      ),
                    );
                  }),
                  SingleProdcut(onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductOverview(),
                      ),
                    );
                  }),
                  SingleProdcut(onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductOverview(),
                      ),
                    );
                  }),
                  SingleProdcut(onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductOverview(),
                      ),
                    );
                  })
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Italin Pizzas",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "View All",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SingleProdcut(onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductOverview(),
                      ),
                    );
                  }),
                  SingleProdcut(onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductOverview(),
                      ),
                    );
                  }),
                  SingleProdcut(onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductOverview(),
                      ),
                    );
                  }),
                  SingleProdcut(onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductOverview(),
                      ),
                    );
                  }),
                  SingleProdcut(onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductOverview(),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
