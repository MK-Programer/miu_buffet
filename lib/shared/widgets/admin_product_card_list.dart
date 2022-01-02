import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:miu_food_court/models/product.dart';
import 'package:miu_food_court/providers/product_provider.dart';
import 'package:miu_food_court/shared/variables/constants.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CardList extends StatefulWidget {
  Product data;
  int index;

  CardList(this.data, this.index);

  @override
  _CardListState createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  File? image;
  late String i;
  Future<File> saveImagePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');
    i = image.path;
    return File(imagePath).copy(image.path);
  }

  _openGallery(BuildContext context) async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) i = widget.data.picture;

    final imagePermanent = await saveImagePermanently(image!.path);
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

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 2,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: FileImage(
                  File(widget.data.picture),
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(
            width: 8.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${widget.data.name}',
                      style: TextStyle(
                        fontWeight: fontWeight,
                        fontSize: fontSize20,
                        color: black,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.edit_outlined,
                        color: red,
                      ),
                      onPressed: () {
                        widget.data.picture = Provider.of<ProductProviders>(
                                context,
                                listen: false)
                            .productPicture(widget.index);
                        widget.data.name = Provider.of<ProductProviders>(
                                context,
                                listen: false)
                            .productName(widget.index);
                        widget.data.price = Provider.of<ProductProviders>(
                                context,
                                listen: false)
                            .productPrice(widget.index);
                        i = widget.data.picture;
                        showBottomDialog(context);
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${widget.data.price}',
                      style: TextStyle(
                        fontSize: fontSize15,
                        color: black,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.delete_outlined,
                        color: red,
                      ),
                      onPressed: () {
                        Provider.of<ProductProviders>(context, listen: false)
                            .removeProducts(widget.index);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
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

  showBottomDialog(BuildContext context) {
    final _formkey = GlobalKey<FormState>();
    Widget editButton = ElevatedButton(
      child: Text(
        'Edit',
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
          Provider.of<ProductProviders>(context, listen: false).editProducts(
              widget.index, this.i, widget.data.name, widget.data.price);
          Navigator.of(context).pop();
        }
      },
    );

    // show bottom model sheet
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: ListView(
            children: [
              Form(
                key: _formkey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
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
                      initialValue: '${widget.data.name}',
                      decoration: textInputDecoration.copyWith(
                        hintText: 'Name',
                      ),
                      validator: (val) =>
                          val!.isEmpty ? 'Enter the product name' : null,
                      onChanged: (val) {
                        widget.data.name = val;
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      initialValue: '${widget.data.price}',
                      decoration: textInputDecoration.copyWith(
                        hintText: 'Price',
                      ),
                      validator: (val) =>
                          val!.isEmpty ? 'Enter the product price' : null,
                      onChanged: (val) {
                        widget.data.price = val;
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    editButton,
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
