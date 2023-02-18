import 'package:flutter/material.dart';
import 'package:log_in_ui/bottom_nav_bar_screen/order_screen.dart';
import 'package:log_in_ui/colors/mycolors.dart';
import 'package:log_in_ui/model/product_model.dart';
import 'package:log_in_ui/screen/edit_product.dart';

class ShowModalBottomSheetPage extends StatefulWidget {
  ProductModel productModel;
  ShowModalBottomSheetPage(this.productModel);

  @override
  State<ShowModalBottomSheetPage> createState() =>
      _ShowModalBottomSheetPageState();
}

class _ShowModalBottomSheetPageState extends State<ShowModalBottomSheetPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      color: buttonClr,
      child: Column(
        children: [
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage('${widget.productModel.image}'),
                            fit: BoxFit.cover)),
                  )),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                      child: Container(
                          height: double.infinity,
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'ID: ${widget.productModel.id}',
                                style:
                                    myStyle(16, FontWeight.bold, scaffoldClr),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Name: ${widget.productModel.name}',
                                style:
                                    myStyle(16, FontWeight.bold, scaffoldClr),
                                maxLines: 5,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Available: ${widget.productModel.isAvailable}',
                                style:
                                    myStyle(16, FontWeight.bold, scaffoldClr),
                                maxLines: 5,
                              ),
                            ],
                          ))),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              EditProduct(productModel: widget.productModel)));
                    },
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      child: Card(
                        elevation: 10,
                        color: logoGreen,
                        child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Edit',
                              style: myStyle(16, FontWeight.bold, scaffoldClr),
                            )),
                      ),
                    ),
                  )),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailsPage(
                      //   documentId: widget.documentId,
                      //   title: widget.title,
                      //   des: widget.des,
                      //   videoLink: widget.videoLink,
                      //   img: widget.img,
                      // )));
                    },
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      child: Card(
                        color: logoGreen,
                        elevation: 10,
                        child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Delete',
                              style: myStyle(16, FontWeight.bold, scaffoldClr),
                            )),
                      ),
                    ),
                  )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
