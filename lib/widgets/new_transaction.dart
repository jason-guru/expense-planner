import 'package:flutter/material.dart';
import '../models/transaction.dart';

class NewTransaction extends StatelessWidget {
  final Function newTransaction;

  NewTransaction(this.newTransaction);

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if(enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    this.newTransaction(enteredTitle, enteredAmount);
  }

  @override
  Widget build(BuildContext context) {
  return 
    Card(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: 'Title'),
                  controller: titleController,
                  onSubmitted: (_) => submitData(),
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Amount'),
                  // onChanged: (value) {
                  //   amountInput = value;
                  // },
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  onSubmitted: (_) => submitData(),
                ),
                FlatButton(
                    onPressed: submitData, 
                    child: Text('Add Transactions', style: TextStyle(color: Colors.purple),
                  ),
                )
              ],
            )
          )
        );
    }
}