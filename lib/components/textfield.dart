import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  const MyTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.01),
              borderRadius: BorderRadius.circular(24),
            ),
            padding: const EdgeInsets.all(16),
          ),
          TextField(
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color:
                      Theme.of(context).colorScheme.secondary.withOpacity(0.01),
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              prefixIcon: Icon(
                Icons.food_bank_outlined,
                color: Theme.of(context).colorScheme.primary,
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  controller.clear();
                },
                child: Icon(
                  Icons.clear,
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
                ),
              ),
            ),
          ),
          Positioned(
            top: -24,
            left: -24,
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: -16,
            right: -16,
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.tertiary,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
