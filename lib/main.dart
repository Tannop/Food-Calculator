import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Food Store Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final Map<String, int> orders = {
    "Red": 0,
    "Green": 0,
    "Blue": 0,
    "Yellow": 0,
    "Pink": 0,
    "Purple": 0,
    "Orange": 0
  };

  bool isMember = false;

  double calculateTotalPrice() {
    double total = 0;
    for (var item in orders.keys) {
      switch (item) {
        case "Red":
        case "Yellow":
          total += (orders[item] ?? 0) * 50;
          break;
        case "Green":
        case "Blue":
          total += (orders[item] ?? 0) * 40;
          break;
        case "Pink":
          total += (orders[item] ?? 0) * 80;
          break;
        case "Purple":
          total += (orders[item] ?? 0) * 90;
          break;
        case "Orange":
          total += (orders[item] ?? 0) * 120;
          break;
      }
    }
    //  discount if a member
    if (isMember) {
      total *= 0.9; // 10% discount
    }
    //  discount for Orange, Pink, or Green sets if quantity is more than 2
    if (orders["Orange"]! >= 2 ||
        orders["Pink"]! >= 2 ||
        orders["Green"]! >= 2) {
      total *= 0.95; // 5% discount
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Store Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Menu',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              for (var item in orders.keys)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey)),
                    ),
                    child: Row(
                      children: [
                        Expanded(child: Text(item)),
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () {
                            setState(() {
                              if ((orders[item] ?? 0) > 0) {
                                orders[item] = (orders[item] ?? 0) - 1;
                              }
                            });
                          },
                        ),
                        Text('${orders[item]}'),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              orders[item] = (orders[item] ?? 0) + 1;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              const SizedBox(height: 20),
              CheckboxListTile(
                title: const Text('Member Card'),
                value: isMember,
                onChanged: (value) {
                  setState(() {
                    isMember = value!;
                  });
                },
              ),
              const SizedBox(height: 20),
              Text(
                'Total Price: ${calculateTotalPrice()} THB',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
