import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductInfo {
  final String name;
  final int price;

  ProductInfo(this.name, this.price);
}

final products = [
  ProductInfo('Wireless mouse', 3),
  ProductInfo('Keyboard', 5),
  ProductInfo('Camera', 8),
  ProductInfo('Speaker', 4),
  ProductInfo('Ipad', 1000),
];

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentProductIndex = 0;
  int? _InputtedPrice;
  String _result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 80)),
            Text(products[_currentProductIndex].name),
            Padding(padding: EdgeInsets.only(top: 60)),
            SizedBox(
              width: 200,
              child: TextField(
                key: Key('priceInput'),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (value) {
                  _InputtedPrice = int.tryParse(value);
                },
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 40)),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _result =
                      _InputtedPrice == products[_currentProductIndex].price
                          ? 'pass'
                          : 'fail';
                });
              },
              child: const Text('Check'),
            ),
            Visibility(
              visible: _result.isNotEmpty,
              child: Text(_result, key: const Key('result')),
            ),
            Visibility(
              visible: _result.isNotEmpty,
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _result = '';
                      if (_currentProductIndex < 4) {
                        _currentProductIndex++;
                      }
                    });
                  },
                  child: Text('Next')),
            ),
          ],
        ),
      ),
    );
  }
}
