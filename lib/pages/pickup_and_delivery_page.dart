import 'package:flutter/material.dart';
import 'quantity_selection_page.dart'; // Import the quantity selection page

class PickupAndDeliveryPage extends StatefulWidget {
  @override
  _PickupAndDeliveryPageState createState() => _PickupAndDeliveryPageState();
}

class _PickupAndDeliveryPageState extends State<PickupAndDeliveryPage> {
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
            Text('Pickup and Delivery details will be here.',
                style: Theme.of(context).textTheme.bodyMedium),
            // Add additional widgets as needed
          ],
        ),
      ),
    );
  }
}
