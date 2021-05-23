import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function _addNewTransaction;
  NewTransaction(this._addNewTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitData() {
    final titleText = titleController.text;
    final amount = double.parse(amountController.text);
    if (titleText.isEmpty || amount <= 0) {
      return;
    }

    widget._addNewTransaction(titleText, amount);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Title',
              )),
          TextField(
            controller: amountController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Amount'),
          ),
          FlatButton(
            focusColor: Colors.grey,
            onPressed: submitData,
            child: Text('Add transaction'),
            textColor: Colors.blueAccent,
          )
        ],
      ),
    );
  }
}
