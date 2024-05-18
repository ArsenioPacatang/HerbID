import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFormInput extends StatelessWidget {
  final int index; // Add index parameter
  final String hintText;
  final String labelText;
  final String validationText;
  final TextEditingController plantTextController;
  final int editedIndex; // Add editedIndex parameter
  final Function(int) clickEdit; // Modify clickEdit function

  TextFormInput({
    Key? key,
    required this.index,
    required this.hintText,
    required this.plantTextController,
    required this.labelText,
    required this.validationText,
    required this.clickEdit,
    required this.editedIndex, // Add editedIndex
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool edit = index == editedIndex; // Check if this field is edited

    return Container(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                labelText,
                style: GoogleFonts.sourceSerifPro(
                  color: Colors.black,
                  fontSize: 15,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 8),
                width: 40,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    clickEdit(index); // Pass the index to clickEdit
                  },
                  child: Icon(edit ? Icons.lock : Icons.edit),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: CircleBorder(),
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(left: 8, right: 8),
            child: TextFormField(
              enabled: edit,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return validationText;
                }
                return null;
              },
              maxLines: 1000,
              minLines: 1,
              controller: plantTextController,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(
                  color: Color(0xFF78746D),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 1,
                    color: Color(0xFFBEBAB3),
                  ),
                  borderRadius: BorderRadius.circular(27),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
