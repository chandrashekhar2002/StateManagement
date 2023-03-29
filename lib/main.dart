// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => increment(),
    ),
    ChangeNotifierProvider(
      create: (context) => decrement(),
    ),
  ], child: MyApp()));
}

class increment with ChangeNotifier {
  int count = 0;

  void inc() {
    count++;
    notifyListeners();
  }
}

class decrement with ChangeNotifier {
  int count1 = 0;

  void dec() {
    count1--;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firstcount = Provider.of<increment>(context, listen: false);
    final seccount = Provider.of<decrement>(context, listen: false);
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("The Incremented value  : "),
            Consumer<increment>(
              builder: (context, value, child) {
                return Text(
                  "${firstcount.count}",
                  style: Theme.of(context).textTheme.headlineMedium,
                  textDirection: TextDirection.ltr,
                );
              },
            ),
            ElevatedButton(
                onPressed: () {
                  var cc = context.read<increment>();
                  cc.inc();
                },
                child: Text("Increment the value..")),
            SizedBox(height: 30),
            Text("The Decremented value  : "),
            Consumer<decrement>(
              builder: (context, value, child) {
                return Text(
                  "${seccount.count1}",
                  style: Theme.of(context).textTheme.headlineMedium,
                  textDirection: TextDirection.ltr,
                );
              },
            ),
            ElevatedButton(
                onPressed: () {
                  var cc1 = context.read<decrement>();
                  cc1.dec();
                },
                child: Text("Decrement the value..")),
          ],
        ),
      ),
    );
  }
}
