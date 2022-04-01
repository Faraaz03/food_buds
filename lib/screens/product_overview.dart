import 'package:flutter/material.dart';

enum SigninCharacter { fill, outline }

class ProductOverview extends StatefulWidget {
  @override
  State<ProductOverview> createState() => _ProductOverviewState();
}

class _ProductOverviewState extends State<ProductOverview> {
  SigninCharacter _character = SigninCharacter.fill;

  Widget bottomNavigationBar(
      {required Color iconColor,
      required Color backgroundColor,
      required Color color,
      required String title,
      required IconData iconData}) {
    return Expanded(
        child: Container(
      padding: EdgeInsets.all(20),
      color: backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            color: Colors.black,
            size: 17,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            title,
            style: TextStyle(color: color),
          )
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        children: [
          bottomNavigationBar(
              iconColor: Colors.white70,
              backgroundColor: Colors.black,
              color: Colors.white70,
              title: "Add to Wishlist",
              iconData: Icons.favorite_outline),
          bottomNavigationBar(
              iconColor: Colors.grey,
              backgroundColor: Color(0xffd1ad17),
              color: Colors.black,
              title: "Go to Cart",
              iconData: Icons.shop_outlined)
        ],
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Product Overview",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  ListTile(
                    title: Text("Veg Burger"),
                    subtitle: Text("\$2"),
                  ),
                  Container(
                    height: 250,
                    padding: EdgeInsets.all(40),
                    child: Image.network(
                        "https://image.similarpng.com/very-thumbnail/2020/08/Burger-sandwatch-on-transparent-background-PNG.png"),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    child: Text(
                      "Available Options",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 3,
                              backgroundColor: Colors.green[700],
                            ),
                            Radio(
                              value: SigninCharacter.fill,
                              groupValue: _character,
                              activeColor: Colors.green[700],
                              onChanged: (SigninCharacter? value) {
                                setState(() {
                                  _character = value!;
                                });
                              },
                            )
                          ],
                        ),
                        Text("\$2"),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                size: 17,
                                color: Colors.black,
                              ),
                              Text(
                                "ADD",
                                style: TextStyle(color: Colors.black),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 0,
            child: Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About This Product",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "A hamburger is a food consisting of fillings —usually a patty of ground meat, typically beef—placed inside a sliced bun or bread roll.",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
