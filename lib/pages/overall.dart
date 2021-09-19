// Overall Page
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:umva/pages/musicData.dart';
import 'package:umva/pages/search.dart';
import 'package:umva/pages/settings.dart';
// Page imports
import 'library.dart';
import 'nowplaying.dart';

class OverallPage extends StatefulWidget {
  OverallPage({
    Key? key,
    this.recentSearches,
    this.isPlaying,
    required this.show,
  }) : super(key: key);
  late final List<MusicData>? recentSearches;
  final bool show;
  final bool? isPlaying;
  @override
  State<StatefulWidget> createState() => OverallPageState();
}

class OverallPageState extends State<OverallPage> {
  int selectedIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: selectedIndex);
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
    List<MusicData>? songDetails = widget.recentSearches;
    bool? isPlaying = widget.isPlaying;

    bool miniplayer = widget.show;

    List<Widget> widgetOptions = [
      new LibraryPage(
        recentSearches: songDetails,
        isPlaying: isPlaying,
      ),
      // TODO: new PlaylistPage(), Umva 1.0.1
      new SearchPage(
        recentSearches: songDetails,
        isPlaying: isPlaying,
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
        child: (songDetails == null)
            ? Center(
                child: Text(''),
              )
            : _getButton(MusicData(
                songDetails[songDetails.length - 1].title,
                songDetails[songDetails.length - 1].channelTitle,
                songDetails[songDetails.length - 1].url,
                songDetails[songDetails.length - 1].image)),
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
          // TODO: This update for Playlist
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

  Widget _getButton(MusicData songDetails) {
    bool? _isPlaying = widget.isPlaying;
    return Container(
      width: 379,
      height: 79,
      child: FittedBox(
        child: FloatingActionButton.extended(
          backgroundColor: Color(0xFF636F7E),
          onPressed: () {
            if (_isPlaying == true) {
              Navigator.of(context).pop();
            } else {
              _pushPage(
                  context,
                  NowPlayingPage(
                    songURL: songDetails.url,
                    recentSearches: widget.recentSearches,
                  ));
            }
          },
          icon: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(150),
              image: DecorationImage(
                image: NetworkImage(songDetails.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          label: Row(
            children: [
              SizedBox(
                width: 200,
                child: Column(
                  children: [
                    Text(
                      songDetails.title,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      songDetails.channelTitle,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.inter(
                          color: Colors.grey[300],
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),

              SizedBox(width: 50,),
              /* TODO: Add this feature later
              IconButton(
                icon: Icon(
                  Icons.pause_circle_outline,
                  color: Colors.white,
                ),
                onPressed: () {},
              ), */
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

// TODO: Error Null value being checked to be empty, 
// on the other page I solved it by changing the operator to == null  
// but Here it's not working