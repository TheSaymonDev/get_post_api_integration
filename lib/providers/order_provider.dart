import 'package:flutter/cupertino.dart';
import 'package:log_in_ui/http_request/custom_http.dart';
import 'package:log_in_ui/model/orders_model.dart';

class OrderProvider with ChangeNotifier{
  List<OrdersModel> ordersList=[];
  getOrderData() async {
    ordersList=await Custom_http.fetchOrderData();
    notifyListeners();
  }
}