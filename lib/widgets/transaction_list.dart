import 'package:expense_app/models/transaction.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransactions;
  final Function _deleteTx;
  final Function _copyTx;

  TransactionList(this._userTransactions, this._deleteTx, this._copyTx);

  @override
  Widget build(BuildContext context) {
    return _userTransactions.length > 0
        ? ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                elevation: 5,
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: EdgeInsets.all(6),
                      child: FittedBox(
                          child: Text('\$${_userTransactions[index].amount}')),
                    ),
                  ),
                  title: Text('${_userTransactions[index].title}'),
                  subtitle: Text(
                    '${DateFormat.yMMMEd().format(_userTransactions[index].date)}',
                  ),
                  trailing: FittedBox(
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () =>
                              _copyTx(_userTransactions[index].ids),
                          icon: Icon(Icons.copy),
                          color: Colors.green.shade300,
                        ),
                        IconButton(
                          onPressed: () =>
                              _deleteTx(_userTransactions[index].ids),
                          icon: Icon(Icons.delete),
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            itemCount: _userTransactions.length,
            scrollDirection: Axis.vertical,
          )
        : Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.center,
            child: Text("No data avaiable."),
          );
  }
}
