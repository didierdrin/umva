// Now Playing
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
// Page imports
import 'overall.dart';

class NowPlayingPage extends StatefulWidget {
  NowPlayingPage(
      {Key? key, this.currentTitle, this.currentChannel, this.currentImage})
      : super(key: key);
  final String? currentTitle;
  final String? currentChannel;
  final String? currentImage;
  @override
  State<StatefulWidget> createState() => NowPlayingPageState();
}

class NowPlayingPageState extends State<NowPlayingPage> {
  @override
  Widget build(BuildContext context) {
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
                              show: true,
                              currentTitle: widget.currentTitle,
                              currentChannel: widget.currentChannel,
                              currentImage: widget.currentImage,
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
                    Navigator.push(
                        context,
                        PageTransition(
                            child: OverallPage(
                              show: false,
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
                  width: 300.0,
                  height: 300.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(150),
                    image: DecorationImage(
                      image: NetworkImage(widget.currentImage.toString()),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: ListTile(
                leading: IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: Color(0xFFF06543),
                  ),
                  onPressed: () {},
                ),
                title: Padding(
                  padding: EdgeInsets.only(right: 90.0),
                  child: Center(
                    child: Text(
                      widget.currentTitle.toString(),
                      style: GoogleFonts.inter(),
                    ),
                  ),
                ),
                subtitle: Padding(
                  padding: EdgeInsets.only(right: 90.0),
                  child: Center(
                    child: Text(
                      widget.currentChannel.toString(),
                      style: GoogleFonts.inter(),
                    ),
                  ),
                ),
              ),
            ),
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
            ),
          ],
        ),
      ),
    );
  }
}
