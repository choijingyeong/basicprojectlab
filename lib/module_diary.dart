import 'package:flutter/material.dart';

class Diary {
  String contents;
  List<String> tags = [];
  String feeling;

  Diary(this.contents, this.tags, this.feeling);
}