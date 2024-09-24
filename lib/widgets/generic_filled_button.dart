import 'package:flutter/material.dart';

class GenericFilledButton extends StatefulWidget {
  final String? buttonText;
  final Function()? buttonFunction;

  const GenericFilledButton({
    super.key,
    this.buttonText,
    this.buttonFunction
  });

  @override
  State<GenericFilledButton> createState() => _GenericFilledButtonState();
}

class _GenericFilledButtonState extends State<GenericFilledButton> {
  @override
  Widget build(BuildContext context) {
    return FilledButton(
        onPressed: widget.buttonFunction,
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Theme.of(context).colorScheme.secondary),
          padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 20))
        ),
        child: Text(
          widget.buttonText!,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        )
    );
  }
}
