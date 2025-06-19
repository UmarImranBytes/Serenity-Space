import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_color/app_color.dart';
import '../../utils/fonts/app_fonts.dart';
// ignore: must_be_immutable
class RichTextWidget extends StatelessWidget {
  final List<TextSpan> textSpans; // List of TextSpan for rich text
  double fSize;
  FontWeight? fWeight = FontWeights.regular;
  Color? textColor = AppColors.jetBlack;
  final int? maxLine;
  final bool overFlow;
  final bool dir;

  RichTextWidget({
    super.key,
    required this.textSpans, // Accept List<TextSpan> for rich text
    required this.fSize,
    this.fWeight,
    this.textColor,
    this.maxLine, // Allow multiple lines by default
    this.overFlow = false, // Properly initialize optional fields
    this.dir = false,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: textSpans, // Using the list of TextSpans for rich text
        style: GoogleFonts.poppins(
          fontWeight: fWeight,
          fontSize: fSize,
          color: textColor,
        ),
      ),
      maxLines: maxLine, // Allow the widget to display multiple lines
      overflow: overFlow ? TextOverflow.ellipsis : TextOverflow.visible, // Handle text overflow
      textDirection: dir ? TextDirection.rtl : TextDirection.ltr,
    );
  }
}
