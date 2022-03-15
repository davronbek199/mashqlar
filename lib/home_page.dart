import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> myList = [
    Container(
        height: 120,
        color: Colors.amber,
        child: Text("1", style: TextStyle(fontSize: 92))),
    Container(
        height: 120,
        color: Colors.blueAccent,
        child: Text("2", style: TextStyle(fontSize: 82))),
    Container(
        height: 120,
        color: Colors.deepPurpleAccent,
        child: Text("3", style: TextStyle(fontSize: 82))),
    Container(
        height: 120,
        color: Colors.greenAccent,
        child: Text("4", style: TextStyle(fontSize: 82))),
    Container(
        height: 120,
        color: Colors.pinkAccent,
        child: Text("5", style: TextStyle(fontSize: 82))),
    Container(
        height: 120,
        color: Colors.limeAccent,
        child: Text("6", style: TextStyle(fontSize: 82))),
    Container(
        height: 120,
        color: Colors.grey,
        child: Text("7", style: TextStyle(fontSize: 82))),
    Container(
        height: 120,
        color: Colors.lightBlueAccent,
        child: Text("8", style: TextStyle(fontSize: 82))),
    Container(
        height: 120,
        color: Colors.red,
        child: Text("9", style: TextStyle(fontSize: 82))),
    Container(
        height: 120,
        color: Colors.green,
        child: Text("10", style: TextStyle(fontSize: 82))),
  ];

  final PageController pageController = PageController();

  // PageView
  int selectedPage = 0;
  List _gridDelegate = [];

  final _pages = [
    Text("First"),
    Text("Second"),
    Text("Third"),
    Text("Fourth"),
    Text("Fifth"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: appDrawer(),
      body: mySliver(),
    );
  }

  Widget myBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedPage,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.ice_skating), label: "ice skatting"),
        BottomNavigationBarItem(icon: Icon(Icons.image), label: "image"),
        BottomNavigationBarItem(icon: Icon(Icons.list), label: "list"),
        BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: "unit"),
        BottomNavigationBarItem(icon: Icon(Icons.pages), label: "pages"),
      ],
      onTap: (value) {
        setState(() {
          selectedPage = value;
        });
      },
    );
  }

  Widget appDrawer() {
    return Drawer(
      child: ListView(
        // padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(
                  Icons.image,
                  color: Colors.white,
                )
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(24),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.ac_unit),
            title: Text("Snow"),
            trailing: Icon(Icons.ac_unit),
          )
        ],
      ),
    );
  }

  Widget MyListViewBuilder() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: myList.length,
      itemBuilder: (BuildContext context, int index) {
        return myList[index];
      },
    );
  }

  Widget mySingleChildScrollView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(12),
            height: 120,
            color: Colors.red,
          ),
          Container(
            margin: EdgeInsets.all(12),
            height: 120,
            color: Colors.yellow,
          ),
          Container(
            margin: EdgeInsets.all(12),
            height: 120,
            color: Colors.green,
          ),
          Container(
            margin: EdgeInsets.all(12),
            height: 120,
            color: Colors.grey,
          ),
          Container(
            margin: EdgeInsets.all(12),
            height: 120,
            color: Colors.black,
          ),
          Container(
            margin: EdgeInsets.all(12),
            height: 120,
            color: Colors.purple,
          ),
        ],
      ),
    );
  }

  Widget myGridView() {
    return GridView.count(
      crossAxisCount: 2,
      children: [
        myList[0],
        myList[1],
        myList[2],
        myList[3],
        myList[4],
        myList[5],
        myList[6],
        myList[7],
        myList[8],
        myList[9],
      ],
    );
  }

  Widget myPageView() {
    return PageView(
      controller: pageController,
      children: [
        Container(
          color: Colors.green,
          child: Center(
            child: Text(
              "First",
              style: TextStyle(fontSize: 100),
            ),
          ),
        ),
        Container(
          color: Colors.limeAccent,
          child: Center(
            child: Text(
              "Second",
              style: TextStyle(fontSize: 100),
            ),
          ),
        ),
        Container(
          color: Colors.red,
          child: Center(
            child: Text("Third", style: TextStyle(fontSize: 100)),
          ),
        ),
      ],
    );
  }

  Widget mySliver() {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 220,
          flexibleSpace: FlexibleSpaceBar(
            title: Text("flex space"),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => ListTile(
              title: Text("something"),
            ),
            childCount: 20,
          ),
        ),
      ],
    );
  }

  Widget myNavigationRail() {
    return Row(
      children: [
        NavigationRail(
          labelType: NavigationRailLabelType.selected,
            onDestinationSelected: (index){
              setState(() {
                selectedPage = index;
              });
            },
            destinations: [
          NavigationRailDestination(
            icon: Icon(Icons.margin),
            label: Text(""),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.margin),
            label: Text(""),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.margin),
            label: Text(""),
          ),
        ], selectedIndex: selectedPage)
      ],
    );
  }
}
