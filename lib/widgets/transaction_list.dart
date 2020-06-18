import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  final Function deleteTx;

  TransactionList(this.userTransactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return userTransactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
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
                    height: constraints.maxHeight * 0.6,
                  ),
                ],
              );
            },
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return TransactionItem(
                transaction: userTransactions[index],
                deleteTx: deleteTx,
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
          );
  }
}
