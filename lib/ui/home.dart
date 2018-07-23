import 'package:flutter/material.dart';

import '../pages/search_page.dart';
import '../pages/rewards_page.dart';
import '../pages/login_page.dart';


class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MainPageState();
  }
}
class MainPageState extends State<HomeScreen> {
  PageController _pageController;
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: new Color(0xFF000000),
        title: new Text('iRewards'),
        centerTitle: true,
          actions: <Widget>[
            // action button
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
               //
              })]
              
      ),
      body: PageView(
        children: <Widget>[
        //Home
        new Offstage(
          offstage: _page != 0,
          child: new ListView(
          children: <Widget>[
            ListTile(
              title: Text('News 1'),
              subtitle: Text('This is a subtitle 1')
            ),
            ListTile(
              title: Text('News 2'),
              subtitle: Text('This is a subtitle 2'),
            ),
            ListTile(
              title: Text('News 3'),
              subtitle: Text('This is a subtitle 3'),
            ),
          ],
          )
        ),
        //Rewards
        new Offstage(
          offstage: _page != 1,
          child: new TickerMode(
            enabled: _page != 1,
           child: new MaterialApp(
             debugShowCheckedModeBanner: false,
             home: new RewardsPage()), 
          )
          ),
        //Search
        new Offstage(
          offstage: _page != 2,
           child: new MaterialApp(
             debugShowCheckedModeBanner: false,
             home: new SearchPage()), 
          ),
        //Profile
        new Offstage(
          offstage: _page != 3,
           child: new MaterialApp(
             debugShowCheckedModeBanner: false,
             home: new LoginPage()), 
          )
      ],
      controller: _pageController,
      onPageChanged: onPageChanged,
      ),

      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(
              icon: Icon(Icons.stars), title: Text("Rewards")),
          BottomNavigationBarItem(
              icon: Icon(Icons.search), title: Text("Search")),
          BottomNavigationBarItem(
              icon: Icon(Icons.perm_identity), title: Text("Profile"))
        ],
        onTap: navigationTapped,
        currentIndex: _page,
      ),
    );
  }

  /// Called when the user presses on of the
  /// [BottomNavigationBarItem] with corresponding
  /// page index
  void navigationTapped(int page) {
    _pageController.animateToPage(
      page,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  @override
  void initState() {
    super.initState();
    _pageController = new PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }
}
