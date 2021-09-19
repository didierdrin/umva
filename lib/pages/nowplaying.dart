// Now Playing
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:umva/pages/library.dart';
import 'package:umva/pages/musicData.dart';
import 'package:umva/pages/search.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
// Page imports
import 'overall.dart';

class NowPlayingPage extends StatefulWidget {
  NowPlayingPage({Key? key, this.recentSearches, this.songURL})
      : super(key: key);
  final List<MusicData>? recentSearches;
  late final String? songURL;
  @override
  State<StatefulWidget> createState() => NowPlayingPageState();
}

class NowPlayingPageState extends State<NowPlayingPage> {
  Color _iconColor = Colors.grey;
  late bool _isPlayingReady;
  late YoutubePlayerController _controller;

  @override
  void initState() {
    final String videoID =
        YoutubePlayer.convertUrlToId(widget.songURL ?? '').toString();
    super.initState();
    _controller = YoutubePlayerController(
        initialVideoId: videoID,
        flags: const YoutubePlayerFlags(
          autoPlay: true,
          enableCaption: true,
        ));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<MusicData>? songDetails = widget.recentSearches;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: Padding(
          padding: EdgeInsets.only(top: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: IconButton(
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: OverallPage(
                              isPlaying: _isPlayingReady,
                              show: true,
                              recentSearches: widget.recentSearches,
                            ),
                            type: PageTransitionType.size,
                            alignment: Alignment.topCenter,
                            duration: Duration(milliseconds: 500)));
                  },
                ),
              ),
              Center(
                child: Text(
                  'Now playing',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: IconButton(
                  icon: Icon(
                    Icons.close_sharp,
                    size: 25,
                  ),
                  onPressed: () {
                    dispose();

                    Navigator.pushReplacement(
                        context,
                        PageTransition(
                            child: OverallPage(
                              show: false,
                              recentSearches: widget.recentSearches,
                            ),
                            type: PageTransitionType.size,
                            alignment: Alignment.topCenter,
                            duration: Duration(milliseconds: 500)));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Container(
                  width: double.infinity,
                  height: 300.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: videoPlayer(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: ListTile(
                leading: IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: _iconColor,
                  ),
                  onPressed: () {
                    setState(() {
                      if (_iconColor == Colors.grey) {
                        _iconColor = Color(0xFFF06543);
                      } else {
                        _iconColor = Colors.grey;
                      }
                    });
                  },
                ),
                title: Padding(
                  padding: EdgeInsets.only(right: 90.0),
                  child: Center(
                    child: Text(
                      songDetails![songDetails.length - 1].title,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.inter(),
                    ),
                  ),
                ),
                subtitle: Padding(
                  padding: EdgeInsets.only(right: 90.0),
                  child: Center(
                    child: Text(
                      songDetails[songDetails.length - 1].channelTitle,
                      style: GoogleFonts.inter(),
                    ),
                  ),
                ),
              ),
            ),

            /*
            Padding(
              padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 10.0),
              child: Column(
                children: [
                  Slider.adaptive(value: 0.0, onChanged: (value) {}),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 0.0),
                    child: Text(
                      '00:00',
                      style: GoogleFonts.inter(
                          fontSize: 12, color: Color(0xFF535353)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 0.0),
                    child: Text(
                      '00:00',
                      style: GoogleFonts.inter(
                          fontSize: 12, color: Color(0xFF535353)),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.shuffle,
                      color: Color(0xFF828282),
                      size: 25,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.fast_rewind,
                      color: Color(0xFF3D3D3D),
                      size: 25,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.play_circle_outline,
                      color: Color(0xFFF06543),
                      size: 40,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.fast_forward,
                      color: Color(0xFF3D3D3D),
                      size: 25,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.replay,
                      color: Color(0xFF828282),
                      size: 25,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ), */

            Padding(
              padding: EdgeInsets.all(10.0),
              child: SizedBox(
                child: Column(
                  children: [
                    Divider(
                      thickness: 1,
                      indent: 20,
                      endIndent: 20,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        child: Center(
                      child: Text(
                        "Suggested & Ads",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    )),
                    SizedBox(
                      height: 20,
                    ),
                    // Container(child: ListView(),), List Tiles of same URL search
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget videoPlayer() {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.orange,
        topActions: [
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: Text(
            _controller.metadata.title,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(color: Colors.white),
          )),
        ],
        onReady: () {
          _isPlayingReady = true;
        },
        onEnded: (data) {
          _isPlayingReady = false;
          SnackBar _snackBar = SnackBar(content: Text('Video ended !'));
          ScaffoldMessenger.of(context).showSnackBar(_snackBar);
        },
      ),
      builder: (context, player) => Scaffold(
        body: Container(
          child: player,
        ),
      ),
    );
  }
}
