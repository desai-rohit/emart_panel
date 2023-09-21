class OrderModel {
  Order? order;
  String? orderBy;
  String? orderByAddress;
  String? orderByCity;
  String? orderByEmail;
  String? orderByName;
  String? orderByPhone;
  String? orderByPostalcode;
  String? orderBySate;
  bool? orderConfirmed;
  int? orderId;
  bool? orderOnDelivery;
  String? orderPayment;
  bool? orderPlace;
  String? shappingMethod;
  int? totalAmount;

  OrderModel(
      {this.order,
      this.orderBy,
      this.orderByAddress,
      this.orderByCity,
      this.orderByEmail,
      this.orderByName,
      this.orderByPhone,
      this.orderByPostalcode,
      this.orderBySate,
      this.orderConfirmed,
      this.orderId,
      this.orderOnDelivery,
      this.orderPayment,
      this.orderPlace,
      this.shappingMethod,
      this.totalAmount});

  OrderModel.fromJson(Map<String, dynamic> json) {
    order = json['order'] != null ? Order.fromJson(json['order']) : null;
    orderBy = json['order_by'];
    orderByAddress = json['order_by_address'];
    orderByCity = json['order_by_city'];
    orderByEmail = json['order_by_email'];
    orderByName = json['order_by_name'];
    orderByPhone = json['order_by_phone'];
    orderByPostalcode = json['order_by_postalcode'];
    orderBySate = json['order_by_sate'];
    orderConfirmed = json['order_confirmed'];
    orderId = json['order_id'];
    orderOnDelivery = json['order_on_delivery'];
    orderPayment = json['order_payment'];
    orderPlace = json['order_place'];
    shappingMethod = json['shapping_method'];
    totalAmount = json['total_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (order != null) {
      data['order'] = order!.toJson();
    }
    data['order_by'] = orderBy;
    data['order_by_address'] = orderByAddress;
    data['order_by_city'] = orderByCity;
    data['order_by_email'] = orderByEmail;
    data['order_by_name'] = orderByName;
    data['order_by_phone'] = orderByPhone;
    data['order_by_postalcode'] = orderByPostalcode;
    data['order_by_sate'] = orderBySate;
    data['order_confirmed'] = orderConfirmed;
    data['order_id'] = orderId;
    data['order_on_delivery'] = orderOnDelivery;
    data['order_payment'] = orderPayment;
    data['order_place'] = orderPlace;
    data['shapping_method'] = shappingMethod;
    data['total_amount'] = totalAmount;
    return data;
  }
}

class Order {
  int? color;
  String? img;
  int? qty;
  String? title;
  int? tprice;
  String? venderId;

  Order(
      {this.color, this.img, this.qty, this.title, this.tprice, this.venderId});

  Order.fromJson(Map<String, dynamic> json) {
    color = json['color'];
    img = json['img'];
    qty = json['qty'];
    title = json['title'];
    tprice = json['tprice'];
    venderId = json['vender_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['color'] = color;
    data['img'] = img;
    data['qty'] = qty;
    data['title'] = title;
    data['tprice'] = tprice;
    data['vender_id'] = venderId;
    return data;
  }
}
