import 'package:flutter/material.dart';
import 'package:food_buds/widgets/order_item.dart';

class PaymentSummary extends StatefulWidget {
  @override
  _PaymentSummaryState createState() => _PaymentSummaryState();
}

enum AddressType { COD, OnlinePayment }

class _PaymentSummaryState extends State<PaymentSummary> {
  var myType = AddressType.COD;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Payment Summary",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.yellow,
      ),
      bottomNavigationBar: ListTile(
        title: Text("Total Amount"),
        subtitle: Text(
          "\$45",
          style: TextStyle(
              color: Colors.green[900],
              fontWeight: FontWeight.bold,
              fontSize: 17),
        ),
        trailing: Container(
          width: 160,
          child: MaterialButton(
              onPressed: () {},
              child: Text(
                "Place Order",
                style: TextStyle(color: Colors.black),
              ),
              color: Colors.yellow,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0))),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    title: Text("Md. Faraaz Siddiqui"),
                    subtitle: Text("Jhansi"),
                  ),
                  Divider(),
                  ExpansionTile(
                    children: [
                      OrderItem(),
                      OrderItem(),
                      OrderItem(),
                      OrderItem(),
                      OrderItem(),
                      OrderItem()
                    ],
                    title: Text("Order Item 6"),
                  ),
                  Divider(),
                  ListTile(
                    minVerticalPadding: 5,
                    leading: Text(
                      "Subtotal",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      "\$270",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListTile(
                    minVerticalPadding: 5,
                    leading: Text(
                      "Delivery Fee",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      "\$0",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListTile(
                    minVerticalPadding: 5,
                    leading: Text(
                      "Discount",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      "\$20",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    leading: Text("Payment Options"),
                  ),
                  RadioListTile(
                    value: AddressType.OnlinePayment,
                    groupValue: myType,
                    onChanged: (AddressType? value) {
                      setState(() {
                        myType = value!;
                      });
                    },
                    title: Text("Online Payment"),
                    secondary: Icon(
                      Icons.work,
                      color: Colors.yellow,
                    ),
                  ),
                  RadioListTile(
                    value: AddressType.COD,
                    groupValue: myType,
                    onChanged: (AddressType? value) {
                      setState(() {
                        myType = value!;
                      });
                    },
                    title: Text("COD"),
                    secondary: Icon(
                      Icons.home,
                      color: Colors.yellow,
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
