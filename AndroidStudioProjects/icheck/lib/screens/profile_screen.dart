import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // For camera and gallery access
import 'dart:io'; // For File class

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Controllers for editable fields
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _userIdController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _panNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  // Variable to store the selected profile image
  File? _profileImage;

  // ImagePicker instance
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    // Initialize controllers with default values (replace with actual user data)
    _fullNameController.text = 'John Doe';
    _usernameController.text = '@johndoe';
    _userIdController.text = 'UID12345';
    _dobController.text = '01/01/1990';
    _phoneNumberController.text = '8888666';
    _emailController.text = 'abc@gmail.com';
    _genderController.text = 'Male';
    _panNumberController.text = 'ABCDE1234F';
    _addressController.text = '123 Main Street';
  }

  @override
  void dispose() {
    // Dispose controllers to avoid memory leaks
    _fullNameController.dispose();
    _usernameController.dispose();
    _userIdController.dispose();
    _dobController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    _genderController.dispose();
    _panNumberController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Account Information',
          style: TextStyle(fontFamily: 'Roboto'), // Use Roboto font
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // Navigate to an edit screen or show a dialog for editing
              _showEditDialog();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Small Image with Option to Change Profile Picture
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: _profileImage != null
                        ? FileImage(_profileImage!) // Use selected image
                        : AssetImage('assets/images/profile.jpg') as ImageProvider, // Default image
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton(
                      icon: Icon(Icons.camera_alt, color: Colors.blue),
                      onPressed: () {
                        // Show options for camera or gallery
                        _showImagePickerOptions();
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // 2. Profile Information in Two-Column Layout (labels on the left and values on the right)
            _buildProfileInfo(),
          ],
        ),
      ),
    );
  }

  // Function to build the profile information in two-column layout (labels on the left, values on the right)
  Widget _buildProfileInfo() {
    return Table(
      columnWidths: {
        0: IntrinsicColumnWidth(), // Left column (field names)
        1: FlexColumnWidth(), // Right column (values)
      },
      children: [
        // Full Name
        _buildProfileRow('Full Name', _fullNameController.text),
        _buildSpacer(),

        // Username
        _buildProfileRow('Username', _usernameController.text),
        _buildSpacer(),

        // UserID
        _buildProfileRow('User ID', _userIdController.text),
        _buildSpacer(),

        // DOB
        _buildProfileRow('DOB', _dobController.text),
        _buildSpacer(),

        // Phone Number
        _buildProfileRow('Phone No.', _phoneNumberController.text),
        _buildSpacer(),

        // Email
        _buildProfileRow('Email', _emailController.text),
        _buildSpacer(),

        // Gender
        _buildProfileRow('Gender', _genderController.text),
        _buildSpacer(),

        // PAN Number
        _buildProfileRow('PAN Number', _panNumberController.text),
        _buildSpacer(),

        // Address
        _buildProfileRow('Address', _addressController.text),
      ],
    );
  }

  // Helper function to build profile rows (field on the left, data on the right)
  TableRow _buildProfileRow(String label, String value) {
    return TableRow(
      children: [
        Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Roboto')), // Field name on the left
        Text(value, style: TextStyle(fontSize: 16, fontFamily: 'Roboto')), // Data on the right
      ],
    );
  }

  // Helper function to create spacing between rows
  TableRow _buildSpacer() {
    return TableRow(
      children: [
        SizedBox(height: 10), // Spacer
        SizedBox(height: 10), // Spacer
      ],
    );
  }

  // Function to show an edit dialog
  void _showEditDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Profile', style: TextStyle(fontFamily: 'Roboto')),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildTextFormField(_fullNameController, 'Full Name'),
                _buildTextFormField(_usernameController, 'Username'),
                _buildTextFormField(_userIdController, 'User ID'),
                _buildTextFormField(_dobController, 'DOB'),
                _buildTextFormField(_phoneNumberController, 'Phone No.', keyboardType: TextInputType.phone),
                _buildTextFormField(_emailController, 'Email', keyboardType: TextInputType.emailAddress),
                _buildTextFormField(_genderController, 'Gender'),
                _buildTextFormField(_panNumberController, 'PAN Number'),
                _buildTextFormField(_addressController, 'Address'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text('Cancel', style: TextStyle(fontFamily: 'Roboto')),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  // Update the UI with the new values
                });
                Navigator.pop(context); // Close the dialog
              },
              child: Text('Save', style: TextStyle(fontFamily: 'Roboto')),
            ),
          ],
        );
      },
    );
  }

  // Helper function to build text fields in the edit dialog
  Widget _buildTextFormField(TextEditingController controller, String label, {TextInputType keyboardType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(labelText: label, labelStyle: TextStyle(fontFamily: 'Roboto')),
        keyboardType: keyboardType,
        style: TextStyle(fontFamily: 'Roboto'),
      ),
    );
  }

  // Function to show options for camera or gallery
  void _showImagePickerOptions() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.camera),
                title: Text('Take Photo', style: TextStyle(fontFamily: 'Roboto')),
                onTap: () {
                  Navigator.pop(context); // Close the bottom sheet
                  _pickImage(ImageSource.camera); // Open camera
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Choose from Gallery', style: TextStyle(fontFamily: 'Roboto')),
                onTap: () {
                  Navigator.pop(context); // Close the bottom sheet
                  _pickImage(ImageSource.gallery); // Open gallery
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // Function to pick an image from camera or gallery
  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path); // Set the selected image
      });
    }
  }
}
