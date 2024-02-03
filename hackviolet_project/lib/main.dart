import 'package:flutter/material.dart';

void main() {
  runApp(const TabBarDemo());
}

class TabBarDemo extends StatefulWidget {
  const TabBarDemo({super.key});

  @override
  _TabBarDemoState createState() => _TabBarDemoState();
}

class _TabBarDemoState extends State<TabBarDemo> {
  int _selectedIndex = 0;

  // This list holds the widget for each tab.
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Tab: Something',
      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
    ),
    Text(
      'Tab: Feed',
      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
    ),
    Text(
      'Tab: Profile',
      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
    ),
  ];

  // This function is triggered when a BottomNavigationBarItem is tapped.
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Rate My Frat'),
        ),
        body: Center(
          // Display the widget corresponding to the selected tab.
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Organizations',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.verified_user_rounded),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.purple[800],
          onTap: _onItemTapped, // Define the onTap function
        ),
      ),
    );
  }
}
// class BottomNavBar extends StatelessWidget {
//   const BottomNavBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       items: const [
//         BottomNavigationBarItem(
//           icon: Icon(Icons.home),
//           label: 'Topics',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.apps),
//           label: 'About',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.account_circle),
//           label: 'Profile',
//         ),
//       ],
//       fixedColor: Colors.deepPurple[200],
//       onTap: (int idx) {
//         switch (idx) {
//           case 0:
//             // do nothing
//             break;
//           case 1:
//             Navigator.pushNamed(context, '/about');
//             break;
//           case 2:
//             Navigator.pushNamed(context, '/profile');
//             break;
//         }
//       },
//     );
//   }
// }
