import 'package:flutter/material.dart';

class GenericPasswordField extends StatefulWidget {
  final TextEditingController? fieldController;
  final String? fieldLabel;
  final bool? showError;

  const GenericPasswordField({
    super.key,
    this.fieldController,
    this.fieldLabel,
    this.showError
  });

  @override
  State<GenericPasswordField> createState() => _GenericPasswordFieldState();
}

class _GenericPasswordFieldState extends State<GenericPasswordField> {
  IconData passwordEye = Icons.visibility_off;
  Color passwordEyeColor = Color(0xff6c757d);
  Color fieldLabelColor = Color(0xff6c757d);
  bool obscureController = true;
  final FocusNode fieldFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    if(fieldFocusNode.hasFocus){
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
    fieldFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.fieldController,
      focusNode: fieldFocusNode,
      keyboardType: TextInputType.visiblePassword,
      obscureText: obscureController,
      decoration: InputDecoration(
        label: Text(widget.fieldLabel!),
        labelStyle: TextStyle(
            color: widget.showError! ? Theme.of(context).colorScheme.error : Colors.white,
            fontSize: 16
        ),
        prefixIcon: Icon(
          Icons.lock,
          color: widget.showError! ? Theme.of(context).colorScheme.error : Theme.of(context).colorScheme.primary
        ),
        suffixIcon: TextButton.icon(
            onPressed: () {
              if(obscureController){
                setState(() {
                  passwordEye = Icons.visibility;
                  passwordEyeColor = Theme.of(context).colorScheme.primary;
                  obscureController = false;
                });
              }
              else {
                setState(() {
                  passwordEye = Icons.visibility_off;
                  passwordEyeColor = const Color(0xff6c757d);
                  obscureController = true;
                });
              }
            },
            label: Icon(
              passwordEye,
              color: widget.showError! ? Theme.of(context).colorScheme.error : passwordEyeColor
            )
        ),
        error: widget.showError! ? const Visibility(visible: false, child: Text("")) : null,
      )
    );
  }
}
