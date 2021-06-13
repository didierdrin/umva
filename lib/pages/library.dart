// Library Page
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// Page imports
import 'package:umva/pages/nowplaying.dart';

class LibraryPage extends StatefulWidget {
  LibraryPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => LibraryPageState();
}

class LibraryPageState extends State<LibraryPage> {
  @override
  Widget build(BuildContext context) {
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
              ),
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
                      'Recently added',
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
                        padding: EdgeInsets.only(right: 10.0),
                        child: Column(
                          children: [
                            Container(
                              width: 130,
                              height: 130,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  image: AssetImage('assets/holy.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            SizedBox(
                              child: Text(
                                'Holy',
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.0),
                              ),
                            ),
                            SizedBox(
                              child: Text(
                                'Justin Beiber',
                                style: GoogleFonts.inter(fontSize: 16.0),
                              ),
                            ),
                          ],
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
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ListTile(
                        onTap: () => _pushPage(context, NowPlayingPage()),
                        leading: Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: AssetImage('assets/holy.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        title: Text(
                          'Holy',
                          style: GoogleFonts.inter(fontSize: 16),
                        ),
                        subtitle: Text(
                          'Justin Beiber',
                          style: GoogleFonts.inter(fontSize: 16),
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.favorite,
                            color: Color(0xFFF06543),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
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
