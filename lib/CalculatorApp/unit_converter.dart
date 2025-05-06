import 'package:flutter/material.dart';

class UnitConverter extends StatefulWidget {
  const UnitConverter({super.key});

  @override
  State<UnitConverter> createState() => _UnitConverterState();
}

class _UnitConverterState extends State<UnitConverter> {
  String _selectedCategory = 'Length';
  String _fromUnit = 'Meter';
  String _toUnit = 'Kilometer';
  double _inputValue = 0;
  String _convertedResult = '';

  final Map<String, List<String>> _units = {
    'Length': ['Meter', 'Kilometer', 'Centimeter'],
    'Weight': ['Gram', 'Kilogram', 'Pound'],
    'Temperature': ['Celsius', 'Fahrenheit', 'Kelvin'],
  };

  void _convert() {
    double result = 0;

    switch (_selectedCategory) {
      case 'Length':
        result = _convertLength(_inputValue, _fromUnit, _toUnit);
        break;
      case 'Weight':
        result = _convertWeight(_inputValue, _fromUnit, _toUnit);
        break;
      case 'Temperature':
        result = _convertTemperature(_inputValue, _fromUnit, _toUnit);
        break;
    }
    setState(() {
      _convertedResult = result.toStringAsFixed(2);
    });
  }

  double _convertLength(double value, String from, String to) {
    const meter = {'Meter': 1, 'Kilometer': 1000, 'Centimeter': 0.01};
    return value * (meter[from]! / meter[to]!);
  }

  double _convertWeight(double value, String from, String to) {
    const gram = {'Gram': 1, 'Kilogram': 1000, 'Pound': 453.592};
    return value * (gram[from]! / gram[to]!);
  }

  double _convertTemperature(double value, String from, String to) {
    if (from == to) return value;

    if (from == 'Celsius') {
      if (to == 'Fahrenheit') return (value * 9 / 5) + 32;
      if (to == 'Kelvin') return value + 273.15;
    } else if (from == 'Fahrenheit') {
      if (to == 'Celsius') return (value - 32) * 5 / 9;
      if (to == 'Kelvin') return (value + 459.67) * 5 / 9;
    } else if (from == 'Kelvin') {
      if (to == 'Celsius') return value - 273.15;
      if (to == 'Fahrenheit') return (value * 9 / 5) - 459.67;
    }

    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final categoryUnits = _units[_selectedCategory]!;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            _buildSectionTitle('Choose Category'),
            _buildDropdown(
              value: _selectedCategory,
              items: _units.keys.toList(),
              onChanged: (val) {
                setState(() {
                  _selectedCategory = val!;
                  _fromUnit = _units[_selectedCategory]!.first;
                  _toUnit = _units[_selectedCategory]!.last;
                  _convertedResult = '';
                });
              },
            ),
            const SizedBox(height: 20),
            _buildSectionTitle('Convert From'),
            _buildDropdown(
              value: _fromUnit,
              items: categoryUnits,
              onChanged: (val) => setState(() => _fromUnit = val!),
            ),
            const SizedBox(height: 20),
            _buildSectionTitle('Convert To'),
            _buildDropdown(
              value: _toUnit,
              items: categoryUnits,
              onChanged: (val) => setState(() => _toUnit = val!),
            ),
            const SizedBox(height: 30),
            _buildSectionTitle('Enter Value'),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Type a value to convert',
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (val) => _inputValue = double.tryParse(val) ?? 0,
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              icon: const Icon(Icons.sync_alt_rounded, size: 22),
              label: const Text(
                'Convert Now',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              onPressed: _convert,
            ),
            const SizedBox(height: 30),
            if (_convertedResult.isNotEmpty)
              _buildResultCard(
                title: 'Converted Result',
                value: _convertedResult,
                from: _fromUnit,
                to: _toUnit,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          icon: const Icon(Icons.arrow_drop_down),
          onChanged: onChanged,
          items:
              items
                  .map(
                    (item) => DropdownMenuItem(
                      value: item,
                      child: Text(item, style: const TextStyle(fontSize: 16)),
                    ),
                  )
                  .toList(),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildResultCard({
    required String title,
    required String value,
    required String from,
    required String to,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.greenAccent.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '$value $to',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          Text(
            'From: $from → To: $to',
            style: const TextStyle(fontSize: 14, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
