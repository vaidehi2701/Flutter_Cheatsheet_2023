import 'package:flutter/material.dart';
import 'package:widget_utils/ui/screens/music_player.dart';

GlobalKey<ScaffoldState> scaffoldState = GlobalKey();

class MusicList extends StatefulWidget {
  const MusicList({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MusicListState createState() => _MusicListState();
}

class _MusicListState extends State<MusicList> {
  List<Song>? listSong = [];

  @override
  void initState() {
    loadSongs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return Scaffold(
      key: scaffoldState,
      body: Stack(
        children: <Widget>[
          setAlbumCover(mediaQuery),
          setActionAppBar(mediaQuery),
          setName(mediaQuery),
          setFAB(mediaQuery),
          setSongList(mediaQuery),
        ],
      ),
    );
  }

  Widget setName(MediaQueryData mediaQuery) {
    return SizedBox(
      height: mediaQuery.size.height / 1.8,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Stack(
              children: <Widget>[
                Positioned(
                  top: constraints.maxHeight - 100.0,
                  child: const Text(
                    "Raval",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "CoralPen",
                      fontSize: 72.0,
                    ),
                  ),
                ),
                Positioned(
                  top: constraints.maxHeight - 140.0,
                  child: const Text(
                    "Darshan",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "CoralPen",
                      fontSize: 72.0,
                    ),
                  ),
                ),
                Positioned(
                  top: constraints.maxHeight - 160.0,
                  child: const Text(
                    "Trending",
                    style: TextStyle(
                      color: Color(0xFFC82623),
                      fontSize: 14.0,
                      fontFamily: "Campton_Light",
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget setSongList(MediaQueryData mediaQuery) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20.0,
        top: mediaQuery.size.height / 1.8 + 48.0,
        right: 20.0,
        bottom: mediaQuery.padding.bottom + 16.0,
      ),
      child: Column(
        children: <Widget>[
          _buildWidgetHeaderSong(),
          const SizedBox(height: 16.0),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              separatorBuilder: (BuildContext context, int index) {
                return const Opacity(
                  opacity: 0.5,
                  child: Padding(
                    padding: EdgeInsets.only(top: 2.0),
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                );
              },
              itemCount: listSong!.length,
              itemBuilder: (BuildContext context, int index) {
                Song song = listSong![index];
                return GestureDetector(
                  onTap: () {
                    _navigatorToMusicPlayerScreen(song.title!);
                  },
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          song.title!,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: "Campton_Light",
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        song.duration!,
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(width: 24.0),
                      const Icon(
                        Icons.more_horiz,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWidgetHeaderSong() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "Popular",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 24.0,
            fontFamily: "Campton_Light",
          ),
        ),
        Text(
          "Show all",
          style: TextStyle(
            color: Color(0xFFC82623),
            fontWeight: FontWeight.w600,
            fontFamily: "Campton_Light",
          ),
        ),
      ],
    );
  }

  Widget setFAB(MediaQueryData mediaQuery) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: EdgeInsets.only(
          top: mediaQuery.size.height / 1.8 - 32.0,
          right: 32.0,
        ),
        child: FloatingActionButton(
          backgroundColor: const Color(0xFFC82623),
          onPressed: () {
            _navigatorToMusicPlayerScreen(listSong![0].title!);
          },
          child: const Icon(
            Icons.play_arrow,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void _navigatorToMusicPlayerScreen(String title) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return MusicPlayerScreen(title);
    }));
  }

  Widget setActionAppBar(MediaQueryData mediaQuery) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16.0,
        top: mediaQuery.padding.top + 16.0,
        right: 16.0,
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
            Icons.menu,
            color: Colors.white,
          ),
          Icon(
            Icons.info_outline,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget setAlbumCover(MediaQueryData mediaQuery) {
    return Container(
      width: double.infinity,
      height: mediaQuery.size.height / 1.8,
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(48.0),
        ),
        image: DecorationImage(
          image: AssetImage("assets/images/darshan_raval_first_song.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  void loadSongs() {
    listSong!.add(Song(title: "Teri Aankhon Mein", duration: "5:20"));
    listSong!.add(Song(title: "Chogada", duration: "3:20"));
    listSong!.add(Song(title: "Ek Tarfa", duration: "4:12"));
    listSong!.add(Song(title: "Jannat Ve", duration: "4:40"));
    listSong!.add(Song(title: "Muje Peene do", duration: "2:58"));
    listSong!.add(Song(title: "Rabba Mehr Kari", duration: "3:27"));
    listSong!.add(Song(title: "Tere Naal", duration: "3:10"));
  }
}

class Song {
  String? title;
  String? duration;

  Song({this.title, this.duration});

  @override
  String toString() {
    return 'Song{title: $title, duration: $duration}';
  }
}
