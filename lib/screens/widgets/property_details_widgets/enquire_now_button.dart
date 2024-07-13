import 'package:flutter/material.dart';

class EnquireNowButton extends StatelessWidget {
  const EnquireNowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Show a dialog for sending messages
        showDialog(
          context: context,
          builder: (BuildContext context) {
            String message = ''; // State to hold the message

            return AlertDialog(
              title: const Text('Message'), // Changed title to 'Message'
              content: Column(
                mainAxisSize: MainAxisSize.min, // To wrap content
                children: <Widget>[
                  TextField(
                    onChanged: (value) {
                      message = value; // Update message on change
                    },
                    decoration: const InputDecoration(
                      hintText:
                      'Write your message here', // Placeholder text
                    ),
                  ),
                  const SizedBox(height: 20), // Spacer for padding
                  ElevatedButton(
                    onPressed: () {
                      // Handle sending message logic
                      print(
                          'Sending message: $message'); // Example logic
                      Navigator.pop(context); // Close the dialog
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                      const Color(0xFFCA996E), // Button color
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            15), // Rounded corners
                      ),
                    ),
                    child: const Text(
                      'Send', // Button text
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFFCA996E),
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10), // Padding
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15), // Rounded corners
        ),
        minimumSize: const Size(double.infinity, 50),
      ),
      child: const Text(
        'Enquire Now', // Button text
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
