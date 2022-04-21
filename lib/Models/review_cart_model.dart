class ReviewCartModel {
  String? cartId;
  String? cartImage;
  String? cartName;
  int? cartQuantity;
  int? cartPrice;
  var cartUnit;

  ReviewCartModel(
      {this.cartId,
      this.cartImage,
      this.cartName,
      this.cartPrice,
      this.cartQuantity,
      this.cartUnit});
}
