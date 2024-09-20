import 'package:flutter/material.dart';

class DateSelectionPage extends StatefulWidget {
  @override
  _DateSelectionPageState createState() => _DateSelectionPageState();
}

class _DateSelectionPageState extends State<DateSelectionPage> {
  DateTime _pickupDate = DateTime.now();
  DateTime _deliveryDate = DateTime.now().add(Duration(days: 1));
  final _pickupAddressController = TextEditingController();
  final _deliveryAddressController = TextEditingController();
  final _pickupCityController = TextEditingController();
  final _deliveryCityController = TextEditingController();
  final _pickupLandmarkController = TextEditingController();
  final _deliveryLandmarkController = TextEditingController();

  Future<void> _selectDate(BuildContext context, bool isPickupDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isPickupDate ? _pickupDate : _deliveryDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        if (isPickupDate) {
          _pickupDate = picked;
        } else {
          _deliveryDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Dates and Address'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Please select the pickup and delivery dates and provide addresses:',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 20),
            ListTile(
              title: Text(
                'Pickup Date: ${_pickupDate.toLocal()}'.split(' ')[0],
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              trailing: Icon(Icons.calendar_today),
              onTap: () => _selectDate(context, true),
            ),
            ListTile(
              title: Text(
                'Delivery Date: ${_deliveryDate.toLocal()}'.split(' ')[0],
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              trailing: Icon(Icons.calendar_today),
              onTap: () => _selectDate(context, false),
            ),
            SizedBox(height: 20),
            Text('Pickup Address:',
                style: Theme.of(context).textTheme.titleMedium),
            TextField(
              controller: _pickupAddressController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Address Line 1',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _pickupCityController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'City',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _pickupLandmarkController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Landmark (Optional)',
              ),
            ),
            SizedBox(height: 20),
            Text('Delivery Address:',
                style: Theme.of(context).textTheme.titleMedium),
            TextField(
              controller: _deliveryAddressController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Address Line 1',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _deliveryCityController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'City',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _deliveryLandmarkController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Landmark (Optional)',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle the submission of selected dates and addresses
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Dates and Addresses Submitted')),
                );
                // Navigate to another page or perform further actions
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
