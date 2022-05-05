import 'package:flutter/material.dart';
import 'package:food_buds/Models/delivery_address_model.dart';
import 'package:food_buds/providers/review_cart_provider.dart';
import 'package:food_buds/screens/single_delivery_item.dart';
import 'package:food_buds/widgets/order_item.dart';
import 'package:provider/provider.dart';

class PaymentSummary extends StatefulWidget {
  final DeliveryAddressModel? deliveryAddressList;
  PaymentSummary({this.deliveryAddressList});

  @override
  _PaymentSummaryState createState() => _PaymentSummaryState();
}

enum AddressType { COD, OnlinePayment }

class _PaymentSummaryState extends State<PaymentSummary> {
  var myType = AddressType.COD;

  @override
  Widget build(BuildContext context) {
    ReviewCartProvider reviewCartProvider = Provider.of(context);
    reviewCartProvider.getReviewCartData();

    double discount = 30;
    double? discountValue;
    double shippingCharges = 4;
    double? total;
    double totalPrice = reviewCartProvider.getTotalPrice();
    if (totalPrice > 300) {
      discountValue = (totalPrice * discount) / 100;
      total = totalPrice - discountValue;
    }

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
          "\$${total! + 5 ?? totalPrice}",
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
                  SingleDeliveryItem(
                    address:
                        "Area: ${widget.deliveryAddressList!.area}, Street: ${widget.deliveryAddressList!.street}, Society: ${widget.deliveryAddressList!.society}, Pincode: ${widget.deliveryAddressList!.pincode}",
                    title:
                        "${widget.deliveryAddressList!.firstName} ${widget.deliveryAddressList!.lastName}",
                    number: widget.deliveryAddressList!.mobileNo,
                    addressType: widget.deliveryAddressList!.addressType ==
                            "AddressType.Other"
                        ? "Other"
                        : widget.deliveryAddressList!.addressType ==
                                "AddressType.Home"
                            ? "Home"
                            : "Work",
                  ),
                  Divider(),
                  ExpansionTile(
                    children: reviewCartProvider.getReviewCartDataList.map((e) {
                      return OrderItem(
                        e: e,
                      );
                    }).toList(),
                    title: Text(
                        "Order Item ${reviewCartProvider.getReviewCartDataList.length}"),
                  ),
                  Divider(),
                  ListTile(
                    minVerticalPadding: 5,
                    leading: Text(
                      "Subtotal",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      "\$${totalPrice + 5}",
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
                      "\$5",
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
                      "\$$discountValue",
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
