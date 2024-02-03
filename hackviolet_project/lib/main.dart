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
            title: const Text('Rate My Frat'),
          ),
          body: const TabBarView(
            children: [
              Icon(Icons.home),
              Icon(Icons.apps),
              Icon(Icons.account_circle),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Topics',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.apps),
                label: 'About',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: 'Profile',
              ),
            ],
          ),
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
