import 'package:flutter/material.dart';
import 'package:oneclick/CustomShapeClipper.dart';

import 'main.dart';

final Color discountBgColor = Color(0xFFFFE08D);
final Color itemBorderColor = Color(0xFFE6E6E6);
final Color choiceChipBgColor = Color(0xFFF6F6F6);

class SearchResult extends StatelessWidget {
  final String query;

  const SearchResult({Key key, this.query}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
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
        children: <Widget>[
          SearchResultHeader(query: query),
          SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: <Widget>[
                //SearchResultCard(),
              ],
            ),
          ),
          Container(
            height: 517.0,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: searchCard,
            ),
          )
        ],
      ),
    );
  }
}

class SearchResultHeader extends StatelessWidget {
  final String query;

  SearchResultHeader({Key key, this.query}) : super(key: key);

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
                          "$query", //"കനൽ ഒരു തരി മതി",
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

class SearchResultCard extends StatelessWidget {
  final String name, price, discount, expieryDate, imagePath;

  SearchResultCard(
      this.name, this.price, this.discount, this.expieryDate, this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            child: Tooltip(
              message: name.toUpperCase(),
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 210.0,
                    width: 160.0,
                    child: Image.network(
                      imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    left: 0.0,
                    bottom: 0.0,
                    width: 160.0,
                    height: 90.0,
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                            Colors.black,
                            Colors.black.withOpacity(0.02)
                          ])),
                    ),
                  ),
                  Positioned(
                    left: 10.0,
                    bottom: 10.0,
                    right: 10.0,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(name,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0)),
                            Text("$expieryDate",
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14.0)),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 6.0, vertical: 2.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.rectangle,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          child: Text(
                            "$discount %",
                            style:
                                TextStyle(color: Colors.black, fontSize: 14.0),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 220.0,
            width: 20.0,
          ),
          Column(
            children: <Widget>[
              Container(
                //color: Colors.grey,
                height: 100.0,
                width: 190.0,
                child:
                    Text("This is the description of the fruits, hureeeyeee"),
              ),
              SizedBox(
                height: 3.0,
              ),
              Container(
                //color: Colors.grey,
                height: 40.0,
                width: 190.0,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 28.0,
                    ),
                    Text(
                      "\u20B9 ${double.parse(price) - (double.parse(price) * double.parse(discount)) / 100} ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                    SizedBox(width: 20),
                    Text(
                      "\u20B9 $price",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.lineThrough),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 3.0,
              ),
              Container(
                color: Colors.grey,
                height: 45.0,
                width: 190.0,
                child: RaisedButton.icon(
                  onPressed: () {},
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  color: const Color(0xFFFFB822),
                  icon: Icon(Icons.add_shopping_cart),
                  label: Text(
                    "Add to Cart",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

List<SearchResultCard> searchCard = [
  SearchResultCard("Apple", "100.0", "12", "20 Jan 2019",
      "https://images.pexels.com/photos/1300975/pexels-photo-1300975.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
  SearchResultCard("Apricots", "25.00", "40", "1 July 2019",
      "https://cdn.pixabay.com/photo/2017/07/20/18/40/apricots-2523272_960_720.jpg"),
  SearchResultCard("Raspberries", "320.00", "10", "11 Mar 2019",
      "https://cdn.pixabay.com/photo/2016/05/31/13/01/raspberries-1426859__340.jpg"),
  SearchResultCard("Other", "820.00", "16", "02 Jan 2019",
      "https://cdn.pixabay.com/photo/2010/12/13/10/05/background-2277_960_720.jpg"),
  SearchResultCard("Mixed", "140.00", "5", "31 Jan 2019",
      "https://cdn.pixabay.com/photo/2017/06/02/18/24/fruit-2367029_960_720.jpg"),
  SearchResultCard("Raspberries", "557.00", "3", "1 Feb 2019",
      "https://cdn.pixabay.com/photo/2016/10/22/20/34/wine-1761613_960_720.jpg"),
  SearchResultCard("Blueberries", "820.00", "2", "19 May 2019",
      "https://cdn.pixabay.com/photo/2017/04/29/09/51/blueberries-2270379_960_720.jpg"),
];
