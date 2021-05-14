import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/data/data.dart';
import 'package:flutter_spotify_ui/widgets/playlist_header.dart';

class PlayListScreen extends StatefulWidget {
  final Playlist playlist;
  const PlayListScreen({
    Key? key,
    required this.playlist,
  }) : super(key: key);

  @override
  _PlayListScreenState createState() => _PlayListScreenState();
}

class _PlayListScreenState extends State<PlayListScreen> {
  ScrollController? _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // true - body goes under appbar
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 140,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                customBorder: const CircleBorder(),
                onDoubleTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      color: Colors.black26, shape: BoxShape.circle),
                  child: const Icon(Icons.chevron_left, size: 28),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              InkWell(
                customBorder: const CircleBorder(),
                onDoubleTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      color: Colors.black26, shape: BoxShape.circle),
                  child: const Icon(Icons.chevron_right, size: 28),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton.icon(
              style: TextButton.styleFrom(
                  primary: Theme.of(context).iconTheme.color),
              onPressed: () {},
              icon: const Icon(
                Icons.account_circle_outlined,
                size: 30,
              ),
              label: const Text("Maverick")),
          SizedBox(
            width: 8,
          ),
          IconButton(
              padding: const EdgeInsets.only(),
              icon: Icon(Icons.keyboard_arrow_down),
              onPressed: () {})
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [
              0,
              0.3
            ],
                colors: [
              const Color(0xffAF1018),
              Theme.of(context).backgroundColor
            ])),
        child: Scrollbar(
            controller: _scrollController,
            isAlwaysShown: true,
            child: ListView(
              controller: _scrollController,
              children: [PlayListHeader(playList: widget.playlist)],
            )),
      ),
    );
  }
}
