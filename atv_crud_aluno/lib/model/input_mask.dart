import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

var dateFormatter = MaskTextInputFormatter(
  mask: '##/##/####',
  filter: {"#": RegExp(r'^([\d]+)?$')},
);
var matrFormatter = MaskTextInputFormatter(
  mask: '##############',
  filter: {"#": RegExp(r'^([\d]+)?$')},
);

var stringFormatter = MaskTextInputFormatter();
