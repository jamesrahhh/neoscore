import 'package:flutter/material.dart';

/// Page for logging in, account settings, and saving data to the cloud.
class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  // TODO: Add functionality and Firebase integration,
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: ListView(
          children: [
            Row(
              children: [
                GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.navigate_before_rounded)),
                const Text(
                  "Welcome, James",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient: const LinearGradient(
                          colors: [Colors.red, Colors.deepOrange]),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(255, 225, 225, 225),
                          blurRadius: 20.0,
                        )
                      ]),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("i forgot what this button was"),
                        Icon(
                          Icons.navigate_next_rounded,
                          size: 20,
                          weight: 300,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
