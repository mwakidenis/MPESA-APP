import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MpesaApp());
}

class MpesaApp extends StatelessWidget {
  const MpesaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'M-Pesa STK Push',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.blue[100],
      ),
      home: const PaymentPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  bool isLoading = false;
  String message = '';

  Future<void> makePayment() async {
    String phone = phoneController.text.trim();
    String amount = amountController.text.trim();

    if (phone.isEmpty || amount.isEmpty) {
      setState(() {
        message = "Please enter both phone number and amount.";
      });
      return;
    }

    setState(() {
      isLoading = true;
      message = '';
    });

    try {
      // ✅ Use your computer’s LAN IP so Chrome can reach Node.js
      var url = Uri.parse("http://localhost:5000/stkpush");

      var response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"phone": phone, "amount": amount}),
      );

      // ✅ Print raw response for debugging
      print("Raw response: ${response.body}");

      dynamic data;

      try {
        // Try decoding JSON
        data = jsonDecode(response.body);
      } catch (e) {
        // If backend sent HTML (e.g., "Cannot GET /stkpush"), show readable error
        setState(() {
          message =
              "Backend returned non-JSON response:\n${response.body.substring(0, 100)}";
        });
        return;
      }

      if (response.statusCode == 200) {
        setState(() {
          message =
              data['CustomerMessage'] ?? "Payment request sent successfully!";
        });
      } else {
        setState(() {
          message = "Failed: ${data['error'] ?? 'Unknown error'}";
        });
      }
    } catch (e) {
      setState(() {
        message = "Error: $e";
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("M-Pesa Payment"),
        backgroundColor: Colors.green[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: "Phone Number (e.g. 0712345678)",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Amount (Ksh)",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[700],
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: isLoading ? null : makePayment,
              child: isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text(
                      "Pay with M-Pesa",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
            ),
            const SizedBox(height: 20),
            if (message.isNotEmpty)
              Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: message.toLowerCase().contains("success")
                      ? Colors.green
                      : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
