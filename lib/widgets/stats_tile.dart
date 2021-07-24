import 'package:flutter/material.dart';

class StatsTile extends StatelessWidget {
  final String leading;
  final int trailing;

  const StatsTile({
    @required this.leading,
    @required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Text(
            leading ?? '',
            style: Theme.of(context).textTheme.bodyText2,
          ),
          trailing: Text(
            trailing.toString() == 'null' ? '0' : trailing.toString(),
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ),
        Divider(thickness: 1, color: Colors.grey),
      ],
    );
  }
}
