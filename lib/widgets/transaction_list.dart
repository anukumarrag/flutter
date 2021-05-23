import 'package:expense_app/models/transaction.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransactions;
  TransactionList(this._userTransactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      alignment: Alignment.topCenter,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            elevation: 10,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 2)),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    '\$ ${_userTransactions[index].amount.toStringAsFixed(2)}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                        fontSize: 18),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _userTransactions[index].title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 24),
                    ),
                    Text(
                      DateFormat.yMMMEd().format(_userTransactions[index].date),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontSize: 12,
                        fontFamily: 'KoHo-Light',
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
        itemCount: _userTransactions.length,
        scrollDirection: Axis.vertical,
      ),
    );
  }
}
