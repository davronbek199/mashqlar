import 'package:flutter/material.dart';

class MyTabBar extends StatelessWidget {
  const MyTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
       body: TabBarView(
              children: [
                Text("Sport"),
                Text("Mahalliy"),
                Text("Dunyo"),
              ],
            ),
        appBar: AppBar(
          title: Text("Daryo"),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                child: Text("First"),
              ),
              Tab(
                child: Text("Second"),
              ),
              Tab(
                child: Text("Third"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
