import 'package:flutter/cupertino.dart';
import 'package:log_in_ui/http_request/custom_http.dart';
import 'package:log_in_ui/model/category_model.dart';

class CategoryProvider with ChangeNotifier{
  List<CategoryModel> categoryList=[];
  getCategoryData() async{
    categoryList=await Custom_http.fetchCategoryData();
    notifyListeners();
  }
}