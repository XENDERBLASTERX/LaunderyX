import 'package:flutter/material.dart';
import 'quantity_selection_page.dart'; // Import the quantity selection page

class PickupAndDeliveryPage extends StatefulWidget {
  @override
  _PickupAndDeliveryPageState createState() => _PickupAndDeliveryPageState();
}

class _PickupAndDeliveryPageState extends State<PickupAndDeliveryPage> {
  DateTime _pickupDate = DateTime.now();
  DateTime _deliveryDate = DateTime.now();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _instructionsController = TextEditingController();
  int _totalCost = 0;

  void _selectPickupDate() async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: _pickupDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (selectedDate != null && selectedDate != _pickupDate) {
      setState(() {
        _pickupDate = selectedDate;
      });
    }
  }

  void _selectDeliveryDate() async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: _deliveryDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (selectedDate != null && selectedDate != _deliveryDate) {
      setState(() {
        _deliveryDate = selectedDate;
      });
    }
  }

  void _calculateCost() {
    // Example cost calculation based on quantity
    setState(() {
      _totalCost =
          100; // Example cost; you can calculate based on selected quantities
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pickup and Delivery'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        QuantitySelectionPage(service: 'Pickup and Delivery'),
                  ),
                );
              },
              child: Text('Select Quantities'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            Text('Pickup Date:',
                style: Theme.of(context).textTheme.titleMedium),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _selectPickupDate,
              child: Text('${_pickupDate.toLocal()}'.split(' ')[0]),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            Text('Delivery Date:',
                style: Theme.of(context).textTheme.titleMedium),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _selectDeliveryDate,
              child: Text('${_deliveryDate.toLocal()}'.split(' ')[0]),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(
                labelText: 'Delivery Address',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _instructionsController,
              decoration: InputDecoration(
                labelText: 'Special Instructions',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _calculateCost();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Cost: \$$_totalCost')),
                );
              },
              child: Text('Calculate Cost'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle submission or payment
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Pickup and Delivery scheduled!')),
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
}
