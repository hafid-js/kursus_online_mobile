import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

class UHelperFunctions{
  UHelperFunctions._();

  static Color? getColor(String value) {

    if (value == 'Green') {
      return Colors.green;
    } else if (value == 'Green') {
      return Colors.green;
    } else if (value == 'Red') {
      return Colors.red;
    } else if (value == 'Blue') {
      return Colors.blue;
    } else if(value == 'Dark Blue'){
      return Colors.blueGrey;
    }
    else if (value == 'Pink') {
      return Colors.pink;
    } else if (value == 'Grey') {
      return Colors.grey;
    } else if (value == 'Purple') {
      return Colors.purple;
    } else if (value == 'Black') {
      return Colors.black;
    } else if (value == 'White') {
      return Colors.white;
    } else if (value == 'Yellow') {
      return Colors.yellow;
    } else if (value == 'Orange') {
      return Colors.deepOrange;
    } else if (value == 'Brown') {
      return Colors.brown;
    } else if (value == 'Teal') {
      return Colors.teal;
    } else if (value == 'Indigo') {
      return Colors.indigo;
    } else if(value == 'Silver') {
      return Colors.grey;
    }else {
      return null;
    }
  }


  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static final NumberFormat _idrFormat = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0,
  );

  static String formatRupiah(int value) {
    return _idrFormat.format(value);
  }

  static String formatNumber(int value) {
    final formatter = NumberFormat('#,###', 'id_ID');
    return formatter.format(value);
  }


static String getGreetingMessage() {
    final hour = DateTime.now().hour;

    if (hour >= 5 && hour < 12) {
      return 'Good Morning';
    } else if (hour >= 12 && hour < 16) {
      return 'Good Afternoon';
    } else if (hour >= 16 && hour < 19) {
      return 'Good Evening';
    } else {
      return 'Good Night';
    }
  }

  static String formatDuration(String duration) {
  int minutes = int.tryParse(duration) ?? 0;

  int hours = minutes ~/ 60;
  int remainingMinutes = minutes % 60;

  if (hours > 0) {
    return '${hours}h ${remainingMinutes}m';
  } else {
    return '${remainingMinutes}m';
  }
}


  static Future<File> assetToFile(String assetPath) async {
    final byteData = await rootBundle.load(assetPath);

    final tempDir = await getTemporaryDirectory();

    final file = File('${tempDir.path}/${assetPath.split('/').last}');


    await file.writeAsBytes(byteData.buffer.asUint8List());

    return file;
  }

   static String getFormattedDate(DateTime date, {String format = 'dd MMM yyyy'}) {
    return DateFormat(format).format(date);
  }

  static String capitalize(String text) {
  if (text.isEmpty) return text;
  return text[0].toUpperCase() + text.substring(1);
}


static String getMimeType(String path) {
  final extension = path.split('.').last.toLowerCase();
  switch (extension) {
    case 'jpg':
    case 'jpeg':
      return 'image/jpeg';
    case 'png':
      return 'image/png';
    default:
      return 'application/octet-stream'; 
  }
}


}