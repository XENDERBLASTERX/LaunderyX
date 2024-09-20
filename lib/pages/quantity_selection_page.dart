import 'package:flutter/material.dart';
import 'date_selection_page.dart'; // Import the updated date selection page

class QuantitySelectionPage extends StatefulWidget {
  final String service;

  QuantitySelectionPage({required this.service});

  @override
  _QuantitySelectionPageState createState() => _QuantitySelectionPageState();
}

class _QuantitySelectionPageState extends State<QuantitySelectionPage> {
  int _shirts = 0;
  int _pants = 0;
  int _tshirts = 0;
  int _others = 0;

  void _incrementQuantity(String item) {
    setState(() {
      switch (item) {
        case 'Shirts':
          _shirts++;
          break;
        case 'Pants':
          _pants++;
          break;
        case 'T-Shirts':
          _tshirts++;
          break;
        case 'Others':
          _others++;
          break;
      }
    });
  }

  void _decrementQuantity(String item) {
    setState(() {
      switch (item) {
        case 'Shirts':
          if (_shirts > 0) _shirts--;
          break;
        case 'Pants':
          if (_pants > 0) _pants--;
          break;
        case 'T-Shirts':
          if (_tshirts > 0) _tshirts--;
          break;
        case 'Others':
          if (_others > 0) _others--;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Quantities for ${widget.service}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildQuantityWidget('Shirts', _shirts, Icons.checkroom),
            _buildQuantityWidget('Pants', _pants, Icons.dry_cleaning),
            _buildQuantityWidget('T-Shirts', _tshirts, Icons.check),
            _buildQuantityWidget('Others', _others, Icons.category),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the Date Selection Page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DateSelectionPage(),
                  ),
                );
              },
              child: Text('Submit'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuantityWidget(String item, int quantity, IconData icon) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        leading: Icon(icon, size: 40, color: Colors.blueAccent),
        title: Text(item, style: Theme.of(context).textTheme.titleMedium),
        subtitle: Text('Quantity: $quantity',
            style: Theme.of(context).textTheme.bodyMedium),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.remove_circle, color: Colors.red),
              onPressed: () => _decrementQuantity(item),
            ),
            IconButton(
              icon: Icon(Icons.add_circle, color: Colors.green),
              onPressed: () => _incrementQuantity(item),
            ),
          ],
        ),
      ),
    );
  }
}
