import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:log_in_ui/bottom_nav_bar_screen/order_screen.dart';
import 'package:log_in_ui/http_request/custom_http.dart';
import 'package:log_in_ui/model/category_model.dart';
import 'package:log_in_ui/providers/category_provider.dart';
import 'package:log_in_ui/reusable/reusable.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../colors/mycolors.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  String? categoryType;
  TextEditingController nameController = TextEditingController();
  TextEditingController orginalPriceController = TextEditingController();
  TextEditingController discountPriceController = TextEditingController();
  TextEditingController discountTypeController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  @override
  void initState() {
    Provider.of<CategoryProvider>(context, listen: false).getCategoryData();
    super.initState();
  }

  bool isLoading = false;
  uploadProduct() async {
    if (mounted) {
      setState(() {
        isLoading = true;
      });
      String uriLink = "${baseUrl}product/store";
      var request = http.MultipartRequest("POST", Uri.parse(uriLink));
      request.headers.addAll(await Custom_http.getHeaderWithToken());
      request.fields["name"] = nameController.text.toString();
      request.fields["category_id"] = categoryType.toString();
      request.fields["quantity"] = quantityController.text.toString();
      request.fields["original_price"] = orginalPriceController.text.toString();
      request.fields["discounted_price"] =
          discountPriceController.text.toString();
      request.fields["discount_type"] = "fixed";
      var photo = await http.MultipartFile.fromPath("image", image!.path);
      request.files.add(photo);
      var responce = await request.send();
      setState(() {
        isLoading = false;
      });
      var responceData = await responce.stream.toBytes();
      var responceString = String.fromCharCodes(responceData);
      print("responce bodyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy ${responceString}");
      print(
          "Status code issss${responce.statusCode} ${request.fields} ${request.files.toString()}");
      if (responce.statusCode == 201) {
        toastFunction("Product Uploaded Succesfully");

        Navigator.of(context).pop();
      } else {
        toastFunction("Something wrong, try again plz bro");
      }
    }
  }

  List<CategoryModel> categoryList = [];
  @override
  Widget build(BuildContext context) {
    final categoryList = Provider.of<CategoryProvider>(context).categoryList;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: buttonClr,
      body: Container(
        alignment: Alignment.topCenter,
        margin: EdgeInsets.symmetric(horizontal: 30),
        width: double.infinity,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.teal,
                  border: Border.all(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(10.0)),
              height: 60,
              child: Center(
                child: DropdownButtonFormField<String>(
                  isExpanded: true,
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    size: 30,
                    color: textClr,
                  ),
                  decoration: InputDecoration.collapsed(hintText: ''),
                  value: categoryType,
                  hint: Text(
                    'Select Category',
                    style: myStyle(16, FontWeight.bold, textClr),
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      categoryType = newValue;
                      print("my Category is $categoryType");

                    });
                  },
                  validator: (value) =>
                  value == null ? 'field required' : null,
                  items: categoryList.map((item) {
                    return DropdownMenuItem(
                      child: Text(
                        "${item.name}",
                        style: myStyle(16, FontWeight.bold, textClr),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      value: item.id.toString(),
                    );
                  })?.toList() ??
                      [],
                ),
              ),
            ),
            SizedBox(height: 20),
            Stack(
              //overflow: Overflow.visible,
              children: [
                Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.05),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: image == null
                      ? InkWell(
                    onTap: () {
                      getImageformGallery();
                    },
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.image,
                            color: Colors.teal,
                            size: 40,
                          ),
                          Text(
                            "UPLOAD",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color:
                                Colors.teal.withOpacity(0.5)),
                          ),
                        ],
                      ),
                    ),
                  )
                      : Container(
                    height: 150,
                    width: double.infinity,
                    child: Image.file(image!, fit: BoxFit.cover,),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Positioned(
                    bottom: 0,
                    left:   0.4,
                    child: TextButton(
                      onPressed: () {
                        getImageformGallery();
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(50)),
                            color: Colors.black,
                            border: Border.all(
                                color: Colors.black, width: 1.5)),
                        child: Center(
                          child: Container(
                            height: 20,
                            width: 20,
                            child: Icon(Icons.edit),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            customTextField(nameController, Icons.production_quantity_limits, 'Enter Product Name'),
            SizedBox(height: 20),
            customTextField(orginalPriceController, Icons.price_change_outlined, 'Enter Product Price'),
            SizedBox(height: 20),
            customTextField(discountPriceController, Icons.discount_outlined, 'Enter Discount Price'),
            SizedBox(height: 20),
            customTextField(quantityController, Icons.production_quantity_limits, 'Enter Quantity Price'),
            SizedBox(height: 20),

            customButton(Text('Add Product'), () {
              uploadProduct();
            }, logoGreen, scaffoldClr)

          ],
        ),
      ),
    );
  }
  File? image;
  final picker = ImagePicker();

  Future getImageformGallery() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImage != null) {
        image = File(pickedImage.path);
        print('image found');
        print('${image!.path}');
      } else {
        print('no image found');
      }
    });
  }
}
