import 'package:flutter/material.dart';
import 'package:image_pixels/image_pixels.dart';
import 'package:page_flip/page_flip.dart';

class ReadStoryScreen extends StatefulWidget {
  const ReadStoryScreen(
      {super.key, required this.imagePath, required this.title});

  final String imagePath;
  final String title;

  @override
  State<ReadStoryScreen> createState() => _ReadStoryScreenState();
}

class _ReadStoryScreenState extends State<ReadStoryScreen> {
  final _controller = GlobalKey<PageFlipWidgetState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: MediaQuery.of(context).size.height * 0.33,
              collapsedHeight: MediaQuery.of(context).size.height * 0.1,
              pinned: true,
              elevation: 5,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 30,
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                title: Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                background: Hero(
                  tag: widget.title,
                  child: Image.asset(
                    widget.imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  ImagePixels(
                    imageProvider: AssetImage(widget.imagePath),
                    builder: (context, img) {
                      Color backgroundColor =
                          img.pixelColorAtAlignment!(Alignment.bottomCenter);
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: backgroundColor,
                          gradient: LinearGradient(
                            stops: const [0.0, 0.3, 0.5, 0.7, 0.9, 1.0],
                            colors: [
                              backgroundColor,
                              backgroundColor.withOpacity(0.75),
                              backgroundColor.withOpacity(0.5),
                              backgroundColor.withOpacity(0.25),
                              backgroundColor.withOpacity(0.1),
                              backgroundColor.withOpacity(0.0),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: PageFlipWidget(
                      key: _controller,
                      backgroundColor: Colors.white,
                      lastPage: Container(
                          color: Colors.white,
                          child: const Center(child: Text('Last Page!'))),
                      children: <Widget>[
                        for (var i = 0; i < 10; i++)
                          Chapter1(chapter: i, title: widget.title),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Chapter1 extends StatefulWidget {
  const Chapter1({
    super.key,
    required this.chapter,
    required this.title,
  });
  final int chapter;
  final String title;

  @override
  State<Chapter1> createState() => _Chapter1State();
}

class _Chapter1State extends State<Chapter1> {
  @override
  Widget build(BuildContext context) {
    return
        // widget.page % 2 == 0
        //     ? Scaffold(
        //         body: SafeArea(
        //           bottom: false,
        //           child: Image.network('https://picsum.photos/45${widget.page}'),
        //         ),
        //       )
        //     :
        Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: Column(
              children: <Widget>[
                Text(
                  "Chapter ${widget.chapter + 1}",
                  style: const TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      '''Elmer Elevator, when he was a kid. He and his mother Dela owned a candy shop in a small town, but were soon forced to close down and move away when the people of the town moved away. They move to a faraway city where they plan to open a new shop, but they eventually lose all the money they save up while getting by''',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Droid Sans',
                      ),
                    )),
                  ],
                ),
                const SizedBox(
                  height: 16.0,
                ),
                const Text(
                  '''Elmer soon befriends a cat and eventually gets the idea to panhandle the money needed for the store, only for his mother to tell him that it is a lost cause. Angered, Elmer runs to the docks to be alone. The Cat comes to him and begins speaking to him, much to his shock. She tells him that on an island, Wild Island, beyond the city lies a dragon that can probably help him. Elmer takes the task and is transported to the island thanks to a bubbly whale named Soda. Once they make it to Wild Island, Soda explains that a gorilla named Saiwa is using the dragon to keep the island from sinking, but it remains ineffective.
          
          Elmer frees the dragon, a goofball named Boris, and they go on an adventure to find a tortoise named Aratuah in order to find out how Boris can keep the island from sinking for the next century since his kind has been doing that forever and he will be an "After Dragon", but he can't fly due to his wing being broken after Elmer saves him''',
                  style: TextStyle(
                    fontFamily: 'Droid Sans',
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
