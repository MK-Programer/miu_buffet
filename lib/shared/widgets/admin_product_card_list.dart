import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
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
  String? i;
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
                image: NetworkImage(
                  widget.data.picture,
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
                        this.url = widget.data.picture;
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
                      onPressed: () async {
                        await Provider.of<ProductProviders>(context,
                                listen: false)
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
    final List<String> categories = ['Hot Drinks', 'Soft Drinks', 'Snacks'];
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
      onPressed: () async {
        if (_formkey.currentState!.validate()) {
          await Provider.of<ProductProviders>(context, listen: false)
              .editProducts(
            widget.index,
            this.url,
            widget.data.name,
            widget.data.price,
            widget.data.category,
          );
          Navigator.of(context).pop();
        }
      },
    );
    late String name;
    late String price;
    late String category;
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
                        name = val;
                      },
                      onFieldSubmitted: (val) {
                        widget.data.name = name;
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
                        price = val;
                      },
                      onFieldSubmitted: (val) {
                        widget.data.price = price;
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    DropdownButtonFormField<String>(
                      value: widget.data.category,
                      decoration: textInputDecoration,
                      items: categories.map((category) {
                        return DropdownMenuItem(
                          value: category,
                          child: Text('$category'),
                        );
                      }).toList(),
                      // if the onChanged callback is null or the list of items is null
                      // then the dropdown button will be disabled
                      onChanged: (val) {
                        setState(() => category = val as String);
                      },
                      onSaved: (val) {
                        widget.data.category = category;
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
