// Search Page
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:umva/pages/musicData.dart';
import 'package:umva/pages/nowplaying.dart';
import 'searchresults.dart';
// Page imports

class SearchPage extends StatefulWidget {
  SearchPage({Key? key, this.recentSearches, this.isPlaying}) : super(key: key);
  late final List<MusicData>? recentSearches;
  final bool? isPlaying;
  @override
  State<StatefulWidget> createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  late String value;

  TextStyle style = GoogleFonts.dosis(fontSize: 16.0);

  TextEditingController _searchController = TextEditingController();
  TextFormField _searchFormField() {
    return TextFormField(
      obscureText: false,
      style: style,
      controller: _searchController,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(
            Icons.search,
            color: Color(0xFFF06543),
            size: 30,
          ),
          onPressed: () {
            if (_searchController.text.isNotEmpty) {
              _pushPage(
                  context, SearchResultPage(query: _searchController.text));
              _searchController.clear();
            } else {
              return null;
            }
          },
        ),
        filled: true,
        //fillColor: Colors.grey[450],
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: 'Search music',
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //List<MusicData>? songDetails = widget.recentSearches;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: Padding(
          padding: EdgeInsets.only(top: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: SizedBox(
                  width: 50,
                ),
              ),
              Center(
                child: Text(
                  'Search',
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
        child: Padding(
          padding: EdgeInsets.only(right: 10.0, left: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _searchFormField(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20.0, left: 10.0),
                    child: Text(
                      'Recent Searches: ', //${songDetails?.length ?? 0}',
                      style: GoogleFonts.dosis(
                          fontSize: 20.0, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: recentSearchContainer(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget recentSearchContainer() {
    List<MusicData>? songDetails = widget.recentSearches;
    return songDetails == null
        ? Padding(
            padding: const EdgeInsets.only(top: 90.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Container(
                    width: 130,
                    height: 130,
                    child: SvgPicture.asset('assets/search.svg'),
                  ),
                  SizedBox(height: 10.0,),
                  Text('Search'),
                ],
              ),
            ),
          )
        : Container(
          height: 700,
          child: ListView(
              children: songDetails.map<Widget>(recentSearchList).toList(),
            ),
        );
  }

  Widget recentSearchList(MusicData songDetails) {
    bool? _isPlaying = widget.isPlaying;
    return Container(
      child: ListTile(
        onTap: () {
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
          child: Image.network(songDetails.image),
        ),
        title: Text(songDetails.title),
        subtitle: Text(songDetails.channelTitle),
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