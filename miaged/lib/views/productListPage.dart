import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:miaged/views/productDetails.dart';
import 'firebase_options.dart';
import 'productDetailsPopUp.dart';
import 'package:firebase_database/firebase_database.dart';

class ProductPage extends StatefulWidget {
  @override
  ProductPageState createState() => ProductPageState();
}


class ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(233, 196, 106, 1),
      body: ListView(
        children: <Widget>[
          ListTile(
              trailing: IconButton(
                icon: Icon(Icons.search_rounded),
                onPressed: getDetails,
              ),
              leading: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: 40,
                    minHeight: 40,
                    maxWidth: 40,
                    maxHeight: 40,
                  ),
                  child: Image.asset('1.jpg')),
              title: Text('Produit1 - Taille - Prix')),
          ListTile(
              trailing: IconButton(
                icon: Icon(Icons.search_rounded),
                onPressed: getDetails,
              ),
              leading: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: 40,
                    minHeight: 40,
                    maxWidth: 40,
                    maxHeight: 40,
                  ),
                  child: Image.asset('2.jpg')),
              title: Text('Produit1 - Taille - Prix')),
          ListTile(
              trailing: IconButton(
                icon: Icon(Icons.search_rounded),
                onPressed: getDetails,
              ),
              leading: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: 40,
                    minHeight: 40,
                    maxWidth: 40,
                    maxHeight: 40,
                  ),
                  child: Image.asset('1.jpg')),
              title: Text('Produit1 - Taille - Prix'))
        ],
      ),
    );
  }

  void getDetails() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProductDetailPopup(
                  productId: '1234',
                )));
  }
}
