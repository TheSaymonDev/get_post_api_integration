import 'package:flutter/material.dart';
import 'package:log_in_ui/bottom_nav_bar_screen/order_screen.dart';
import 'package:log_in_ui/colors/mycolors.dart';
import 'package:log_in_ui/http_request/custom_http.dart';
import 'package:log_in_ui/model/product_model.dart';
import 'package:log_in_ui/providers/product_provider.dart';
import 'package:log_in_ui/reusable/reusable.dart';
import 'package:log_in_ui/screen/add_product_screen.dart';
import 'package:log_in_ui/screen/show_modal_bottom_sheet_screen.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {

  showMBS(productModel) {
   return showModalBottomSheet(context: context, builder: (context)=>ShowModalBottomSheetPage(productModel));
  }

  @override
  void initState() {
    Provider.of<ProductProvider>(context, listen: false).getProductData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   final productList=Provider.of<ProductProvider>(context).productList;
    return Scaffold(
      backgroundColor: buttonClr,
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddProductScreen())).then((value) =>
            Provider.of<ProductProvider>(context, listen: false)
                .getProductData());
      }, child: Icon(Icons.add),),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView.separated(
            itemBuilder: (context, index) => GestureDetector(
              onTap: (){
               showMBS(productList[index]);
              },
              child: Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: secondaryColor),
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      '${imageUrl}${productList[index].image}'),
                                  fit: BoxFit.cover)),
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${productList[index].name}',
                                style:
                                myStyle(18, FontWeight.bold, scaffoldClr),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Available: ${productList[index].isAvailable}',
                                style: myStyle(
                                    14, FontWeight.bold, Colors.greenAccent),
                              )
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ),
            separatorBuilder: (context, index) => SizedBox(
              height: 15,
            ),
            itemCount: productList.length),
      ),
    );
  }
}
