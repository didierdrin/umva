// Overall Page
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:umva/pages/playlist.dart';
import 'package:umva/pages/search.dart';
import 'package:umva/pages/settings.dart';
// Page imports
import 'library.dart';
import 'nowplaying.dart';

class OverallPage extends StatefulWidget {
  OverallPage({Key key, this.show}) : super(key: key);
  final bool show;
  @override
  State<StatefulWidget> createState() => OverallPageState();
}

class OverallPageState extends State<OverallPage> {
  int selectedIndex = 0;
  PageController _pageController;
  bool miniplayer;

  List<Widget> widgetOptions = [
    new LibraryPage(),
    new PlaylistPage(),
    new SearchPage(),
    new SettingsPage(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: selectedIndex);
    miniplayer = widget.show;
  }

  void onPageChanged(int page) {
    setState(() {
      this.selectedIndex = page;
    });
  }

  void onItemTapped(int index) {
    this._pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    print('MINIPLAYER: $miniplayer');
    return Scaffold(
      body: PageView(
        children: widgetOptions,
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),
      floatingActionButton: Visibility(
        visible: miniplayer,
        child: _getButton(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        fixedColor: Color(0xFFF06543),
        onTap: onItemTapped,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.view_week,
                color: Color(0xFFF06543),
              ),
              label: 'Library'), 
          BottomNavigationBarItem(
              icon: Icon(
                Icons.library_music_outlined,
                color: Color(0xFFF06543),
              ),
              label: 'Playlist'), 
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Color(0xFFF06543),
              ),
              label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings_outlined,
                color: Color(0xFFF06543),
              ),
              label: 'Settings'),
        ],
      ),
    );
  }

  Widget _getButton() {
    return Container(
      width: 379,
      height: 79,
      child: FittedBox(
        child: FloatingActionButton.extended(
          backgroundColor: Color(0xFF636F7E),
          onPressed: () => _pushPage(context, NowPlayingPage()),
          icon: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(150),
              image: DecorationImage(
                image: AssetImage('assets/holy.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          label: Row(
            children: [
              Column(
                children: [
                  Text(
                    'Holy',
                    style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Justin Beiber',
                    style: GoogleFonts.inter(
                        color: Colors.grey[300],
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              IconButton(
                icon: Icon(
                  Icons.pause_circle_outline,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _pushPage(BuildContext context, page) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => page),
    );
  }
}
