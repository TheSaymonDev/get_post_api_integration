import 'package:flutter/widgets.dart';
import 'package:log_in_ui/http_request/custom_http.dart';
import 'package:log_in_ui/model/product_model.dart';

class ProductProvider with ChangeNotifier{
  List<ProductModel> productList=[];
  getProductData() async{
    productList=await Custom_http.fetchProductData();
    notifyListeners();
  }
}