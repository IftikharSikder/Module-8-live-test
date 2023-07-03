import 'package:flutter/material.dart';

void main() {
  runApp(ContactListApp());
}

class Contact {
  final String name;
  final String email;
  final String phoneNumber;

  Contact({required this.name, required this.email, required this.phoneNumber});
}

class ContactListApp extends StatelessWidget {
  final List<Contact> contacts = [
    Contact(name: "Kamal Sikder", email: "kamal1975@gmail.com", phoneNumber: "01711360128"),
    Contact(name: "Ifti Sikder", email: "mesikder111@gmail.com", phoneNumber: "01712907430"),
    Contact(name: "Nobin Sikder", email: "nobin490@gmail.com", phoneNumber: "01712907430"),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Contact List"),
        ),
        body: ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(contacts[index].name),
              subtitle: Text(contacts[index].email),
              onTap: () => _showContactDetails(context, contacts[index]),
            );
          },
        ),
      ),
    );
  }

  void _showContactDetails(BuildContext context, Contact contact) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () {
            // Dismiss the bottom sheet when tapped on it
            Navigator.of(context).pop();
          },
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  contact.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text("Email: ${contact.email}"),
                SizedBox(height: 4),
                Text("Phone: ${contact.phoneNumber}"),
              ],
            ),
          ),
        );
      },
    );
  }
}
