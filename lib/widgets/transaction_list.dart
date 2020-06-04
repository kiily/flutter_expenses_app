import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  TransactionList(this.userTransactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: userTransactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No transactions yet',
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                  height: 200,
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: FittedBox(
                          child: Text('\$${userTransactions[index].amount}'),
                        ),
                      ),
                    ),
                    title: Text(
                      userTransactions[index].title,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(userTransactions[index].date),
                    ),
                  ),
                );
                // return Card(
                //   child: Row(children: <Widget>[
                //     Container(
                //       padding: EdgeInsets.all(10),
                //       margin: EdgeInsets.symmetric(
                //         vertical: 10,
                //         horizontal: 15,
                //       ),
                //       decoration: BoxDecoration(
                //         border: Border.all(
                //           color: Theme.of(context).primaryColor,
                //           width: 2,
                //         ),
                //       ),
                //       child: Text(
                //         '\$${userTransactions[index].amount.toStringAsFixed(2)}',
                //         style: TextStyle(
                //           fontWeight: FontWeight.bold,
                //           fontSize: 20,
                //           color: Theme.of(context).primaryColor,
                //         ),
                //       ),
                //     ),
                //     Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: <Widget>[
                //         Text(
                //           userTransactions[index].title,
                //           style: Theme.of(context).textTheme.headline5,
                //         ),
                //         Text(
                //           DateFormat.yMMMd()
                //               .format(userTransactions[index].date),
                //           style: TextStyle(
                //             color: Colors.grey,
                //           ),
                //         )
                //       ],
                //     ),
                //   ]),
                // );
              },
              itemCount: userTransactions.length,
            ),
    );
  }
}
