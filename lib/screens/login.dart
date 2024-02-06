import 'package:cricket_schedule_app/screens/home.dart';
import 'package:cricket_schedule_app/screens/register.dart';
import 'package:flutter/material.dart';

//import 'screens/register.dart';

class Login extends StatefulWidget {
  const Login({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(children: [
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email address';
                    }
                    // You can add more sophisticated email validation logic here
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
   Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      // Form is valid, perform login logic here
                      // For simplicity, we'll just print the values for now
                      // ignore: avoid_print
                      print('Email: ${_emailController.text}');
                      // ignore: avoid_print
                      print('Password: ${_passwordController.text}');
                        // Redirect to HomeScreen on successful login
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MyHomePage( title:'Welcome to Cricket Schedule')),
                      );
                    }
                  },
                  child: const Text('Login'),
                ),
              ),
              const SizedBox(height: 16), // Add space between the buttons
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton(
                  onPressed: () {
                    // Handle the second button press
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const RegistrationScreen(title: 'Register to Cricket Schedule')),
                      );
                  },
                  child: const Text('Register'),
                ),
              ),
             
                  ],
                )
              ]
              )
            ],
          ),
        ),
      ),
    );
  }
}
