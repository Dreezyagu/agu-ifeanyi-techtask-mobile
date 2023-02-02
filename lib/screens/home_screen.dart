import 'package:flutter/material.dart';
import 'package:tech_task/screens/ingredients_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController dateController = TextEditingController();
  DateTime? date;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
          child: Column(
            children: [
              Text(
                "Welcome to your refreigerator, please select a a lunch date:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 50),
              TextField(
                onTap: () async {
                  date = await showDatePicker(
                      context: context,
                      initialDate: DateTime(2019),
                      firstDate: DateTime(2019),
                      lastDate: DateTime(2021));
                  if (date != null) {
                    setState(() {
                      dateController.text =
                          "${date!.day}-${date!.month}-${date!.year}";
                    });
                  }
                },
                readOnly: true,
                controller: dateController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.calendar_month),
                  hintText: "Select Date",
                ),
              ),
              Spacer(),
              ElevatedButton(
                  onPressed: date == null
                      ? null
                      : () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => IngredientsScreen(
                                  lunchDate: date!,
                                ),
                              ));
                        },
                  child: Text(
                    "Continue",
                    style: TextStyle(fontSize: 16),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
