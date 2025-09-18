import 'package:flutter/material.dart';
import 'package:smart_ahwa_manager/models/order.dart';
import 'package:smart_ahwa_manager/widgets/custom_button.dart';

import 'package:uuid/uuid.dart';

class AddOrderScreen extends StatefulWidget {
  const AddOrderScreen({super.key});

  @override
  State<AddOrderScreen> createState() => _AddOrderScreenState();
}

class _AddOrderScreenState extends State<AddOrderScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _notesCtrl = TextEditingController();
  DrinkKind? _selectedDrink;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _notesCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      final newOrder = Order(
        id: const Uuid().v4(),
        customer: _nameCtrl.text.trim(),
        drink: _selectedDrink!,
        note: _notesCtrl.text.trim(),
      );

      Navigator.pop(context, newOrder);
    }
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    String? hint,
    String? Function(String?)? validator,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          validator: validator,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: const Color(0xFFEADBC8),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Drink Type'),
        const SizedBox(height: 6),
        DropdownButtonFormField<DrinkKind>(
          value: _selectedDrink,
          hint: const Text('Select a drink'),
          items: DrinkKind.values
              .map(
                (drink) =>
                    DropdownMenuItem(value: drink, child: Text(drink.label)),
              )
              .toList(),
          onChanged: (v) => setState(() => _selectedDrink = v),
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFEADBC8),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
          validator: (v) => v == null ? 'Please select a drink' : null,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Order',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF6F4E37),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField(
                label: 'Customer Name',
                controller: _nameCtrl,
                hint: "Enter customer's name",
                validator: (v) =>
                    (v == null || v.isEmpty) ? 'Please enter a name' : null,
              ),
              const SizedBox(height: 16),
              _buildDropdown(),
              const SizedBox(height: 16),
              _buildTextField(
                label: 'Special Notes',
                controller: _notesCtrl,
                hint: 'Any special requests...',
                maxLines: 3,
              ),
              const Spacer(),
              CustomButton(text: 'Add Order', onPressed: _submit),
            ],
          ),
        ),
      ),
    );
  }
}
