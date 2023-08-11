import 'dart:io';
import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class MusicPlayerScreen extends StatefulWidget {
  final String title;

  const MusicPlayerScreen(this.title, {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MusicPlayerScreenState createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  double _sliderVolume = 0.30;
  AudioPlayer? audioPlayer;
  double? durationvalue;
  bool issongplaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    loadSong();
    super.initState();
  }

  void loadSong() {
    audioPlayer = AudioPlayer();
    audioPlayer!.play(AssetSource("audio/Chogada.mp3"));
    issongplaying = true;

    audioPlayer!.onDurationChanged.listen((event) {
      setState(() {
        duration = event;
      });
    });
    audioPlayer!.onPositionChanged.listen((event) {
      setState(() {
        position = event;
      });
    });
    audioPlayer!.onPlayerStateChanged.listen((event) {
      setState(() {
        issongplaying = event == PlayerState.playing;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer!.stop();
    audioPlayer!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: mediaQuery.size.height / 1.8,
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                image: AssetImage("assets/images/darshan_raval_first_song.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 10.0,
                sigmaY: 10.0,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.0),
                ),
              ),
            ),
          ),
          buildScreen(mediaQuery),
        ],
      ),
    );
  }

  Widget buildScreen(MediaQueryData mediaQuery) {
    return Padding(
      padding: EdgeInsets.only(top: mediaQuery.padding.top + 16.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  "Artist",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Campton_Light",
                    fontWeight: FontWeight.w900,
                    fontSize: 16.0,
                  ),
                ),
                const Icon(
                  Icons.info_outline,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          const SizedBox(height: 48.0),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(48.0),
                  topRight: Radius.circular(48.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 36.0),
                    Center(
                      child: Container(
                        width: mediaQuery.size.width / 2.5,
                        height: mediaQuery.size.width / 2.5,
                        decoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(
                            Radius.circular(24.0),
                          ),
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/images/darshan_raval_3.png",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 48.0),
                    setProgress(),
                    const SizedBox(height: 36.0),
                    setMusicInfo(),
                    setControlMusicPlayer(),
                    setVolumeController(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget setVolumeController() {
    return Expanded(
      child: Center(
        child: Row(
          children: <Widget>[
            Icon(
              Icons.volume_mute,
              color: Colors.grey.withOpacity(0.5),
            ),
            Expanded(
              child: Slider(
                min: 0.0,
                max: 1.0,
                value: _sliderVolume,
                activeColor: Colors.black,
                inactiveColor: Colors.grey.withOpacity(0.5),
                onChanged: (value) {
                  audioPlayer!.setVolume(value);
                  setState(() => _sliderVolume = value);
                },
              ),
            ),
            Icon(
              Icons.volume_up,
              color: Colors.grey.withOpacity(0.5),
            ),
          ],
        ),
      ),
    );
  }

  Widget setControlMusicPlayer() {
    return Expanded(
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: InkWell(
                  onTap: () => rewindAudio(),
                  child: const Icon(Icons.fast_rewind)),
            ),
            InkWell(
              onTap: () {
                setState(
                  () {
                    if (!issongplaying) {
                      audioPlayer!.resume();
                    } else {
                      audioPlayer!.pause();
                    }
                    issongplaying = !issongplaying;
                  },
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Icon(issongplaying ? Icons.pause : Icons.play_arrow),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                  onTap: () => forwardAudio(),
                  child: const Icon(Icons.fast_forward)),
            ),
          ],
        ),
      ),
    );
  }

  Widget setMusicInfo() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            widget.title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: "Campton_Light",
              fontSize: 20.0,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4.0),
          const Text(
            "Darshan Raval",
            style: TextStyle(
              fontFamily: "Campton_Light",
              color: Color(0xFFC82623),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget setProgress() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Slider(
          min: 0,
          max: duration.inSeconds.toDouble(),
          value: position.inSeconds.toDouble(),
          onChanged: (double value) {
            audioPlayer!.seek(Duration(seconds: value.toInt()));
            setState(() {});
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              formatTime(position),
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12.0,
              ),
            ),
            Text(
              formatTime(duration - position),
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12.0,
              ),
            ),
          ],
        )
      ],
    );
  }

  void rewindAudio() async {
    Duration? currentPosition = await audioPlayer!.getCurrentPosition();
    int newPosition = (currentPosition?.inMilliseconds ?? 0) -
        const Duration(seconds: 10).inMilliseconds;

    if (newPosition < 0) {
      newPosition = 0;
    }

    await audioPlayer!.seek(Duration(milliseconds: newPosition));
  }

  void forwardAudio() async {
    Duration? currentPosition = await audioPlayer!.getCurrentPosition();
    int newPosition = (currentPosition?.inMilliseconds ?? 0) +
        const Duration(seconds: 10).inMilliseconds;

    if (newPosition < 0) {
      newPosition = 0;
    }

    await audioPlayer!.seek(Duration(milliseconds: newPosition));
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return [if (duration.inHours > 0) hours, minutes, seconds].join(':');
  }
}
