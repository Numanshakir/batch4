import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int currentIndex = 0;
  List<Widget> screens = [
    Container(
      color: Colors.orange,
    ),
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.black,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              currentIndex = index;
              setState(() {});
              print(currentIndex);
            },
            currentIndex: currentIndex,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.abc), label: "ABC"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.access_alarm), label: "Alarm"),
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            ]),
        key: scaffoldKey,
        backgroundColor: Colors.amber,
        drawer: Drawer(),
        endDrawer: Drawer(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            tooltip: "Add",
            backgroundColor: Colors.green,
            onPressed: () {
              print("Klicked");
            }),
        appBar: AppBar(
            leading: InkWell(
                onTap: () {
                  print("Menu");
                  scaffoldKey.currentState!.openDrawer();
                },
                child: Icon(Icons.more)),
            title: Text("First Screen"),
            actions: [
              Icon(Icons.person),
              Icon(Icons.person),
              Icon(Icons.person),
            ]),
        body: screens[currentIndex]
        
        
        );
  }
}
