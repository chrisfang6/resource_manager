/*
 * Copyright 2019 chrisfang6
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *     http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:resource_manager/resource_manager.dart';
import 'package:resource_manager/resources.dart';
import 'style.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Example for Resource Manager'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Resources _exampleResources;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _fetchResources();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _buildContent(),
    );
  }

  Future _fetchResources() async {
    await initBaseResources(window.devicePixelRatio, 'res/values.json');
    _exampleResources ??= await getResources('res/example.json');
    // Update screen
    setState(() {});
  }

  Widget _buildContent() {
    if (_exampleResources == null) {
      return Center(
        child: Text(
          'Loading...',
          style: TextStyle(
            color: Color(0xffff0000),
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    } else {
      return ListView.builder(
        itemCount: 23,
        padding: EdgeInsets.all(
          getDimension("list_padding", fromResources: _exampleResources),
        ),
        itemBuilder: (context, position) {
          return _getItem(position);
        },
      );
    }
  }

  Widget _getItem(int position) {
    var fontSize = "H1";
    var fontWeight = "Regular";
    var fontColor = "Royal Blue";
    switch (position) {
      case 0:
        return _getColorTable();
      case 1:
        fontWeight = "Bold";
        return Padding(
          padding: EdgeInsets.only(
              top: getDimension("gap", fromResources: _exampleResources)),
          child: _getText(
              fontSize, fontWeight, fontColor, "H1 color", getH1BoldTextStyle),
        );
      case 2:
        fontWeight = "Medium";
        return _getText(
            fontSize, fontWeight, fontColor, "H1 color", getH1MediumTextStyle);
      case 3:
        fontWeight = "Light";
        return _getText(
            fontSize, fontWeight, fontColor, "H1 color", getH1LightTextStyle);
      case 4:
        return _getText(
            fontSize, fontWeight, fontColor, "H1 color", getH1RegularTextStyle);
      case 5:
        fontSize = "H2";
        return _getText(
            fontSize, fontWeight, fontColor, "H2 color", getH2RegularTextStyle);
      case 6:
        fontSize = "H3";
        return _getText(
            fontSize, fontWeight, fontColor, "H3 color", getH3RegularTextStyle);
      case 7:
        fontSize = "H4";
        return _getText(
            fontSize, fontWeight, fontColor, "H4 color", getH4RegularTextStyle);
      case 8:
        fontSize = "H5";
        return _getText(
            fontSize, fontWeight, fontColor, "H5 color", getH5RegularTextStyle);
      case 9:
        fontSize = "H6";
        return _getText(
            fontSize, fontWeight, fontColor, "H6 color", getH6RegularTextStyle);
      case 10:
        return Padding(
          padding: EdgeInsets.only(
              top: getDimension("gap", fromResources: _exampleResources)),
          child: Text("Original image LOGO from base resource",
              style: getH2MediumTextStyle(Color(getColor("image label color",
                  fromResources: _exampleResources)))),
        );
      case 11:
        return Image.asset(getDrawable("logo"));
      case 12:
        return Text("Override image LOGO from base resource",
            style: getH2MediumTextStyle(Color(getColor("image label color",
                fromResources: _exampleResources))));
      case 13:
        return Image.asset(
            getDrawable("logo", fromResources: _exampleResources));
      case 14:
        return Padding(
          padding: EdgeInsets.only(
              top: getDimension("gap", fromResources: _exampleResources)),
          child: Text(
              "integer 1 from base file is " +
                  getInteger("integer 1").toString() +
                  ", and from example file is " +
                  getInteger("integer 1", fromResources: _exampleResources)
                      .toString() +
                  " as it refers to the one in base file",
              style: getH4MediumTextStyle(Color(getColor("num label color",
                  fromResources: _exampleResources)))),
        );
      case 15:
        return Text(
            "integer 2 from base file is " +
                getInteger("integer 2").toString() +
                ", and from example file is " +
                getInteger("integer 2", fromResources: _exampleResources)
                    .toString(),
            style: getH4MediumTextStyle(Color(getColor("num label color",
                fromResources: _exampleResources))));
      case 16:
        return Text(
            "double 1 from base file is " +
                getDouble("double 1").toString() +
                ", and from exmaple file is " +
                getDouble("double 1", fromResources: _exampleResources)
                    .toString() +
                " as it refers to the one in base file",
            style: getH4MediumTextStyle(Color(getColor("num label color",
                fromResources: _exampleResources))));
      case 17:
        return Text(
            "double 2 from base file is " +
                getDouble("double 2").toString() +
                ", and from example file is " +
                getDouble("double 2", fromResources: _exampleResources)
                    .toString(),
            style: getH4MediumTextStyle(Color(getColor("num label color",
                fromResources: _exampleResources))));
      case 18:
        return Padding(
          padding: EdgeInsets.only(
              top: getDimension("gap", fromResources: _exampleResources)),
          child: Text(
              "Device Pixel Ratio is " + window.devicePixelRatio.toString(),
              style: getH2MediumTextStyle(Color(getColor("pixel label color",
                  fromResources: _exampleResources)))),
        );
      case 19:
        var fsize = getDimension("shown dp", fromResources: _exampleResources);
        return Text("50dp: shown dp is " + fsize.toString(),
            style: TextStyle(
                fontSize: fsize,
                color: Color(getColor("pixel label color",
                    fromResources: _exampleResources))));
      case 20:
        var fsize = getDimension("shown px", fromResources: _exampleResources);
        return Text("50px: shown dp is " + fsize.toString(),
            style: TextStyle(
                fontSize: fsize,
                color: Color(getColor("pixel label color",
                    fromResources: _exampleResources))));
      case 21:
        return Padding(
          padding: EdgeInsets.only(
              top: getDimension("gap", fromResources: _exampleResources)),
          child: Text("String 1 from base file is " + getString("string 1"),
              style: getH2MediumTextStyle(Color(getColor("string label color",
                  fromResources: _exampleResources)))),
        );
      case 22:
        return Text(
            "String 1 from example file is " +
                getString("string 1", fromResources: _exampleResources),
            style: getH2MediumTextStyle(Color(getColor("string label color",
                fromResources: _exampleResources))));
      default:
        return Text("unknown widget");
    }
  }

  Text _getText(String fontSize, String fontWeight, String fontColor,
      String color, TextStyle Function(Color color) getTextStyle) {
    return Text(
      _getDisplayText(fontSize, fontWeight, fontColor),
      style: getTextStyle(
          Color(getColor(color, fromResources: _exampleResources))),
    );
  }

  Widget _getColorTable() => Table(
        columnWidths: const <int, TableColumnWidth>{
          0: IntrinsicColumnWidth(),
          1: FlexColumnWidth(1.0)
        },
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          _getColorTableRow("FireBrick"),
          _getColorTableRow("DeepPink"),
          _getColorTableRow("Gold"),
          _getColorTableRow("OliveDrab"),
          _getColorTableRow("Lime"),
          _getColorTableRow("RoyalBlue"),
          _getColorTableRow("DarkOrchid"),
          _getColorTableRow("As FireBrick"),
        ],
      );

  TableRow _getColorTableRow(String colorName) => TableRow(children: [
        Text(
          colorName,
          style: getH3BoldTextStyle(
            Color(getColor("black")),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(
            getDimension("color_bar_padding", fromResources: _exampleResources),
          ),
          child: Container(
            height: getDimension("color_bar_height",
                fromResources: _exampleResources),
            color: Color(getColor(colorName, fromResources: _exampleResources)),
          ),
        )
      ]);

  String _getDisplayText(
          String fontSize, String fontWeight, String fontColor) =>
      "$fontSize $fontWeight " + "text with color" + " $fontColor";
}
