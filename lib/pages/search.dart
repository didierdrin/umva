// Search Page
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_api/youtube_api.dart';
// Page imports

class SearchPage extends StatefulWidget {
  SearchPage({Key? key, this.searchContent}) : super(key: key);
  final String searchContent;
  @override
  State<StatefulWidget> createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  TextStyle style = GoogleFonts.dosis(fontSize: 16.0);
  static String key = "AIzaSyCCGus7hZ2jLCdXfNC3KSl1J5D80BPJ5bc";
  YoutubeAPI ytApi = YoutubeAPI(key);
  List<YT_API> ytResult = [];

  callAPI() async {
    String query = widget.searchContent;
    ytResult = await ytApi.search(query);
    ytResult = await ytApi.nextPage();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    callAPI();
    print('API RUNNING');
  }

  @override
  Widget build(BuildContext context) {
    final _searchController = TextEditingController();
    final searchField = TextFormField(
      obscureText: false,
      style: style,
      controller: _searchController,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(
            Icons.search,
            size: 30,
          ),
          onPressed: () => _pushPage(
              context, SearchPage(searchContent: _searchController.text)),
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
              searchField,
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
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 500.0,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: ytResult.length,
                          itemBuilder: (_, int index) => listItem(index),
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

  Widget listItem(index) {
    return ListTile(
      leading: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: NetworkImage(ytResult[index].thumbnail['default']['url']),
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text(
        ytResult[index].title,
        style: GoogleFonts.dosis(fontSize: 16),
      ),
      subtitle: Text(
        ytResult[index].channelTitle,
        style: GoogleFonts.dosis(fontSize: 16),
      ),
      trailing: IconButton(
        icon: Icon(
          Icons.cancel_outlined,
        ),
        onPressed: () {},
      ),
    );
  }

  void _pushPage(BuildContext context, page) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => page),
    );
  }
}
