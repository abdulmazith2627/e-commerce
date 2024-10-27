import 'package:flutter/material.dart';

class Listofaccount extends StatefulWidget {
  const Listofaccount({super.key});

  @override
  State<Listofaccount> createState() => _ListofaccountState();
}

class _ListofaccountState extends State<Listofaccount> {
  List<dynamic> account = [
    [const Icon(Icons.person), 'personal information'],
    [const Icon(Icons.shopping_bag), ' My order'],
    [const Icon(Icons.home_filled), ' Saved Addresses'],
    [const Icon(Icons.notifications), ' Notification'],
    [const Icon(Icons.shopping_cart), ' cart'],
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: account.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: account[index][0],
            title: Text(
              account[index][1],
              style: Theme.of(context).textTheme.bodySmall,
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
          );
        });
  }
}
