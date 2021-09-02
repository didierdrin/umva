// Search Page
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:umva/pages/musicData.dart';
import 'searchresults.dart';
// Page imports

class SearchPage extends StatefulWidget {
  SearchPage({Key? key, required this.recentSearches}) : super(key: key);
  final List<MusicData> recentSearches;
  @override
  State<StatefulWidget> createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  late String value;

  //List<MusicData> recentSearches = [];
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
        fillColor: Colors.grey[200],
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
                      'Recent Searches',
                      style: GoogleFonts.dosis(
                          fontSize: 20.0, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Center(
                  child: (widget.recentSearches.isEmpty)
                      ? Padding(
                          padding: const EdgeInsets.only(top: 200.0),
                          child: Text('No Recent Searches'),
                        )
                      : recentSearchList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget recentSearchList() {
    // print(recentSearches[0].channelTitle);
    return Container(
      height: 700,
      child: ListView.builder(
      itemCount: widget.recentSearches.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Container(
            child: Image.network(widget.recentSearches[index].image),
          ),
          title: Text(widget.recentSearches[index].title),
          subtitle: Text(widget.recentSearches[index].channelTitle),
        );
      },
    ),
    );
  }

  void _pushPage(BuildContext context, page) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => page),
    );
  }
}
