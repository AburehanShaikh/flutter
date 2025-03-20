import 'package:flutter/material.dart';
import 'top_banner.dart';
import 'icon_grid.dart';
import 'slider_icons.dart';
import 'bottom_nav_bar.dart';
import 'profile_screen.dart'; // Import the Profile Screen
import 'scan_screen.dart'; // Import the new scan screen

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0; // Index for the selected navigation bar item

  // List of navigation bar items
  static const List<BottomNavigationBarItem> _navBarItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: 'Rewards'),
    BottomNavigationBarItem(icon: Icon(Icons.qr_code_scanner), label: 'Scan'),
    BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifications'),
    BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More'),
  ];

  // Function to handle navigation bar item selection
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigate to Profile Screen when "More" is selected
    if (index == 4) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfileScreen()),
      );
    }

    // Navigate to Scan Screen when "Scan" is selected
    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ScanScreen()),
      ).then((scannedData) {
        if (scannedData != null) {
          // Process the scanned data
          print('Scanned Data: $scannedData');
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. Image at the Top
            Container(
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/banner.jpg'), // Add your image
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),

            // 2. 9 Medium Icons in a Grid
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(), // Disable scrolling
              crossAxisCount: 3, // 3 icons per row
              children: List.generate(9, (index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star, size: 40, color: Colors.blue),
                    SizedBox(height: 8),
                    Text('Item ${index + 1}'),
                  ],
                );
              }),
            ),
            SizedBox(height: 20),

            // 3. 3 Slider Icons (Horizontal Scrollable List)
            Container(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(3, (index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Promo ${index + 1}',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  );
                }),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),

      // 4. Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed, // Fixed style for more than 3 items
        items: _navBarItems,
      ),
    );
  }
}

/*import 'package:flutter/material.dart';
import 'top_banner.dart';
import 'icon_grid.dart';
import 'slider_icons.dart';
import 'bottom_nav_bar.dart';
import 'profile_screen.dart'; // Import the Profile Screen

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0; // Index for the selected navigation bar item

  // List of navigation bar items
  static const List<BottomNavigationBarItem> _navBarItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: 'Rewards'),
    BottomNavigationBarItem(icon: Icon(Icons.qr_code_scanner), label: 'Scan'),
    BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifications'),
    BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More'),
  ];

  // Function to handle navigation bar item selection
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigate to Profile Screen when "More" is selected
    if (index == 4) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfileScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. Image at the Top
            Container(
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/banner.jpg'), // Add your image
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),

            // 2. 9 Medium Icons in a Grid
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(), // Disable scrolling
              crossAxisCount: 3, // 3 icons per row
              children: List.generate(9, (index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star, size: 40, color: Colors.blue),
                    SizedBox(height: 8),
                    Text('Item ${index + 1}'),
                  ],
                );
              }),
            ),
            SizedBox(height: 20),

            // 3. 3 Slider Icons (Horizontal Scrollable List)
            Container(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(3, (index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Promo ${index + 1}',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  );
                }),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),

      // 4. Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed, // Fixed style for more than 3 items
        items: _navBarItems,
      ),
    );
  }
}*/