// Playlist Page
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// Page imports

class PlaylistPage extends StatefulWidget {
  PlaylistPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => PlaylistPageState();
}

class PlaylistPageState extends State<PlaylistPage> {
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
                    Icons.chevron_left,
                    size: 30,
                  ),
                  onPressed: () {},
                ),
              ),
              Center(
                child: Text(
                  'My Playlists',
                  style: GoogleFonts.dosis(
                      fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ),
              SizedBox(
                width: 50,
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20, left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 60,
                      width: 195,
                      child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xFFF06543),
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      
                      ),
                      ),
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.playlist_add,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'New Playlist',
                            style: GoogleFonts.montserrat(
                                color: Colors.white, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    TextButton(
                      //minWidth: 39,
                      //height: 39,
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      primary: Color(0xFFFACEC4),
                      ),
                      onPressed: () {},
                      child: Center(
                        child: Icon(Icons.format_align_justify),
                      ),
                    ),

                    SizedBox(
                      height: 39,
                      width: 39,
                      child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      ),
                      onPressed: () {},
                      child: Center(
                        child: Icon(Icons.format_align_center),
                      ),
                    ),
                    ),


                    
                  ],
                ),
              ),
            
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
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
                      
                ],
              ),
            ),




            ],
          ),
        ),
      ),
    );
  }
}
