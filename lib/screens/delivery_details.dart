import 'package:flutter/material.dart';
import 'package:food_buds/screens/add_delivery_address.dart';
import 'package:food_buds/screens/payment_summary.dart';
import 'package:food_buds/screens/single_delivery_item.dart';

class DeliveryDetails extends StatelessWidget {
  List<Widget> address = [
    SingleDeliveryItem(
      address: "Jhansi",
      title: "Faraaz",
      number: "+91-9329417837",
      addressType: "Home",
    )
  ];

  bool isAddress = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Delivery Details",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.yellow,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      bottomNavigationBar: Container(
        height: 48,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: MaterialButton(
          child: address.isEmpty
              ? Text("Add New Address")
              : Text("Payment Summary"),
          onPressed: () {
            address.isEmpty
                ? Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AddDeliveryAddress(),
                    ),
                  )
                : Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PaymentSummary(),
                    ),
                  );
          },
          color: Colors.yellow,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Deliver To"),
            leading: Image.asset(
              "assets/location.png",
              height: 30,
            ),
          ),
          Divider(
            height: 1,
          ),
          Column(
            children: [
              address.isEmpty
                  ? Container()
                  : SingleDeliveryItem(
                      address: "Jhansi",
                      title: "Faraaz",
                      number: "+91-9329417837",
                      addressType: "Home",
                    )
            ],
          )
        ],
      ),
    );
  }
}
