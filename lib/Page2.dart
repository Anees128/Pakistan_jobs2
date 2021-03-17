import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

final List<String> _listItem = [
  'images/pak1.png',
  'images/pak2.png',
  'images/pak3.png',
  'images/pak4.png',
  'images/pak5.png',
  'images/pak5.png',
  'images/pak5.png',
  'images/pak5.png',
  'images/pak5.png',
  'images/pak1.png',
  'images/pak5.png',
  'images/pak5.png',
  'images/pak5.png',
  'images/pak5.png',
  'images/pak1.png',
];

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: Container(
            height: height,
            width: width * 2,
            padding: EdgeInsets.all(2),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 40,
                    children: _listItem
                        .map(
                          (item) => Card(
                            child: Container(
                              decoration: BoxDecoration(
                                // color: Colors.transparent,
                                // borderRadius: BorderRadius.circular(9),
                                image: DecorationImage(
                                    image: AssetImage(item),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
