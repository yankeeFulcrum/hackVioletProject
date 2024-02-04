/*
Hackviolet 2024: Rate My Party
Caiden Romero, Roscoe Lin, Minh-Thu Nguyen, Sidney Nguyen

Some aspects of our code was based on the Flutter documentation, Fireship.io, and Shakleen Ishfar's Medium article.
*/


import 'package:flutter/material.dart';
import 'orgPage.dart';

void main() {
  runApp(const TabBarDemo());
}

class TabBarDemo extends StatefulWidget {
  const TabBarDemo({super.key});

  @override
  myApp createState() => myApp();
}

final List<String> orgList = [
  "Alpha Epsilon Pi",
  "Kappa Alpha",
  "Mu Phi Sigma",
  "French Club",
  "DINGHY"
];
List<String> filteredList = [];

Map<String, List<String>> orgComments = {
  "Alpha Epsilon Pi": [
    "Just okay, not the best not the worst.",
    "I had a good time, my friends didn't though."
  ],
  "Kappa Alpha": [
    "Really fun, I felt so safe the whole time!",
    "Good vibes :)"
  ],
  "Mu Phi Sigma": ["Nice people overall.", "Never going back."],
  "French Club": ["3/10 kinda weird.", "Mid."],
  "DINGHY": [
    "Think twice before you go.  Super sketchy vibes.",
    "Be careful around Steve."
  ],
};

List<String> orgPics = [
  "https://images.squarespace-cdn.com/content/v1/5f2c061211042073569ab086/1599165536953-0GB80EKBDDP9MP22RLJJ/cofa-01+%282%29.png",
  "https://kauga.com/wp-content/uploads/2022/10/Kappa-Alpha-Order-Flag.jpg",
  "https://lh3.googleusercontent.com/proxy/1I8COfdz6378rf9eZdxD6GvhU6LNg1qZp2qb8ClJxK-9Sj3nyYMMcJrhwPkd7ibZas_3qmPsYYHUpDDv2oZx3MohHehu89e-M30O78nO42HRj5s9sKrrIaTmnvZsLoH6lWC6hf1MzniB8WsPU8pQPWRCVK1I1G9XA5XJEPcOF_OCJ9yTE1vUCW2kLHJMzJqNADBNY5GALg",
  "https://cf.ltkcdn.net/kids/images/orig/316639-2022x1348-french-flag-in-paris.jpg",
  "https://www.hashtagboatlife.com/wp-content/uploads/2021/01/rigid-inflatable-dinghy-powerful.jpg",
];

List<String> orgDescriptions = [
  "Fraternity",
  "Fraternity",
  "Fraternity",
  "Social Org",
  "Social Org"
];

List<String> subDescription = [
  "A historically Jewish fraternity known for fostering leadership, brotherhood, and community service. Alpha Epsilon Pi emphasizes cultural, academic, and social development while promoting Jewish identity and values.",
  "Kappa Alpha Order is often celebrated for its emphasis on tradition, gentlemanly conduct, and a deep sense of loyalty and brotherhood. It aims to cultivate ethical leaders inspired by the virtues of chivalry and respect.",
  "A fraternity dedicated to the advancement of music and performing arts. Mu Phi Sigma aims to provide a supportive community for musicians and artists, fostering talent through collaboration and social engagement.",
  "The French Club provides a cultural exchange platform, celebrating French heritage through social gatherings, cultural events, and language practice sessions. It's a social fraternity that unites members with an interest in French culture, traditions, and camaraderie.",
  "A social fraternity for sailing enthusiasts and sea lovers. DINGHY organizes sailing events, regattas, and social gatherings, offering members a chance to explore the joys of dinghying, learn nautical skills, and bond over shared maritime adventures."
];

List<String> orgRatings = [
  "3.5/5",
  "5/5",
  "4.1/5",
  "2/5",
  "1.5/5",
];

class myApp extends State<TabBarDemo> {
  int _selectedIndex = 0;

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
          backgroundColor: Colors.deepPurple[400],
          title: const Text('Rate My Party'),
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
                                builder: (context) => OrgPage(
                                  title: filteredList[index],
                                  description: orgDescriptions[index],
                                  subDescription: subDescription[index],
                                  imageUrl: orgPics[index],
                                  rating: orgRatings[index],
                                  comments: orgComments,
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
