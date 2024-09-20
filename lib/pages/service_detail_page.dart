import 'package:flutter/material.dart';
import 'quantity_selection_page.dart'; // Import the quantity selection page
import 'empty_page.dart'; // Import the empty page

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Laundry Service'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Welcome to Laundry Service!',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 20),
            Text(
              'Our Services',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ServiceCard(
                    title: 'Wash',
                    description: 'Your clothes to be washed.',
                    icon: Icons.local_laundry_service,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              QuantitySelectionPage(service: 'Wash'),
                        ),
                      );
                    },
                  ),
                  ServiceCard(
                    title: 'Wash and Iron',
                    description: 'Your clothes washed and ironed neatly.',
                    icon: Icons.local_laundry_service,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              QuantitySelectionPage(service: 'Wash and Iron'),
                        ),
                      );
                    },
                  ),
                  ServiceCard(
                    title: 'Dry Cleaning',
                    description:
                        'Professional dry cleaning for delicate items.',
                    icon: Icons.cleaning_services,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              QuantitySelectionPage(service: 'Dry Cleaning'),
                        ),
                      );
                    },
                  ),
                  ServiceCard(
                    title: 'Pickup and Delivery',
                    description: 'Convenient pickup and delivery service.',
                    icon: Icons.delivery_dining,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EmptyPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final VoidCallback onTap;

  ServiceCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, size: 40, color: Colors.blue),
        title: Text(title, style: Theme.of(context).textTheme.titleMedium),
        subtitle: Text(description),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}
