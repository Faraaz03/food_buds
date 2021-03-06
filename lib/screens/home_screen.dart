import 'package:flutter/material.dart';
import 'package:food_buds/home/single_product.dart';
import 'package:food_buds/providers/product_provider.dart';
import 'package:food_buds/providers/user_provider.dart';
import 'package:food_buds/screens/product_overview.dart';
import 'package:food_buds/screens/drawer_side.dart';
import 'package:food_buds/screens/review_cart.dart';
import 'package:food_buds/screens/search.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ProductProvider productProvider;

  @override
  void initState() {
    ProductProvider initproductProvider = Provider.of(context, listen: false);
    initproductProvider.fetchVegPizzaData();
    initproductProvider.fetchPizzaData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of(context);
    UserProvider userProvider = Provider.of(context);
    userProvider.getUserData();
    return Scaffold(
      backgroundColor: Colors.grey[200],
      drawer: DrawerSide(userProvider: userProvider),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Home",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          CircleAvatar(
            radius: 17,
            backgroundColor: Color(0xFFFF8080),
            child: IconButton(
              icon: Icon(
                Icons.search,
                size: 20,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => Search(
                            search: productProvider.getAllProductSearch,
                          )),
                );
              },
            ),
          ),
          SizedBox(
            width: 17,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ReviewCart(),
                  ),
                );
              },
              child: CircleAvatar(
                radius: 17,
                backgroundColor: Color(0xFFFF8080),
                child: Icon(
                  Icons.shop,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
        backgroundColor: Color(0xFFEB5353),
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
                    "Veg EXTRAVAGANZA Pizzas",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Search(
                                search: productProvider.getVegPizzaDataList,
                              )));
                    },
                    child: Text(
                      "View All",
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: productProvider.getVegPizzaDataList.map(
                  (vegPizzaData) {
                    return SingleProdcut(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ProductOverview(
                                productId: vegPizzaData.productId!,
                                productPrice: vegPizzaData.productPrice!,
                                productName: vegPizzaData.productName!,
                                productImage: vegPizzaData.productImage!,
                              ),
                            ),
                          );
                        },
                        productId: vegPizzaData.productId,
                        productName: vegPizzaData.productName,
                        productImage: vegPizzaData.productImage,
                        productPrice: vegPizzaData.productPrice,
                        productUnit: vegPizzaData);
                  },
                ).toList(),
                // children: [

                // ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Paneer Pizzas",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Search(
                                search: productProvider.getPizzaDataList,
                              )));
                    },
                    child: Text(
                      "View All",
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: productProvider.getPizzaDataList.map(
                  (pizzaData) {
                    return SingleProdcut(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ProductOverview(
                              productId: pizzaData.productId!,
                              productPrice: pizzaData.productPrice!,
                              productName: pizzaData.productName!,
                              productImage: pizzaData.productImage!,
                            ),
                          ),
                        );
                      },
                      productId: pizzaData.productId,
                      productName: pizzaData.productName,
                      productImage: pizzaData.productImage,
                      productPrice: pizzaData.productPrice,
                      productUnit: pizzaData,
                    );
                  },
                ).toList(),
                // children: [

                // ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Non-Veg Pizzas",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Search(
                                search: productProvider.getPizzaDataList,
                              )));
                    },
                    child: Text(
                      "View All",
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: productProvider.getPizzaDataList.map(
                  (pizzaData) {
                    return SingleProdcut(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ProductOverview(
                              productId: pizzaData.productId!,
                              productPrice: pizzaData.productPrice!,
                              productName: pizzaData.productName!,
                              productImage: pizzaData.productImage!,
                            ),
                          ),
                        );
                      },
                      productId: pizzaData.productId,
                      productName: pizzaData.productName,
                      productImage: pizzaData.productImage,
                      productPrice: pizzaData.productPrice,
                      productUnit: pizzaData,
                    );
                  },
                ).toList(),
                // children: [

                // ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
