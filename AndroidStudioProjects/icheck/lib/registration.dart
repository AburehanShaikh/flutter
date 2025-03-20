import 'package:flutter/material.dart';
import 'otp.dart'; // Import OtpVerificationPage

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  String? _selectedRole; // Variable to hold the selected role

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registration')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(decoration: InputDecoration(labelText: 'Name')),
              SizedBox(height: 10),
              TextField(decoration: InputDecoration(labelText: 'Email')),
              SizedBox(height: 10),
              Row(
                children: [
                  Text('Role: '),
                  Radio<String>(
                    value: 'Painter',
                    groupValue: _selectedRole,
                    onChanged: (value) {
                      setState(() {
                        _selectedRole = value; // Update the selected role
                      });
                    },
                  ),
                  Text('Painter'),
                  Radio<String>(
                    value: 'Supplier',
                    groupValue: _selectedRole,
                    onChanged: (value) {
                      setState(() {
                        _selectedRole = value; // Update the selected role
                      });
                    },
                  ),
                  Text('Supplier'),
                ],
              ),
              SizedBox(height: 10),
              TextField(decoration: InputDecoration(labelText: 'PAN Number')),
              SizedBox(height: 10),
              TextField(decoration: InputDecoration(labelText: 'City')),
              SizedBox(height: 10),
              TextField(decoration: InputDecoration(labelText: 'State')),
              SizedBox(height: 10),
              TextField(decoration: InputDecoration(labelText: 'Contact Number')),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Add registration logic here
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OtpVerificationPage()),
                  );
                },
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}