import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oneclick/CustomAppBar.dart';
import 'package:oneclick/ItemList.dart';

import 'CustomShapeClipper.dart';

void main() => runApp(MaterialApp(
    title: "One Click",
    home: Home(),
    theme: appTheme,
    debugShowCheckedModeBanner: false));

Color firstColor = Color(0xFFF47D15);
Color secondColor = Color(0xFFEF772C);

ThemeData appTheme =
    ThemeData(primaryColor: Color(0xFFF3791A), fontFamily: 'Oxigen');

List<String> locations = ["Kakkanad", "Infopark", "Gothuruth"];

const TextStyle dropDownLabelStyle =
    TextStyle(color: Colors.white, fontSize: 16.0);
const TextStyle dropDownMenuStyle =
    TextStyle(color: Colors.black, fontSize: 16.0);

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavigationBar(), // CustomAppBar(),
      endDrawer: new Drawer(
        elevation: 20.0,
      ),

      /// to fix : bottom overflowed issue
      /// todo
      resizeToAvoidBottomPadding: false,
      body: Column(
        children: <Widget>[Search(), searchResults],
      ),
    );
  }
}

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  var selectedLocationIndex = 0;
  var searchQuery = "";
  var isVegetable = true;

  var _query = "";

  void onSearch(String query, {bool isForced = false}) {
    this._query = query;

    if (query.length > 7 || isForced) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SearchResult(query: this._query)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              height: 385.0,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [firstColor, secondColor])),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 45.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 16.0,
                        ),
                        PopupMenuButton(
                          onSelected: (index) {
                            setState(() {
                              selectedLocationIndex = index;
                            });
                          },
                          child: Row(children: <Widget>[
                            Text(locations[selectedLocationIndex],
                                style: dropDownLabelStyle),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
                            )
                          ]),
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuItem<int>>[
                                PopupMenuItem(
                                  child: Text(
                                    locations[0],
                                    style: dropDownMenuStyle,
                                  ),
                                  value: 0,
                                ),
                                PopupMenuItem(
                                  child: Text(
                                    locations[1],
                                    style: dropDownMenuStyle,
                                  ),
                                  value: 1,
                                ),
                                PopupMenuItem(
                                  child: Text(
                                    locations[2],
                                    style: dropDownMenuStyle,
                                  ),
                                  value: 2,
                                ),
                              ],
                        ),
                        Spacer(),
                        InkWell(
                          child: Icon(Icons.settings, color: Colors.white),
                          onTap: () {
                            Scaffold.of(context).openEndDrawer();
                          },
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Text(
                    //"What do you\nwant to buy today?",
                    "നിങ്ങൾ ഇന്ന് എന്താണ്\nവാങ്ങാൻ ഉദ്ദേശിക്കുന്നത്",
                    style: TextStyle(fontSize: 24.0, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.0),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      child: TextField(
                        onChanged: onSearch,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            letterSpacing: 1.0,
                            height: 1.55),
                        controller: TextEditingController(text: ""),
                        cursorColor: appTheme.primaryColor,
                        decoration: InputDecoration(
                          hintText: "Please enter what you want ?",
                          border: InputBorder.none,
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 10.0),
                          suffixIcon: Padding(
                            padding:
                                const EdgeInsetsDirectional.only(start: 0.0),
                            child: InkWell(
                              child: Icon(
                                Icons.search,
                                color: Colors.black,
                              ),
                              onTap: () {
                                // how to directly access textbox value here
                                // todo
                                // define controller outside and dispose it
                                // dispose controller inline vs outside ?
                                // define a varible outside and access search text.
                                onSearch(_query, isForced: true);
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      SizedBox(
                        width: 20.0,
                        height: 45.0,
                      ),
                      InkWell(
                        child: ChoiseChip(
                            Icons.favorite_border, "Vegetables", isVegetable),
                        onTap: () {
                          setState(() {
                            isVegetable = true;
                          });
                        },
                      ),
                      InkWell(
                        child: ChoiseChip(
                            Icons.filter_vintage, "Fruits    ", !isVegetable),
                        onTap: () {
                          setState(() {
                            isVegetable = false;
                          });
                        },
                      ),
                    ],
                  )
                ],
              ),
            ))
      ],
    );
  }
}

class ChoiseChip extends StatefulWidget {
  final IconData icon;
  final String text;
  final bool isSelected;

  ChoiseChip(this.icon, this.text, this.isSelected);

  @override
  _ChoiseChipState createState() => _ChoiseChipState();
}

class _ChoiseChipState extends State<ChoiseChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 2.0),
      decoration: widget.isSelected
          ? BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.all(Radius.circular(20.0)))
          : null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
            widget.icon,
            size: 20.0,
            color: Colors.white,
          ),
          SizedBox(
            width: 8.0,
          ),
          Text(
            widget.text,
            style: TextStyle(color: Colors.white, fontSize: 13.0),
          )
        ],
      ),
    );
  }
}

var viewAllStyle = TextStyle(fontSize: 14.0, color: appTheme.primaryColor);

var searchResults = Column(
  children: <Widget>[
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Most Popular Items",
            style: dropDownMenuStyle,
          ),
          Spacer(),
          Text(
            "VIEW ALL ",
            style: viewAllStyle,
          )
        ],
      ),
    ),
    Container(
      height: 246.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: itemCards,
      ),
    )
  ],
);

List<ItemCard> itemCards = [
  ItemCard("Apple", "100.0", "12", "20 Jan 2019",
      "https://images.pexels.com/photos/1300975/pexels-photo-1300975.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
  ItemCard("Apricots", "25.00", "40", "1 July 2019",
      "https://cdn.pixabay.com/photo/2017/07/20/18/40/apricots-2523272_960_720.jpg"),
  ItemCard("Raspberries", "320.00", "10", "11 Mar 2019",
      "https://cdn.pixabay.com/photo/2016/05/31/13/01/raspberries-1426859__340.jpg"),
  ItemCard("Other", "820.00", "16", "02 Jan 2019",
      "https://cdn.pixabay.com/photo/2010/12/13/10/05/background-2277_960_720.jpg"),
  ItemCard("Mixed", "140.00", "5", "31 Jan 2019",
      "https://cdn.pixabay.com/photo/2017/06/02/18/24/fruit-2367029_960_720.jpg"),
  ItemCard("Raspberries", "557.00", "3", "1 Feb 2019",
      "https://cdn.pixabay.com/photo/2016/10/22/20/34/wine-1761613_960_720.jpg"),
  ItemCard("Blueberries", "820.00", "2", "19 May 2019",
      "https://cdn.pixabay.com/photo/2017/04/29/09/51/blueberries-2270379_960_720.jpg"),
];

class ItemCard extends StatelessWidget {
  final String name, price, discount, expieryDate, imagePath;

  ItemCard(
      this.name, this.price, this.discount, this.expieryDate, this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
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
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 28.0,
              ),
              Text(
                "\u20B9 ${double.parse(price) - (double.parse(price) * double.parse(discount)) / 100} ",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0),
              ),
              SizedBox(width: 20),
              Text(
                "\u20B9 $price",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.lineThrough),
              )
            ],
          )
        ],
      ),
    );
  }
}
