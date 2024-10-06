import 'package:flutter/material.dart';

class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({super.key});

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Center(
              child: Text(
            'Counter Functions',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          )),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.refresh_rounded,
              ),
              onPressed: () {
                setState(() {
                  clickCounter = 0;
                });
              },
            )
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$clickCounter',
                style: const TextStyle(
                    fontSize: 130,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber),
              ),
              Text(
                'Click${clickCounter == 1 ? '' : 's'}',
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber),
              )
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(
              icon: Icons.refresh_rounded,
              onPressed: () {
                clickCounter = 0;
                setState(() {});
              },
            ),
            const SizedBox(height: 20),
            CustomButton(
                icon: Icons.exposure_minus_1,
                onPressed: () {
                  if (clickCounter == 0) return;
                  clickCounter--;
                  setState(() {});
                }),
            const SizedBox(height: 20),
            CustomButton(
              icon: Icons.plus_one,
              onPressed: () {
                clickCounter++;
                setState(() {});
              },
            )
          ],
        ));
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const CustomButton({
    super.key,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      enableFeedback: true,
      elevation: 10,
      backgroundColor: Colors.amber,
      shape: const StarBorder.polygon(),
      onPressed: onPressed,
      child: Icon(
        icon,
        color: Colors.black,
      ),
    );
  }
}
