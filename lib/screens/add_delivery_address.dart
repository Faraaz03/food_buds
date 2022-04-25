import 'package:flutter/material.dart';
import 'package:food_buds/widgets/custom_text_field.dart';

class AddDeliveryAddress extends StatefulWidget {
  @override
  _AddDeliveryAddressState createState() => _AddDeliveryAddressState();
}

enum AddressType { Home, Work, Other }

class _AddDeliveryAddressState extends State<AddDeliveryAddress> {
  var myType = AddressType.Home;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text(
          "Add Delivery Address",
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        height: 48,
        child: MaterialButton(
          onPressed: () {},
          child: Text(
            "Add Address",
            style: TextStyle(color: Colors.black),
          ),
          color: Colors.yellow,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            CustomTextField(
              labText: "First Name",
            ),
            CustomTextField(
              labText: "Last Name",
            ),
            CustomTextField(
              labText: "Mobile No.",
            ),
            CustomTextField(
              labText: "Alternate Mobile No.",
            ),
            CustomTextField(
              labText: "Society",
            ),
            CustomTextField(
              labText: "Street",
            ),
            CustomTextField(
              labText: "Landmark",
            ),
            CustomTextField(
              labText: "City",
            ),
            CustomTextField(
              labText: "Area",
            ),
            CustomTextField(
              labText: "Pincode",
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: 47,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("Set Location")],
                ),
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              title: Text("Address Type"),
            ),
            RadioListTile(
              value: AddressType.Home,
              groupValue: myType,
              onChanged: (AddressType? value) {
                setState(() {
                  myType = value!;
                });
              },
              title: Text("Home"),
              secondary: Icon(
                Icons.home,
                color: Colors.yellow,
              ),
            ),
            RadioListTile(
              value: AddressType.Work,
              groupValue: myType,
              onChanged: (AddressType? value) {
                setState(() {
                  myType = value!;
                });
              },
              title: Text("Work"),
              secondary: Icon(
                Icons.work,
                color: Colors.yellow,
              ),
            ),
            RadioListTile(
              value: AddressType.Other,
              groupValue: myType,
              onChanged: (AddressType? value) {
                setState(() {
                  myType = value!;
                });
              },
              title: Text("Other"),
              secondary: Icon(
                Icons.home,
                color: Colors.yellow,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
