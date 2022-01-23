import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:miu_food_court/providers/product_provider.dart';
import 'package:miu_food_court/shared/variables/constants.dart';
import 'package:miu_food_court/shared/widgets/admin_side_menu_bar.dart';
import 'package:miu_food_court/shared/widgets/admin_top_bar.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_storage/firebase_storage.dart';

// ignore: must_be_immutable
class AdminAddProduct extends StatefulWidget {
  AdminAddProduct({Key? key}) : super(key: key);
  String currentCategory = 'Hot Drinks';

  @override
  _AdminAddProductState createState() => _AdminAddProductState();
}

class _AdminAddProductState extends State<AdminAddProduct> {
  File? image;
  late String i;
  late String url;
  Future saveImagePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    print(name);
    final image = File('${directory.path}/$name');
    i = image.path;
    Reference storageReference =
        FirebaseStorage.instance.ref().child("Products Images/$name");
    final UploadTask uploadTask = storageReference.putFile(File(imagePath));
    final TaskSnapshot downloadUrl = (await uploadTask);
    url = await downloadUrl.ref.getDownloadURL();

    return File(imagePath).copy(image.path);
  }

  _openGallery(BuildContext context) async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imagePermanent = await saveImagePermanently(image.path);
    // final imageTemporary = File(image.path);
    setState(() {
      // this.image = imageTemporary;
      this.image = imagePermanent;
    });
    Navigator.of(context).pop();
  }

  _openCamera(BuildContext context) async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;
    final imagePermanent = await saveImagePermanently(image.path);
    // final imageTemporary = File(image.path);
    setState(() {
      // this.image = imageTemporary;
      this.image = imagePermanent;
    });
    Navigator.of(context).pop();
  }

  TextEditingController _name = TextEditingController();
  TextEditingController _price = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final _formkey = GlobalKey<FormState>();
    final List<String> categories = ['Hot Drinks', 'Soft Drinks', 'Snacks'];

    return Scaffold(
      drawer: AdminSideBar(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AdminTopBar('Add Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: ListView(
          children: [
            Form(
              key: _formkey,
              child: Column(
                children: [
                  this.image != null
                      ? ClipOval(
                          child: Image.file(
                            image!,
                            width: 150,
                            height: 150,
                            fit: BoxFit.fill,
                          ),
                        )
                      : CircleAvatar(
                          backgroundImage: AssetImage(
                            'assets/pictures/product.png',
                          ),
                          radius: 70.0,
                        ),
                  IconButton(
                    icon: const Icon(
                      Icons.add_a_photo_outlined,
                      size: iconSize,
                    ),
                    onPressed: () {
                      _showChoiceDialog(context);
                    },
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: _name,
                    decoration: textInputDecoration.copyWith(
                      hintText: 'Name',
                      prefixIcon: Icon(
                        Icons.add_box_outlined,
                        color: grey,
                      ),
                    ),
                    validator: (val) =>
                        val!.isEmpty ? 'Enter the product name' : null,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: _price,
                    decoration: textInputDecoration.copyWith(
                      hintText: 'Price',
                      prefixIcon: Icon(
                        Icons.money_outlined,
                        color: grey,
                      ),
                    ),
                    validator: (val) =>
                        val!.isEmpty ? 'Enter the product price' : null,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  DropdownButtonFormField<String>(
                    value: widget.currentCategory,
                    decoration: textInputDecoration,
                    items: categories.map((category) {
                      return DropdownMenuItem(
                        value: category,
                        child: Text('$category'),
                      );
                    }).toList(),
                    // if the onChanged callback is null or the list of items is null
                    // then the dropdown button will be disabled
                    onChanged: (val) =>
                        setState(() => widget.currentCategory = val as String),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
              child: Text(
                'Add',
                style: TextStyle(
                  color: white,
                  fontSize: fontSize15,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: red,
                minimumSize: Size.fromHeight(40),
              ),
              onPressed: () {
                if (_formkey.currentState!.validate()) {
                  Provider.of<ProductProviders>(context, listen: false)
                      .addProducts(this.url, _name.text, _price.text,
                          widget.currentCategory);
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showChoiceDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Make a choice'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                GestureDetector(
                  child: const Text('Gallery'),
                  onTap: () {
                    _openGallery(context);
                  },
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                ),
                GestureDetector(
                  child: const Text('Camera'),
                  onTap: () {
                    _openCamera(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
