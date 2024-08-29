import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'dart:convert';

dynamic createPaymentIntent(String amount, String currency) async {
  try {

    //grabs payment amout and currency
    final body = {
      'amount': amount,
      'currency': currency,
    };

    // makes HTTP POST Request
    final response = await http.post(
      Uri.parse('http://10.0.2.2:5050/api/payment'),
      body: body,
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
    );

    //returns response
    return jsonDecode(response.body);
    
  } catch (err) {
    if (kDebugMode) {
      print(err);
    }
  }
}