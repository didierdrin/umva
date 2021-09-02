// Overall Page
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:umva/pages/musicData.dart';
import 'package:umva/pages/playlist.dart';
import 'package:umva/pages/search.dart';
import 'package:umva/pages/settings.dart';
// Page imports
import 'library.dart';
import 'nowplaying.dart';

class OverallPage extends StatefulWidget {
  OverallPage(
      {Key? key,
      required this.recentSearches,
      this.show,
      this.currentTitle,
      this.currentChannel,
      this.currentImage})
      : super(key: key);
  final List<MusicData> recentSearches;
  late final show;
  final String? currentTitle;
  final String? currentChannel;
  final String? currentImage;
  @override
  State<StatefulWidget> createState() => OverallPageState();
}

class OverallPageState extends State<OverallPage> {
  int selectedIndex = 0;
  late PageController _pageController;
  late bool miniplayer;

  

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
    List<Widget> widgetOptions = [
    new LibraryPage(recentSearches: widget.recentSearches,),
    // new PlaylistPage(), Umva 1.0.1
    new SearchPage(
      recentSearches: widget.recentSearches,
    ),
    new SettingsPage(),
  ];
    print('MINIPLAYER: $miniplayer');
    return Scaffold(
      body: PageView(
        children: widgetOptions,
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),
      floatingActionButton: Visibility(
        visible: miniplayer, // Miniplayer
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
          /* Umva 1.0.1
          BottomNavigationBarItem(
              icon: Icon(
                Icons.library_music_outlined,
                color: Color(0xFFF06543),
              ),
              label: 'Playlist'), */
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
          onPressed: () {
            setState(() {
              _pushPage(
                  context,
                  NowPlayingPage(
                    songURL: '',
                    recentSearches: widget.recentSearches,
                    currentTitle: widget.currentTitle,
                    currentChannel: widget.currentChannel,
                    currentImage: widget.currentImage,
                  ));
            });
          },
          icon: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(150),
              image: DecorationImage(
                image: NetworkImage(widget.currentImage.toString()),
                fit: BoxFit.cover,
              ),
            ),
          ),
          label: Row(
            children: [
              Column(
                children: [
                  Text(
                    widget.currentTitle.toString(),
                    style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    widget.currentChannel.toString(),
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
