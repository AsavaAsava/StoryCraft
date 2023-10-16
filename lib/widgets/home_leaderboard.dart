import 'package:flutter/material.dart';

class HomeScreenLeaderboard extends StatelessWidget {
  const HomeScreenLeaderboard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: const EdgeInsets.only(
            bottom: 8,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: index % 2 == 0
                ? Theme.of(context).primaryColor
                : Theme.of(context).colorScheme.secondary,
          ),
          child: ListTile(
            leading: Text(
              (index + 1).toString(),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
            title: Row(
              children: [
                CircleAvatar(
                  radius: 18,
                  // backgroundImage:
                  //     AssetImage('assets/images/profile.png'),
                  backgroundColor: Theme.of(context).colorScheme.tertiary,
                ),
                const SizedBox(width: 8),
                Text(
                  'User ${index + 1}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
              ],
            ),
            trailing: Text(
              '${index + 1} pts',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
          ),
        );
      },
      itemCount: 5,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}
