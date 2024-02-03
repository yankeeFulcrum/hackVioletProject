import 'package:flutter/material.dart';

void main() {
  runApp(const TabBarDemo());
}


class TabBarDemo extends StatelessWidget {
  const TabBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home)),
                Tab(icon: Icon(Icons.apps)),
                Tab(icon: Icon(Icons.account_circle)),
              ],
            ),
            title: const Text('Tabs Demo'),
          ),
          body: const TabBarView(
            children: [
              Icon(Icons.home),
              Icon(Icons.apps),
              Icon(Icons.account_circle),
            ],
          ),
        ),
      ),
    );
  }
}
