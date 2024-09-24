import 'package:flutter/material.dart';

class GenericTextField extends StatefulWidget {

  final TextEditingController? fieldController;
  final TextInputType? inputType;
  final String? fieldLabel;
  final IconData? prefixIcon;
  final bool? showError;
  final Function(String)? onSubmitted;

  const GenericTextField({
    super.key,
    this.fieldController,
    this.inputType,
    this.fieldLabel,
    this.prefixIcon,
    this.showError,
    this.onSubmitted
  });

  @override
  State<GenericTextField> createState() => _GenericTextFieldState();
}

class _GenericTextFieldState extends State<GenericTextField> {
  final FocusNode focusNode = FocusNode();
  Color fieldLabelColor = const Color(0xff6c757d);
  @override
  void initState() {
    super.initState();
    if(focusNode.hasFocus){
      setState(() {
        fieldLabelColor = Theme.of(context).colorScheme.primary;
      });
    }
    else {
      setState(() {
        fieldLabelColor = const Color(0xff6c757d);
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.fieldController,
      focusNode: null,
      keyboardType: widget.inputType,
      onSubmitted: widget.onSubmitted,
      decoration: InputDecoration(
        label: Text(widget.fieldLabel!),
        labelStyle: TextStyle(
          color: widget.showError! ? Theme.of(context).colorScheme.error : Colors.white,
          fontSize: 16
        ),
        prefixIcon: Icon(
          widget.prefixIcon,
          color: widget.showError! ? Theme.of(context).colorScheme.error : Theme.of(context).colorScheme.primary,
        ),
        error: widget.showError! ? const Visibility(visible: false, child: Text("")) : null,
      ),
    );
  }
}
