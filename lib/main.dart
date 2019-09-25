import 'package:flutter/material.dart';
import 'logic.dart';
import 'animatedGlitter.dart';
import 'data.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  Duration _duration = Duration(milliseconds: 500);

  @override
  void initState() {
    //generateData();
    suffle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Stack(
                  fit: StackFit.expand,
                  children: _buildGrid(),
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Expanded(
                        child: Image.asset(
                      "assets/main.jpg",
                    )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        RaisedButton(
                          child: Text("one move to win"),
                          onPressed: () {
                            generateData();
                            setState(() {});
                          },
                        ),
                        RaisedButton(
                          child: Text("suffle"),
                          onPressed: () {
                            suffle();
                            setState(() {});
                          },
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildGrid() {
    List<Widget> _grid = List(8);
    for (int i = 0; i < 8; i++) {
      _grid[i] = _slideItem(allData[i]);
    }
    return _grid;
  }

  _slideItem(Data data) {
    return Builder(builder: (context) {
      return AnimatedPositioned(
        duration: _duration,
        top: 100.0 * data.x - 100,
        left: 100.0 * data.y - 100,
        height: 100,
        width: 100,
        child: InkWell(
          onTap: () => _onTap(data, context),
          child: Container(
            alignment: Alignment.center,
            width: 100,
            height: 100,
            child: Image.asset(data.imagePath),
          ),
        ),
      );
    });
  }

  _youWin(context) async {
    this._overlayEntry = this._createOverlayEntry();
    Overlay.of(context).insert(this._overlayEntry);
    await Future.delayed(Duration(seconds: 5));
    this._overlayEntry.remove();
  }

  _onTap(Data data, context) {
    print("tapped");
    changePosition(data);
    bool isWon = checkIfWon();
    if (isWon) {
      _youWin(context);
    }

    setState(() {});
  }

  OverlayEntry _overlayEntry;

  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(builder: (context) => new AnimatedGlitter());
  }
}
