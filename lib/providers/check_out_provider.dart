import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_buds/Models/delivery_address_model.dart';
import 'package:food_buds/screens/add_delivery_address.dart';
import 'package:location/location.dart';

class CheckoutProvider with ChangeNotifier {
  bool isLoading = false;
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController mobileNo = TextEditingController();
  TextEditingController altMobileNo = TextEditingController();
  TextEditingController society = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController landmark = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController area = TextEditingController();
  TextEditingController pincode = TextEditingController();
  LocationData? setLocation;

  void validator(context, AddressType myType) async {
    if (firstName.text.isEmpty) {
      Fluttertoast.showToast(msg: "Field is null");
    } else if (lastName.text.isEmpty) {
      Fluttertoast.showToast(msg: "Field is null");
    } else if (mobileNo.text.isEmpty) {
      Fluttertoast.showToast(msg: "Field is null");
    } else if (altMobileNo.text.isEmpty) {
      Fluttertoast.showToast(msg: "Field is null");
    } else if (society.text.isEmpty) {
      Fluttertoast.showToast(msg: "Field is null");
    } else if (street.text.isEmpty) {
      Fluttertoast.showToast(msg: "Field is null");
    } else if (landmark.text.isEmpty) {
      Fluttertoast.showToast(msg: "Field is null");
    } else if (city.text.isEmpty) {
      Fluttertoast.showToast(msg: "Field is null");
    } else if (area.text.isEmpty) {
      Fluttertoast.showToast(msg: "Field is null");
    } else if (pincode.text.isEmpty) {
      Fluttertoast.showToast(msg: "Field is null");
    } else if (setLocation == null) {
      Fluttertoast.showToast(msg: "Set Location is empty");
    } else {
      isLoading = true;
      notifyListeners();
      await FirebaseFirestore.instance
          .collection("AddDeliveryAddress")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        "firstName": firstName.text,
        "lastName": lastName.text,
        "mobileNo": mobileNo.text,
        "altMobileNo": altMobileNo.text,
        "society": society.text,
        "street": street.text,
        "landmark": landmark.text,
        "city": city.text,
        "area": area.text,
        "pincode": pincode.text,
        "longitude": setLocation!.longitude,
        "latitude": setLocation!.latitude,
        "addressType": myType.toString()
      }).then((value) async {
        isLoading = false;
        notifyListeners();
        await Fluttertoast.showToast(msg: "Add Delivery Address");
        Navigator.of(context).pop();
        notifyListeners();
      });
      notifyListeners();
    }
  }

  List<DeliveryAddressModel> deliveryAddressList = [];
  getDeliveryAddressData() async {
    List<DeliveryAddressModel> newList = [];
    DeliveryAddressModel? deliveryAddressModel;
    DocumentSnapshot _db = await FirebaseFirestore.instance
        .collection("AddDeliveryAddress")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (_db.exists) {
      deliveryAddressModel = DeliveryAddressModel(
        firstName: _db.get("firstName"),
        lastName: _db.get("lastName"),
        mobileNo: _db.get("mobileNo"),
        altMobileNo: _db.get("altMobileNo"),
        street: _db.get("street"),
        area: _db.get("area"),
        society: _db.get("society"),
        landmark: _db.get("landmark"),
        city: _db.get("city"),
        pincode: _db.get("pincode"),
        addressType: _db.get("addressType"),
      );
      newList.add(deliveryAddressModel!);
      notifyListeners();
    }
    newList = deliveryAddressList;
    notifyListeners();
  }

  List<DeliveryAddressModel> get getDeliveryAddressList {
    return deliveryAddressList;
  }
}
