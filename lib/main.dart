import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Signup Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const SignupPage(),
    );
  }
}

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  String _selectedSubjectArea = 'Mathematics';
  bool _marketingUpdates = false;
  bool _correspondenceInWelsh = false;
  final String _currentLocation = 'unknown';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Registration Form'),
        // Add university logo
        leading: SizedBox(
          width: 40,
          height: 40,
          child: Image.asset('usw.jpg'),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.lightBlueAccent],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: _fullNameController,
                  decoration: const InputDecoration(
                    labelText: 'Full Name',
                  ),
                ),
                const SizedBox(height: 20.0),
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20.0),
                TextField(
                  controller: _dobController,
                  decoration: const InputDecoration(
                    labelText: 'Date of Birth',
                  ),
                  keyboardType: TextInputType.datetime,
                ),
                const SizedBox(height: 20.0),
                DropdownButtonFormField(
                  value: _selectedSubjectArea,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedSubjectArea = newValue.toString();
                    });
                  },
                  items: <String>[
                    'Mathematics',
                    'Science',
                    'History',
                    'Literature',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  decoration: const InputDecoration(
                    labelText: 'Subject Area',
                  ),
                ),
                const SizedBox(height: 20.0),
                Row(
                  children: [
                    const Text('Agree to Marketing Updates'),
                    Switch(
                      value: _marketingUpdates,
                      onChanged: (value) {
                        setState(() {
                          _marketingUpdates = value;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Row(
                  children: [
                    const Text('Correspondence in Welsh'),
                    Switch(
                      value: _correspondenceInWelsh,
                      onChanged: (value) {
                        setState(() {
                          _correspondenceInWelsh = value;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () async {
                    // Hak;lndle signup logic
                    String fullName = _fullNameController.text;
                    String email = _emailController.text;
                    String dob = _dobController.text;

                    // Get current location
                    // try {
                    //   Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
                    //   setState(() {
                    //     _currentLocation = 'Latitude: ${position.latitude}, Longitude: ${position.longitude}';
                    //   });
                    // } catch (e) {
                    //   print("Error getting location: $e");
                    //   setState(() {
                    //     _currentLocation = 'Error: $e';
                    //   });
                    // }

                    // Dummy logic to display captured data
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Registered Successfully'),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Full Name: $fullName'),
                              Text('Email: $email'),
                              Text('Date of Birth: $dob'),
                              Text('Subject Area: $_selectedSubjectArea'),
                              Text('Agree to Marketing Updates: $_marketingUpdates'),
                              Text('Correspondence in Welsh: $_correspondenceInWelsh'),
                              Text('Location: $_currentLocation'),
                            ],
                          ),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
