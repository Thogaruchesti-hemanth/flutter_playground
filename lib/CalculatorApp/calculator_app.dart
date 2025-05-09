import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:profile_page/CalculatorApp/unit_converter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String _expression = '';
  String _result = "0";
  List<String> _history = [];
  bool _isDarkMode = false;
  String _selectedMenu = 'calculator';

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  void _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkMode = prefs.getBool('darkMode') ?? false;
      _history = prefs.getStringList('history') ?? [];
    });
  }

  void _savePreferences() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('darkMode', _isDarkMode);
    prefs.setStringList('history', _history);
  }

  void _buttonPressed(String text) {
    setState(() {
      if (text == "C") {
        _expression = '';
        _result = '0';
      } else if (text == "=") {
        _evaluate();
      } else if (text == "Unit") {
        _openUnitConverter();
      } else {
        _expression += text;
      }
    });
  }

  void _evaluate() {
    try {
      String expression = _expression;

      expression = expression.replaceAllMapped(RegExp(r'sin\(([^)]+)\)'), (
        match,
      ) {
        double val = double.parse(match[1]!);
        return math.sin(_degToRad(val)).toString();
      });
      expression = expression.replaceAllMapped(RegExp(r'cos\(([^)]+)\)'), (
        match,
      ) {
        double val = double.parse(match[1]!);
        return math.cos(_degToRad(val)).toString();
      });
      expression = expression.replaceAllMapped(RegExp(r'tan\(([^)]+)\)'), (
        match,
      ) {
        double val = double.parse(match[1]!);
        return math.tan(_degToRad(val)).toString();
      });

      expression = expression.replaceAll('√', 'sqrt');

      Parser p = Parser();
      Expression exp = p.parse(expression);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      String finalResult = eval.toString();

      setState(() {
        _history.insert(0, '$_expression = $finalResult');
        _result = finalResult;
        _expression = '';
      });
      _savePreferences();
    } catch (e) {
      setState(() {
        _result = 'Error';
      });
    }
  }

  double _degToRad(double deg) => deg * math.pi / 180;

  void _toggleDarkMode() {
    setState(() {
      _isDarkMode = !_isDarkMode;
      _savePreferences();
    });
  }

  void _openUnitConverter() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const UnitConverter()),
    );
  }

  ThemeData _buildTheme() => _isDarkMode ? ThemeData.dark() : ThemeData.light();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _buildTheme(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomInset: true,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: SafeArea(
            child: Container(
              color:
                  _isDarkMode
                      ? const Color(0xFF121212) // Matches dark gradient top
                      : const Color(0xFFF3F4F6), // Matches light gradient top
              child: ListTile(
                leading: IconButton(
                  onPressed: () {
                    _scaffoldKey.currentState?.openDrawer();
                  },
                  icon: Icon(
                    Icons.menu,
                    color: _isDarkMode ? Colors.white70 : Colors.black87,
                  ),
                ),
                trailing: IconButton(
                  tooltip: 'Toggle Theme',
                  onPressed: _toggleDarkMode,
                  icon: Icon(
                    _isDarkMode ? Icons.light_mode : Icons.dark_mode,
                    color: _isDarkMode ? Colors.white70 : Colors.black87,
                  ),
                ),
              ),
            ),
          ),
        ),
        drawer: Drawer(
          child: Container(
            decoration: BoxDecoration(
              color:
                  _isDarkMode
                      ? const Color(0xFF1F1F1F)
                      : const Color(0xFFF8FAFC),
            ),
            child: Column(
              children: [
                // Custom Header
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(16, 48, 16, 24),
                  decoration: BoxDecoration(
                    gradient:
                        _isDarkMode
                            ? const LinearGradient(
                              colors: [Color(0xFF0F172A), Color(0xFF1E293B)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            )
                            : const LinearGradient(
                              colors: [Color(0xFFEEF2FF), Color(0xFFE0E7FF)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                    boxShadow: [
                      BoxShadow(
                        color:
                            _isDarkMode
                                ? Colors.black.withOpacity(0.3)
                                : Colors.grey.withOpacity(0.15),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor:
                            _isDarkMode
                                ? Colors.white12
                                : Colors.indigo.shade100,
                        child: Icon(
                          Icons.calculate_rounded,
                          size: 28,
                          color: _isDarkMode ? Colors.white70 : Colors.indigo,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        'SmartCalc',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: _isDarkMode ? Colors.white : Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 8),

                // Navigation Section
                _buildDrawerTile(
                  icon: Icons.calculate,
                  title: 'Calculator',
                  isSelected: _selectedMenu == 'calculator',
                  onTap: () {
                    _scaffoldKey.currentState!.closeDrawer();
                    setState(() => _selectedMenu = 'calculator');
                  },
                ),
                _buildDrawerTile(
                  icon: Icons.swap_horiz_rounded,
                  title: 'Unit Converter',
                  isSelected: _selectedMenu == 'converter',
                  onTap: () {
                    _scaffoldKey.currentState!.closeDrawer();
                    setState(() => _selectedMenu = 'converter');
                  },
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  child: Divider(),
                ),

                // History Section
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 4,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'History',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: _isDarkMode ? Colors.white60 : Colors.black54,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child:
                      _history.isEmpty
                          ? Center(
                            child: Text(
                              'No history yet.',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color:
                                    _isDarkMode
                                        ? Colors.white54
                                        : Colors.black54,
                              ),
                            ),
                          )
                          : ListView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            itemCount: _history.length,
                            itemBuilder: (context, index) {
                              return Card(
                                color:
                                    _isDarkMode
                                        ? Colors.white10
                                        : Colors.grey.shade100,
                                margin: const EdgeInsets.symmetric(
                                  vertical: 4,
                                  horizontal: 8,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: ListTile(
                                  dense: true,
                                  leading: Icon(
                                    Icons.history,
                                    color:
                                        _isDarkMode
                                            ? Colors.white60
                                            : Colors.indigoAccent,
                                  ),
                                  title: Text(
                                    _history[index],
                                    style: TextStyle(
                                      fontSize: 14,
                                      color:
                                          _isDarkMode
                                              ? Colors.white70
                                              : Colors.black87,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                ),

                // Bottom Settings/About
              ],
            ),
          ),
        ),

        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: Container(
            decoration: BoxDecoration(
              gradient:
                  _isDarkMode
                      ? const LinearGradient(
                        colors: [Color(0xFF121212), Color(0xFF1F1F1F)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      )
                      : const LinearGradient(
                        colors: [Color(0xFFF3F4F6), Color(0xFFE2E8F0)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
            ),
            child: _buildSelectedBody(), // dynamically load body here
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isSelected = false,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      selected: isSelected,
      selectedTileColor:
          _isDarkMode
              ? Colors.white.withOpacity(0.05)
              : Colors.black.withOpacity(0.04),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      leading: Icon(icon, color: _isDarkMode ? Colors.white70 : Colors.black87),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
          color: _isDarkMode ? Colors.white70 : Colors.black87,
        ),
      ),
      onTap: onTap,
    );
  }

  Widget _buildSelectedBody() {
    switch (_selectedMenu) {
      case 'calculator':
        return Column(
          children: [
            Expanded(flex: 2, child: _buildDisplay()),
            const Divider(),
            Expanded(flex: 4, child: _buildButtons()),
          ],
        );
      case 'converter':
        return UnitConverter(); // Replace with your actual unit converter widget
      // Add more cases if needed for other sections
      default:
        return Center(
          child: Text(
            'Unknown menu selected',
            style: TextStyle(
              color: _isDarkMode ? Colors.white70 : Colors.black87,
            ),
          ),
        );
    }
  }

  Widget _buildDisplay() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            reverse: true,
            child: Text(
              _expression,
              style: TextStyle(
                fontSize: 24,
                color: _isDarkMode ? Colors.grey[400] : Colors.grey[700],
              ),
            ),
          ),
          const SizedBox(height: 8),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            reverse: true,
            child: Text(
              _result,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: _isDarkMode ? Colors.white : Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtons() {
    final buttonLabels = [
      ['C', '√', 'sin(', 'cos('],
      ['7', '8', '9', '/'],
      ['4', '5', '6', '*'],
      ['1', '2', '3', '-'],
      ['0', '.', '=', '+'],
    ];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children:
            buttonLabels.map((row) {
              return Expanded(
                child: Row(
                  children:
                      row.map((label) {
                        Color background;
                        Color textColor;

                        if (label == 'C' || label == '=') {
                          background = const Color(0xFF4A5568); // Slate gray
                          textColor = Colors.white;
                        } else if (['/', '*', '-', '+'].contains(label)) {
                          background = const Color(0xFFE0E0E0); // Neutral grey
                          textColor = const Color(0xFF0A0A0A);
                        } else if ([
                          'sin(',
                          'cos(',
                          'tan(',
                          '√',
                        ].contains(label)) {
                          background = const Color(
                            0xFFEDF1F7,
                          ); // Soft grey-blue
                          textColor = const Color(0xFF1C1C1E);
                        } else {
                          background = const Color(0xFFF7F7F7); // Off white
                          textColor = const Color(0xFF1C1C1E);
                        }

                        return _buildCalcButton(label);
                      }).toList(),
                ),
              );
            }).toList(),
      ),
    );
  }

  Widget _buildCalcButton(String label) {
    Color background;
    Color textColor;

    if (_isDarkMode) {
      // Dark Mode Colors
      if (label == 'C' || label == '=') {
        background = const Color(0xFF6B46C1); // Soft violet
        textColor = Colors.white;
      } else if (['/', '*', '-', '+'].contains(label)) {
        background = const Color(0xFF3A3A3A); // Medium dark
        textColor = Colors.white;
      } else if (['sin(', 'cos(', 'tan(', '√'].contains(label)) {
        background = const Color(0xFF2E2E2E); // Dark grey
        textColor = const Color(0xFFEEEEEE);
      } else if (label == 'Unit') {
        background = const Color(0xFF9575CD); // Lavender grey
        textColor = Colors.white;
      } else {
        background = const Color(0xFF1E1E1E); // Almost black
        textColor = Colors.white70;
      }
    } else {
      // Light Mode Colors (previously discussed)
      if (label == 'C' || label == '=') {
        background = const Color(0xFF4A5568);
        textColor = Colors.white;
      } else if (['/', '*', '-', '+'].contains(label)) {
        background = const Color(0xFFE0E0E0);
        textColor = const Color(0xFF0A0A0A);
      } else if (['sin(', 'cos(', 'tan(', '√'].contains(label)) {
        background = const Color(0xFFEDF1F7);
        textColor = const Color(0xFF1C1C1E);
      } else if (label == 'Unit') {
        background = const Color(0xFF6C63FF);
        textColor = Colors.white;
      } else {
        background = const Color(0xFFF7F7F7);
        textColor = const Color(0xFF1C1C1E);
      }
    }

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: InkWell(
          onTap: () => _buttonPressed(label),
          borderRadius: BorderRadius.circular(40),
          splashColor: Colors.black12,
          child: Container(
            height: double.infinity,
            decoration: BoxDecoration(
              color: background,
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 4,
                  offset: const Offset(1, 3),
                ),
              ],
            ),
            alignment: Alignment.center,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
