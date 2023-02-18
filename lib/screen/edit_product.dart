import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:log_in_ui/colors/mycolors.dart';
import 'package:log_in_ui/http_request/custom_http.dart';
import 'package:log_in_ui/model/product_model.dart';
import 'package:log_in_ui/reusable/reusable.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class EditProduct extends StatefulWidget {
  ProductModel? productModel;
  EditProduct({Key? key, required this.productModel}) : super(key: key);

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  bool isLoading = false;
  TextEditingController? nameController;
  TextEditingController? orginalPriceController;
  TextEditingController? discountPriceController;
  TextEditingController? discountTypeController;
  TextEditingController? quantityController;
  @override
  void initState() {
    // TODO: implement initState
    nameController = TextEditingController(text: widget.productModel!.name);
    orginalPriceController = TextEditingController(
        text: widget.productModel!.price![0].originalPrice.toString());
    discountPriceController = TextEditingController(
        text: widget.productModel!.price![0].discountedPrice.toString());
    quantityController = TextEditingController(
        text: widget.productModel!.stockItems![0].quantity.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final weidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: isLoading == true,
        opacity: 0.5,
        blur: 0.5,
        child: Scaffold(
          body: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text("Choose Category"),
                    Stack(
                      //overflow: Overflow.visible,
                      children: [
                        Container(
                          height: 150,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.05),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: image == null
                              ? InkWell(
                                  onTap: () {
                                    // getImageformGallery();
                                  },
                                  child: Image.network(
                                      "${imageUrl}${widget.productModel!.image}"))
                              : Container(
                                  height: 150,
                                  width: 200,
                                  child: Image.file(image!),
                                ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: weidth * 0.4,
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
                      ],
                    ),
                    customTextField(nameController!,
                        Icons.production_quantity_limits, 'Enter Product Name'),
                    SizedBox(height: 20),
                    customTextField(orginalPriceController!,
                        Icons.price_change_outlined, 'Enter Product Price'),
                    SizedBox(height: 20),
                    customTextField(discountPriceController!,
                        Icons.discount_outlined, 'Enter Discount Price'),
                    SizedBox(height: 20),
                    customTextField(
                        quantityController!,
                        Icons.production_quantity_limits,
                        'Enter Quantity Price'),
                    SizedBox(
                      height: 20,
                    ),
                    customButton(Text('Update Product'), () {
                      updateProduct();
                    }, logoGreen, scaffoldClr)
                  ],
                ),
              )),
        ),
      ),
    );
  }

  updateProduct() async {
    try {
      if (mounted) {
        setState(() {
          isLoading = true;
        });
        String uriLink = "${baseUrl}product/${widget.productModel!.id}/update";
        var request = http.MultipartRequest("POST", Uri.parse(uriLink));
        request.headers.addAll(await Custom_http.getHeaderWithToken());
        request.fields["name"] = nameController!.text.toString();
        request.fields["category_id"] =
            widget.productModel!.foodItemCategory![0].id.toString();
        request.fields["quantity"] = quantityController!.text.toString();
        request.fields["original_price"] =
            orginalPriceController!.text.toString();
        request.fields["discounted_price"] =
            discountPriceController!.text.toString();
        request.fields["discount_type"] = "fixed";
        if (image != null) {
          var photo = await http.MultipartFile.fromPath("image", image!.path);
          request.files.add(photo);
        }
        var responce = await request.send();
        setState(() {
          isLoading = false;
        });
        var responceData = await responce.stream.toBytes();
        var responceString = String.fromCharCodes(responceData);
        print("responce bodyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy ${responceString}");
        print(
            "Status code issss${responce.statusCode} ${request.fields} ${request.files.toString()}");
        if (responce.statusCode == 200) {
          toastFunction("Product Updated Succesfully");
          Navigator.of(context).pop();
        } else {
          toastFunction("Something wrong, try again plz bro");
        }
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      toastFunction("Something wrong");
    }
  }

  File? image;
  final picker = ImagePicker();

  Future getImageformGallery() async {
    print('on the way of gallery');
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
