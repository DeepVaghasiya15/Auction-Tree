import 'package:flutter/material.dart';
import 'dart:math'; // Add this import

class EmiCalculatorCard extends StatefulWidget {
  const EmiCalculatorCard({super.key});

  @override
  State<EmiCalculatorCard> createState() => _EmiCalculatorCardState();
}

class _EmiCalculatorCardState extends State<EmiCalculatorCard> {
  final _formKey = GlobalKey<FormState>();
  final _loanAmountController = TextEditingController();
  final _interestRateController = TextEditingController();
  final _loanTenureController = TextEditingController();

  double _emi = 0;
  double _totalInterestPayable = 0;
  double _totalPayment = 0;

  void _calculateEMI() {
    final double loanAmount = double.tryParse(_loanAmountController.text) ?? 0;
    final double interestRate = double.tryParse(_interestRateController.text) ?? 0;
    final int loanTenure = int.tryParse(_loanTenureController.text) ?? 0;

    final double monthlyInterestRate = interestRate / (12 * 100);
    final int loanTenureMonths = loanTenure;

    if (loanAmount > 0 && interestRate > 0 && loanTenureMonths > 0) {
      final double emi = (loanAmount * monthlyInterestRate *
          pow(1 + monthlyInterestRate, loanTenureMonths)) /
          (pow(1 + monthlyInterestRate, loanTenureMonths) - 1);
      final double totalPayment = emi * loanTenureMonths;
      final double totalInterestPayable = totalPayment - loanAmount;

      setState(() {
        _emi = emi;
        _totalInterestPayable = totalInterestPayable;
        _totalPayment = totalPayment;
      });
    } else {
      setState(() {
        _emi = 0;
        _totalInterestPayable = 0;
        _totalPayment = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Text(
                'EMI Calculator',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _loanAmountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Loan Amount (In USD)',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter loan amount';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _interestRateController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Interest Rate',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter interest rate';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _loanTenureController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Loan Tenure In Month',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter loan tenure';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _calculateEMI();
                  }
                },
                child: const Text('Calculate'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFCA996E),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildResultCell('Loan EMI', _emi.toStringAsFixed(2)),
                  _buildResultCell('Total Interest Payable', _totalInterestPayable.toStringAsFixed(2)),
                ],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildResultCell('Total Payment', _totalPayment.toStringAsFixed(2)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildResultCell(String title, String value) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

