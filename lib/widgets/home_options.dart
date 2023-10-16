import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


List options = [
      {
        'icon': FontAwesomeIcons.book,
        'text': 'Read',
      },
      {
        'icon': FontAwesomeIcons.book,
        'text': 'Read',
      },
      {
        'icon': FontAwesomeIcons.book,
        'text': 'Read',
      }
    ];

class HomeOptions extends StatelessWidget {
  const HomeOptions({
    super.key,
    required this.options,
  });

  final List options;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.13,
      child: ListView.custom(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        childrenDelegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Theme.of(context).primaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FaIcon(options[index]['icon']).icon,
                        size: 30,
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        options[index]['text'],
                        style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).colorScheme.tertiary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          childCount: options.length,
        ),
      ),
    );
  }
}