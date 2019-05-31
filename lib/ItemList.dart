import 'package:flutter/material.dart';
import 'package:oneclick/CustomShapeClipper.dart';

import 'main.dart';

final Color discountBgColor = Color(0xFFFFE08D);
final Color itemBorderColor = Color(0xFFE6E6E6);
final Color choiceChipBgColor = Color(0xFFF6F6F6);

class ItemsListing extends StatelessWidget {
  const ItemsListing({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Results"),
        elevation: 0.5,
        centerTitle: true,
        leading: InkWell(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: <Widget>[ItemListHeader()],
      ),
    );
  }
}

class ItemListHeader extends StatelessWidget {
  const ItemListHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            height: 160.0,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [firstColor, secondColor])),
          ),
        ),
        Column(
          children: <Widget>[
            SizedBox(height: 20.0),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(14.0))),
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              elevation: 10.0,
              child: Container(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "കനൽ ഒരു തരി മതി",
                          style: TextStyle(fontSize: 18.0),
                        ),
                        Divider(
                          color: Colors.red,
                          height: 10.0,
                        ),
                        Text(
                          "Vegetables / Fruits",
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 30.0,
                    )
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
