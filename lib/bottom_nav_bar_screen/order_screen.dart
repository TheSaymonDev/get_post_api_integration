import 'package:flutter/material.dart';
import 'package:log_in_ui/colors/mycolors.dart';
import 'package:log_in_ui/providers/order_provider.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  void initState() {
    Provider.of<OrderProvider>(context, listen: false).getOrderData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final orderList = Provider.of<OrderProvider>(context).ordersList;
    return Scaffold(
        backgroundColor: buttonClr,
        body: orderList.isNotEmpty
            ? Container(
                padding: EdgeInsets.all(10),
                child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                          height: 15,
                        ),
                    shrinkWrap: true,
                    itemCount: orderList.length,
                    itemBuilder: (context, index) {
                      String orderStatus =
                          '${orderList[index].orderStatus!.orderStatusCategory!.name}';
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: secondaryColor),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Container(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'ID NO: ${orderList[index].id}',
                                      style: myStyle(
                                          14, FontWeight.bold, scaffoldClr),
                                    ),
                                    Text('${orderList[index].user!.name}',
                                        style: myStyle(
                                            14, FontWeight.bold, scaffoldClr)),
                                  ],
                                ),
                              )),
                              Expanded(
                                  child: Container(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                        '${orderList[index].orderStatus!.orderStatusCategory!.name}',
                                        style: myStyle(
                                            14,
                                            FontWeight.bold,
                                            orderStatus == 'Ongoing'
                                                ? Colors.redAccent
                                                : orderStatus == 'Delivered'
                                                    ? Colors.lightGreenAccent
                                                    : Colors.yellowAccent)),
                                    Text('Price: ${orderList[index].price}',
                                        style: myStyle(
                                            14, FontWeight.bold, scaffoldClr))
                                  ],
                                ),
                              )),
                              Expanded(
                                  child: Container(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text('${orderList[index].quantity}',
                                        style: myStyle(
                                            14, FontWeight.bold, scaffoldClr))
                                  ],
                                ),
                              )),
                            ],
                          ),
                        ),
                      );
                    }),
              )
            : Center(child: CircularProgressIndicator()));
  }
}

myStyle(double size, FontWeight weight, Color clr) {
  return TextStyle(fontSize: size, fontWeight: weight, color: clr);
}
