import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:banap/base_scaffold.dart';

class MoneyExchangeRate extends StatefulWidget {
  const MoneyExchangeRate({Key? key}) : super(key: key);

  @override
  State<MoneyExchangeRate> createState() => _MoneyExchangeRateState();
}

class _MoneyExchangeRateState extends State<MoneyExchangeRate> {
  double? exchangeRate;
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    _fetchExchangeRate();
  }

  Future<void> _fetchExchangeRate() async {
    try {
      // Free API (Use with caution in production, rate limiting may apply)
      final response = await http.get(Uri.parse(
          'https://api.exchangerate-api.com/v4/latest/USD')); // Base currency USD

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          exchangeRate = data['rates']['NPR'].toDouble(); // Get NPR rate
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
          errorMessage =
              'Failed to load exchange rate. Status code: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
        errorMessage = 'An error occurred: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'Money Exchange Rate',
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : errorMessage.isNotEmpty
                ? Text(errorMessage)
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '1 USD = ${exchangeRate?.toStringAsFixed(2)} NPR', // Display with 2 decimal places
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 20),
                      // Add an input field to convert a specific amount
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Enter USD Amount',
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              double usdAmount = double.tryParse(value) ?? 0;
                              double nepaliAmount =
                                  usdAmount * (exchangeRate ?? 0);
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                      "$usdAmount USD = ${nepaliAmount.toStringAsFixed(2)} NPR")));
                            }
                          },
                        ),
                      ),
                    ],
                  ),
      ),
    );
  }
}
