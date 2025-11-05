import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Placeholder for PopupWidget
class PopupWidget extends StatefulWidget {
  const PopupWidget({super.key});

  @override
  State<PopupWidget> createState() => _PopupWidgetState();
}

class _PopupWidgetState extends State<PopupWidget> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Popup Content', style: GoogleFonts.montserrat()),
      content: Text('This is a placeholder popup.', style: GoogleFonts.montserrat()),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
      ],
    );
  }
}