import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:log_in_ui/model/category_model.dart';
import 'package:log_in_ui/model/orders_model.dart';
import 'package:log_in_ui/model/product_model.dart';
import 'package:log_in_ui/reusable/reusable.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Custom_http {
  static Future<Map<String, String>> getHeaderWithToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    var header = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    return header;
  }

  static Future<List<OrdersModel>> fetchOrderData() async {
    List<OrdersModel> getOrderList = [];
    OrdersModel ordersModel;
    var link = '${baseUrl}all/orders';
    var response =
        await http.get(Uri.parse(link), headers: await getHeaderWithToken());
    var data = jsonDecode(response.body);
    print('data===============================${data}saymon');
    for (var i in data) {
      ordersModel = OrdersModel.fromJson(i);
      getOrderList.add(ordersModel);
    }
    return getOrderList;
  }

  static Future<List<CategoryModel>> fetchCategoryData() async {
    List<CategoryModel> getCategoryList = [];
    CategoryModel categoryModel;
    var link = '${baseUrl}category';
    var response =
        await http.get(Uri.parse(link), headers: await getHeaderWithToken());
    var data = jsonDecode(response.body);
    print('data===============================${data}saymon');
    for (var i in data) {
      categoryModel = CategoryModel.fromJson(i);
      getCategoryList.add(categoryModel);
    }
    return getCategoryList;
  }

  static Future<List<ProductModel>> fetchProductData() async {
    List<ProductModel> getProductList = [];
    ProductModel productModel;
    var link = '${baseUrl}products';
    var response =
        await http.get(Uri.parse(link), headers: await getHeaderWithToken());
    var data = jsonDecode(response.body);
    print('data===============================${data}saymon');
    for (var i in data) {
      productModel = ProductModel.fromJson(i);
      getProductList.add(productModel);
    }
    return getProductList;
  }
}
