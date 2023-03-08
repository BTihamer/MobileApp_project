import 'package:flutter/material.dart';

class LabelTextFormField extends StatelessWidget {
  LabelTextFormField({Key? key, required this.width, required this.label,required this.name,required this.obscure,required this.myController}) : super(key: key);

  final bool obscure;
  final String name;
  final double width;
  final String label;
  final TextEditingController myController;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: myController,
            obscureText: obscure,
            decoration: InputDecoration(
              label: Text(label),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12))
              ),
            ),
          )
        ],
      ),
    );
  }
}