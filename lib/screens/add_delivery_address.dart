import 'package:flutter/material.dart';
import 'package:food_buds/providers/check_out_provider.dart';
import 'package:food_buds/screens/google_map.dart';
import 'package:food_buds/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class AddDeliveryAddress extends StatefulWidget {
  @override
  _AddDeliveryAddressState createState() => _AddDeliveryAddressState();
}

enum AddressType { Home, Work, Other }

class _AddDeliveryAddressState extends State<AddDeliveryAddress> {
  var myType = AddressType.Home;
  @override
  Widget build(BuildContext context) {
    CheckoutProvider checkoutProvider = Provider.of(context);
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
          child: checkoutProvider == false
              ? MaterialButton(
                  onPressed: () {
                    checkoutProvider.validator(context, myType);
                  },
                  child: Text(
                    "Add Address",
                    style: TextStyle(color: Colors.black),
                  ),
                  color: Colors.yellow,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                )),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            CustomTextField(
              labText: "First Name",
              controller: checkoutProvider.firstName,
            ),
            CustomTextField(
              labText: "Last Name",
              controller: checkoutProvider.lastName,
            ),
            CustomTextField(
              labText: "Mobile No.",
              controller: checkoutProvider.mobileNo,
            ),
            CustomTextField(
              labText: "Alternate Mobile No.",
              controller: checkoutProvider.altMobileNo,
            ),
            CustomTextField(
              labText: "Society",
              controller: checkoutProvider.society,
            ),
            CustomTextField(
              labText: "Street",
              controller: checkoutProvider.street,
            ),
            CustomTextField(
              labText: "Landmark",
              controller: checkoutProvider.landmark,
            ),
            CustomTextField(
              labText: "City",
              controller: checkoutProvider.city,
            ),
            CustomTextField(
              labText: "Area",
              controller: checkoutProvider.area,
            ),
            CustomTextField(
              labText: "Pincode",
              controller: checkoutProvider.pincode,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CustomGoogleMap()));
              },
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
