import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:banap/base_scaffold.dart';

class MoneyExchangeRate extends StatefulWidget {
  const MoneyExchangeRate({super.key});

  @override
  State<MoneyExchangeRate> createState() => _MoneyExchangeRateState();
}

class _MoneyExchangeRateState extends State<MoneyExchangeRate> {
  double? exchangeRate;
  bool isLoading = true;
  String errorMessage = '';
  double? usdAmount;
  double? nepaliAmount;

  @override
  void initState() {
    super.initState();
    _fetchExchangeRate();
  }

  Future<void> _fetchExchangeRate() async {
    try {
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
                : SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Add an image above the exchange rate box
                        Image.asset(
                          'assets/money.jpg', // Replace with your image path
                          height: 300,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 20),

                        // Money Exchange Rate Box
                        Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            '1 USD = ${exchangeRate?.toStringAsFixed(2)} NPR',
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Input Field for USD Amount
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'Enter USD Amount',
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (value) {
                              setState(() {
                                usdAmount = double.tryParse(value);
                                if (usdAmount != null && exchangeRate != null) {
                                  nepaliAmount = usdAmount! * exchangeRate!;
                                } else {
                                  nepaliAmount = null;
                                }
                              });
                            },
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Result Box
                        if (nepaliAmount != null)
                          Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              '$usdAmount USD = ${nepaliAmount?.toStringAsFixed(2)} NPR',
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),
                      ],
                    ),
                  ),
      ),
    );
  }
}
