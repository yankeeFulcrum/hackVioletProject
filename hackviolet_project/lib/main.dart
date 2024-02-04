import 'package:flutter/material.dart';
import 'postPage.dart'; // Import the PostPage widget


void main() {
  runApp(const TabBarDemo());
}

class TabBarDemo extends StatefulWidget {
  const TabBarDemo({super.key});

  @override
  _TabBarDemoState createState() => _TabBarDemoState();
}

final List<String> orgList = [
  "Alpha Epsilon Pi",
  "Kappa Alpha",
  "Mu Pi Sigma",
  "French Club",
  "DINGHY"
];
List<String> filteredList = [];

class _TabBarDemoState extends State<TabBarDemo> {
  int _selectedIndex = 0;

  // This list holds the widget for each tab.
  static const List<Widget> _widgetOptions = <Widget>[
    // Text(
    //   'Tab: Orgs',
    //   style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
    // ),
    Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Card(
            child: ListTile(
              leading: Icon(Icons.apartment),
              title: Text('Alpha Epsilon Pi'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.apartment),
              title: Text('Kappa Alpha'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.apartment),
              title: Text('Mu Pi Sigma'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.apartment),
              title: Text('French Club'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.apartment),
              title: Text('DINGHY'),
            ),
          ),
        ],
      ),
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
  void initState() {
    super.initState();
    // Initially display all items
    filteredList = orgList;
  }

  void _filterList(String query) {
    if (query.isNotEmpty) {
      List<String> tempList = [];

      for (String item in orgList) {
        if (item.toLowerCase().contains(query.toLowerCase())) {
          tempList.add(item);
        }
      }
      setState(() {
        filteredList = tempList;
      });
    } else {
      setState(() {
        filteredList = orgList;
      });
    }
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: (value) {
          // Filter the list with each text change
          _filterList(value);
        },
        decoration: InputDecoration(
            hintText: 'Search...',
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )),
      ),
    );
  }

// Bottom Nav Bar tabs
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Rate My Frat'),
        ),
        body: () {
          // Decision logic for what to display based on selected index
          switch (_selectedIndex) {
            case 0:
              return Column(
                // Organization tab content
                children: [
                  _buildSearchBar(),
                  Expanded(
                    child: ListView.builder(
                      itemCount: filteredList.length,
                      itemBuilder: (context, index) => Card(
                        child: ListTile(
                          leading: Icon(Icons.apartment),
                          title: Text(filteredList[index]),
                          onTap: () {
                            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PostPage(
                        title: filteredList[index],
                        description: "Description for ${filteredList[index]}",
                        // Add more data as needed
                      ),
                ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              );
            case 1:
              return const Center(
                  // Profile tab content
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: Colors.black,
                            minRadius: 60.0,
                            child: CircleAvatar(
                              radius: 50.0,
                              backgroundImage: NetworkImage(
                                  'https://upload.wikimedia.org/wikipedia/commons/1/15/EasternGraySquirrel_GAm.jpg'),
                            ),
                          )
                        ]),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Bobby Shazam',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ]));
            
            default:
              return Text('Select a tab');
          }
        }(),
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
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
