import './widgets/new_transaction.dart';
import './models/transaction.dart';
import './widgets/user_transactions.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  // String titleInput;
  // String amountInput;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<Transaction> _userTransactions = [
    Transaction(id: 't1', title: 'New Shoes', amount: 69.99, date: DateTime.now()),
    Transaction(id: 't2', title: 'Weekly grocies', amount: 16.01, date: DateTime.now())
  ];


  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      id: DateTime.now().toString(), 
      title: txTitle, 
      amount: txAmount, 
      date: DateTime.now()
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(context: ctx, builder: (_) {
      return NewTransaction();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Expense App'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 60,
              child: Card(
                color: Colors.red,
                elevation: 5,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                  'Charts',
                  style: TextStyle(color: Colors.white),
                  )
                )
              ),
            ),
            UserTransactions()
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(
          Icons.add),
          onPressed: () {},
        )
    );
  }
}