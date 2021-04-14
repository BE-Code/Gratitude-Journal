import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Journal',
      style: optionStyle,
    ),
    Text(
      'Index 1: Stats',
      style: optionStyle,
    ),
    Text(
      'Index 2: Activities',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Gratitude Journal',
                  style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold)),
              SizedBox(width: 5),
              Icon(Icons.create_rounded, color: Colors.white, size: 25)
            ],
          ),
          backgroundColor: Colors.blueGrey),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        onPressed: () {
          Navigator.of(context).pushNamed('/editor');
        },
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      // Container(
      //   child: Column(children: <Widget>[
      //     SizedBox(height: 20),
      //     Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceAround,
      //         children: <Widget>[
      //           GestureDetector(
      //             onTap: () {
      //               Navigator.of(context).pushNamed('/home_screen');
      //             },
      //             child: Column(
      //               children: [
      //                 CircleAvatar(
      //                   radius: 27,
      //                   child: CircleAvatar(
      //                       child: Icon(Icons.menu_book_outlined,
      //                           color: Colors.green, size: 30),
      //                       radius: 25,
      //                       backgroundColor: Colors.white),
      //                   backgroundColor: Colors.green,
      //                 ),
      //                 SizedBox(height: 2.5),
      //                 Text('Journal',
      //                     style: TextStyle(
      //                         fontWeight: FontWeight.w500,
      //                         color: Colors.green,
      //                         fontSize: 15))
      //               ],
      //             ),
      //           ),
      //           GestureDetector(
      //             onTap: () {
      //               Navigator.of(context).pushNamed('/home_screen');
      //             },
      //             child: Column(
      //               children: [
      //                 CircleAvatar(
      //                   radius: 27,
      //                   child: CircleAvatar(
      //                       child: Icon(Icons.insights,
      //                           color: Colors.blue, size: 30),
      //                       radius: 25,
      //                       backgroundColor: Colors.white),
      //                   backgroundColor: Colors.blue,
      //                 ),
      //                 SizedBox(
      //                   height: 2.5,
      //                 ),
      //                 Text('Stats',
      //                     style: TextStyle(
      //                         fontWeight: FontWeight.w500,
      //                         color: Colors.blue,
      //                         fontSize: 15))
      //               ],
      //             ),
      //           ),
      //           GestureDetector(
      //             onTap: () {
      //               Navigator.of(context).pushNamed('/home_screen');
      //             },
      //             child: Column(
      //               children: [
      //                 CircleAvatar(
      //                   radius: 27,
      //                   child: CircleAvatar(
      //                       child: Icon(Icons.assignment,
      //                           color: Colors.red, size: 30),
      //                       radius: 25,
      //                       backgroundColor: Colors.white),
      //                   backgroundColor: Colors.red,
      //                 ),
      //                 SizedBox(
      //                   height: 2.5,
      //                 ),
      //                 Text('Activities',
      //                     style: TextStyle(
      //                         fontWeight: FontWeight.w500,
      //                         color: Colors.red,
      //                         fontSize: 15))
      //               ],
      //             ),
      //           ),
      //         ]),
      //     SizedBox(height: 20),
      //   ]),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_outlined),
            label: 'Journal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insights),
            label: 'Stats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Activities',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

// rate_review for help icon?

// menu book for journal
// import contacts for journal
// chrome reader mode for journal
// segment for journal
// subject for journal
// maaaaaybe book for journal
// article for journal
// create for journal orrrrr button
// edit for journal orrrrr button
// mode edit for journal
// edit note for journal**
// notes for journal

// menu book for journal
// import contacts for journal
// chrome reader mode for journal
// segment for journal
// subject for journal
// maaaaaybe book for journal
// article for journal
// create for journal orrrrr button
// edit for journal orrrrr button
// mode edit for journal
// edit note for journal**
// notes for journal

// space dashboard for stats
// analytics for stats
// trending up for stats
// dashboard for stats
// insights for stats
// stacked bar chart for stats
// equalizer for stats
// bar chart for stats
// insert chart for stats

// maybe "auto fix normal" for activity
// maybe "auto awesome" for activity
// maybe ballot for activity
// maybe list alt for activity
// maybe piano for activity
// toc for activities
// assignment for activity
// list for activity
// auto awesome mosaic for activities

//
// /// Flutter code sample for BottomNavigationBar
//
// // This example shows a [BottomNavigationBar] as it is used within a [Scaffold]
// // widget. The [BottomNavigationBar] has three [BottomNavigationBarItem]
// // widgets, which means it defaults to [BottomNavigationBarType.fixed], and
// // the [currentIndex] is set to index 0. The selected item is
// // amber. The `_onItemTapped` function changes the selected item's index
// // and displays a corresponding message in the center of the [Scaffold].
//
// /// This is the main application widget.
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   static const String _title = 'Flutter Code Sample';
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: _title,
//       home: MyStatefulWidget(),
//     );
//   }
// }
//
// /// This is the stateful widget that the main application instantiates.
// class MyStatefulWidget extends StatefulWidget {
//   const MyStatefulWidget({Key? key}) : super(key: key);
//
//   @override
//   _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
// }
//
// /// This is the private State class that goes with MyStatefulWidget.
// class _MyStatefulWidgetState extends State<MyStatefulWidget> {
//   int _selectedIndex = 0;
//   static const TextStyle optionStyle =
//       TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
//   static const List<Widget> _widgetOptions = <Widget>[
//     Text(
//       'Index 0: Home',
//       style: optionStyle,
//     ),
//     Text(
//       'Index 1: Business',
//       style: optionStyle,
//     ),
//     Text(
//       'Index 2: School',
//       style: optionStyle,
//     ),
//   ];
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('BottomNavigationBar Sample'),
//       ),
//       body: Center(
//         child: _widgetOptions.elementAt(_selectedIndex),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.business),
//             label: 'Business',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.school),
//             label: 'School',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.amber[800],
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }
