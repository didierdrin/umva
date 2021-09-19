// Search Result Page
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:umva/main.dart';
import 'package:umva/pages/library.dart';
import 'package:umva/pages/musicData.dart';
import 'package:umva/pages/nowplaying.dart';
import 'package:umva/pages/overall.dart';
import 'package:umva/pages/search.dart';
import 'package:umva/pages/splashpage.dart';
import 'package:youtube_api/youtube_api.dart';
// Page imports

class SearchResultPage extends StatefulWidget {
  SearchResultPage({Key? key, required this.query}) : super(key: key);
  final String query;
  @override
  State<StatefulWidget> createState() => SearchResultPageState();
}

class SearchResultPageState extends State<SearchResultPage> {
  List<MusicData> recentSearches = [];

  late String title;
  late String channel;
  late String image;

  TextStyle style = GoogleFonts.dosis(fontSize: 16.0);
  static String key = "AIzaSyCCGus7hZ2jLCdXfNC3KSl1J5D80BPJ5bc";
  YoutubeAPI youtube = YoutubeAPI(key);
  List<YouTubeVideo> videoResults = [];

  Future<void> callAPI() async {
    String query = widget.query;
    videoResults =
        await youtube.search(query, order: 'relevance', videoDuration: 'any');
    videoResults = await youtube.nextPage();
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
                child: SizedBox(
                  width: 50,
                  child: IconButton(
                    icon: Icon(Icons.chevron_left),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Search Results',
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
      body: songListView(),
    );
  }

  Widget songListView() {
    return videoResults.isEmpty
        ? Center(
            child: CircularProgressIndicator(
              color: Colors.orange,
            ),
          )
        : ListView(
            children: videoResults.map<Widget>(listItem).toList(),
          );
  }

  Widget listItem(YouTubeVideo video) {
    return Container(
      child: ListTile(
        onTap: () {
          String url = video.url;
          _pushPage(
              context,
              NowPlayingPage(
                songURL: url,
                recentSearches: recentSearches,
              ));
          recentSearches.insert(recentSearches.length, MusicData(video.title, video.channelTitle,
              video.url, video.thumbnail.small.url ?? ''));
          SearchPage(recentSearches: recentSearches);
          OverallPage(show: false, recentSearches: recentSearches,);
          LibraryPage(
            recentSearches: recentSearches,
          );
      
        },
        leading: Container(
          child: Image.network(
            video.thumbnail.small.url ?? '',
            width: 120,
          ),
        ),
        title: Text(video.title),
        subtitle: Text(video.channelTitle),
      ),
    );
  }

  void _pushPage(BuildContext context, page) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => page),
    );
  }
}

