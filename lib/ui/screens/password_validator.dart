import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widget_utils/provider/password_provider.dart';

class PwdValidationExample extends StatelessWidget {
  const PwdValidationExample({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<PasswordStrengthProvider>();
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Password Validation'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              TextField(
                onChanged: (value) => context
                    .read<PasswordStrengthProvider>()
                    .checkPassword(value),
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Password',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              // The strength indicator bar
              LinearProgressIndicator(
                value: provider.strength,
                backgroundColor: Colors.grey[300],
                color: provider.strength <= 1 / 4
                    ? Colors.red
                    : provider.strength == 2 / 4
                        ? Colors.yellow
                        : provider.strength == 3 / 4
                            ? Colors.blue
                            : Colors.green,
                minHeight: 15,
              ),
              const SizedBox(
                height: 20,
              ),

              // The message about the strength of the entered password
              Text(
                provider.displayText,
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 50,
              ),
              // This button will be enabled if the password strength is medium or beyond
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        provider.strength < 1 / 2
                            ? Colors.grey.shade300
                            : Colors.tealAccent)),
                onPressed: provider.strength < 1 / 2 ? null : () {},
                child: const Text('Continue'),
              )
            ],
          ),
        ));
  }
}
