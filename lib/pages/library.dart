// Library Page
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:umva/pages/musicData.dart';
import 'dart:core';
import 'package:flutter_svg/flutter_svg.dart';
// Page imports
import 'package:umva/pages/nowplaying.dart';

class LibraryPage extends StatefulWidget {
  LibraryPage({Key? key, this.recentSearches, this.isPlaying})
      : super(key: key);
  final List<MusicData>? recentSearches;
  late bool? isPlaying;
  @override
  State<StatefulWidget> createState() => LibraryPageState();
}

class LibraryPageState extends State<LibraryPage> {
  
  @override
  Widget build(BuildContext context) {
    //List<MusicData>? recentlyPlayed = List.from(widget.recentSearches);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: Padding(
          padding: EdgeInsets.only(top: 25.0),
          child: Center(
            child: Text(
              'My Library',
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 0.0, left: 10.0),
          child: Column(
            children: [
              // TODO: Next Updates Playlist
              /* This Update will come in version 1.0.1
              Padding(
                padding: EdgeInsets.only(top: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 0.0, left: 10.0),
                      child: Center(
                        child: Text(
                          'Favorite playlists',
                          style: GoogleFonts.inter(
                              fontSize: 20.0, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 0.0, right: 30.0),
                      child: Center(
                        child: Text(
                          'See all',
                          style: GoogleFonts.inter(
                              fontSize: 16.0, color: Color(0xFF869FFD)),
                        ),
                      ),
                    ),
                  ],
                ),
              ), 
              Padding(
                padding: EdgeInsets.only(top: 21.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Container(
                          height: 225,
                          width: 330,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/piano.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 330,
                                height: 84,
                                decoration: BoxDecoration(
                                  color: Color(0xFF020202).withOpacity(0.6),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(15.0),
                                    bottomRight: Radius.circular(15.0),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 15.0, left: 20.0),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            child: Text('Piano',
                                                style: GoogleFonts.inter(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500,
                                                )),
                                          ),
                                          SizedBox(
                                            child: Text(
                                              '12 Songs',
                                              style: GoogleFonts.inter(
                                                  color: Colors.white
                                                      .withOpacity(0.69),
                                                  fontSize: 18),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 5.0, right: 10.0),
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.play_circle_outline,
                                          color: Colors.white,
                                          size: 35,
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Card(
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Container(
                          height: 225,
                          width: 330,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/piano.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 330,
                                height: 84,
                                decoration: BoxDecoration(
                                  color: Color(0xFF020202).withOpacity(0.6),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(15.0),
                                    bottomRight: Radius.circular(15.0),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 15.0, left: 20.0),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            child: Text('Piano',
                                                style: GoogleFonts.inter(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500,
                                                )),
                                          ),
                                          SizedBox(
                                            child: Text(
                                              '12 Songs',
                                              style: GoogleFonts.inter(
                                                  color: Colors.white
                                                      .withOpacity(0.69),
                                                  fontSize: 18),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 5.0, right: 10.0),
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.play_circle_outline,
                                          color: Colors.white,
                                          size: 35,
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Second Row Content
                    ],
                  ),
                ),
              ), */
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, left: 2.0),
                    child: Center(
                      child: Container(
                        width: 28,
                        height: 11,
                        decoration: BoxDecoration(
                          color: Color(0xFFF06543),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, left: 2.0),
                    child: Center(
                      child: Container(
                        width: 11,
                        height: 11,
                        decoration: BoxDecoration(
                          color: Color(0xFFE1E1E1),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20.0, left: 10.0),
                    child: Text(
                      'Favorites',
                      style: GoogleFonts.inter(
                          fontSize: 20.0, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(25.0),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Column(
                            children: [
                              Container(
                                  width: 130,
                                  height: 130,
                                  child: SvgPicture.asset('assets/appreciation.svg'),
                                ),
                              Text('Add songs'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20.0, left: 10.0),
                    child: Text(
                      'Recently played',
                      style: GoogleFonts.inter(
                          fontSize: 20.0, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: SizedBox(
                  child: recentPlayed(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget recentPlayed() {
    List<MusicData>? songDetails = widget.recentSearches;
    return songDetails == null
        ? Padding(
          padding: const EdgeInsets.all(25.0),
          child: Align(
            alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Container(
                    width: 130,
                    height: 130,
                    child: SvgPicture.asset('assets/playlist.svg'),
                  ),
                  Text('Add songs'),
                ],
              ),
            ),
        )
        : Container(height: 400, child: ListView(children: songDetails.map<Widget>(rPlistItem).toList()));
  }

  Widget rPlistItem(MusicData songDetails) {
    bool? _isPlaying = widget.isPlaying;
    Color _iconColor = Colors.grey;

    List<MusicData>? recentSearches = widget
        .recentSearches; // List.from(widget.recentSearches) making a copy of this list now to be mixed with recent searches
    return Container(
      child: ListTile(
        onTap: () {
          print(
              'This is the state of the VIDEO: $_isPlaying , ${widget.isPlaying}');
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
        leading: Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: NetworkImage(songDetails.image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(
          songDetails.title,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.inter(fontSize: 16),
        ),
        subtitle: Text(
          songDetails.channelTitle,
          style: GoogleFonts.inter(fontSize: 16),
        ),
        trailing: IconButton(
          icon: Icon(
            Icons.delete,
            color: _iconColor,
          ),
          onPressed: () {
            // songDetails.remove position to be removed
            // recentSearches!.remove(songDetails);
          },
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
