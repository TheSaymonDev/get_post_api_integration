import 'package:flutter/material.dart';
import 'package:log_in_ui/bottom_nav_bar_screen/order_screen.dart';
import 'package:log_in_ui/colors/mycolors.dart';
import 'package:log_in_ui/http_request/custom_http.dart';
import 'package:log_in_ui/model/category_model.dart';
import 'package:log_in_ui/providers/category_provider.dart';
import 'package:log_in_ui/reusable/reusable.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  @override
  void initState() {
   Provider.of<CategoryProvider>(context, listen: false).getCategoryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   final categoryList=Provider.of<CategoryProvider>(context).categoryList;
    return Scaffold(
      backgroundColor: buttonClr,
      body: Container(
        padding: EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: categoryList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
          itemBuilder: (context, index) => Container(
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: secondaryColor),
            child: Column(
              children: [
                Expanded(
                    flex: 2,
                    child: Container(
                        padding: EdgeInsets.all(10),
                        height: double.infinity,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15)),
                            image: DecorationImage(
                                image: NetworkImage(
                                    '${imageUrl}${categoryList[index].image}'),
                                fit: BoxFit.cover)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 2, color: Colors.greenAccent),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          '${imageUrl}${categoryList[index].icon}'))),
                            ),
                          ],
                        ))),
                Expanded(
                    flex: 1,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'ID: ${categoryList[index].id}',
                            style:
                            myStyle(14, FontWeight.bold, scaffoldClr),
                          ),
                          Text(
                            'Category: ${categoryList[index].name}',
                            style:
                            myStyle(14, FontWeight.bold, scaffoldClr),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
