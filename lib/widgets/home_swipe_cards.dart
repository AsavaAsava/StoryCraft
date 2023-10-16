import 'package:flutter/material.dart';
import 'package:storycraft/screens/read_screen.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';

List<Widget> cardItems = [
  const CardView(
    imagePath: "assets/images/island_card.jpg",
    title: "Sam's Island",
    description: "Stuck on an island? Help Sam find his way home!",
  ),
  const CardView(
    imagePath: "assets/images/winter_card.jpg",
    title: "Winter Wonderland",
    description: "Princess Elsa needs your help to save Arendelle!",
  ),
  const CardView(
    imagePath: "assets/images/safari_card.jpg",
    title: "Simba's Safari",
    description: "Simba needs your help to become the king of the jungle!",
  ),
];

class HomeScreenSwipeCards extends StatefulWidget {
  const HomeScreenSwipeCards({
    super.key,
    required this.cardController,
    required this.cardItems,
  });

  final SwipeableCardSectionController cardController;
  final List<Widget> cardItems;

  @override
  State<HomeScreenSwipeCards> createState() => _HomeScreenSwipeCardsState();
}

class _HomeScreenSwipeCardsState extends State<HomeScreenSwipeCards> {
  @override
  Widget build(BuildContext context) {
    SwipeableCardSectionController cardController =
        SwipeableCardSectionController();
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: SwipeableCardsSection(
        context: context,
        cardController: cardController,
        items: widget.cardItems,
        // onCardSwiped: (index) {
        //   // if the last card is swiped, add the cards back to the list
        //   if (index == widget.cardItems.length - 1) {
        //     setState(() {
        //       cardItems= widget.cardItems;
        //     });
        //   }
        // },
      ),
    );
  }
}

class CardView extends StatelessWidget {
  const CardView(
      {super.key,
      required this.title,
      required this.imagePath,
      required this.description});

  final String imagePath;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ReadStoryScreen(
              imagePath: imagePath,
              title: title,
            ),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Hero(
                  tag: title,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.34,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0.05, 0.1, 0.2, 0.6],
                    colors: [
                      Colors.black.withOpacity(0.1),
                      Colors.black.withOpacity(0.25),
                      Colors.black.withOpacity(0.5),
                      Colors.black.withOpacity(0.9),
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Center(
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Center(
                        child: Text(
                          description,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
