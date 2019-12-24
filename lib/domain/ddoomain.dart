import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';

void sdf() {
  new Color(12323);
  Color cc = "red".toColor();
  double d = "2.34".toDouble();
  var persons = [Person(12), Person(32)];
  persons.sumBy((a) => a.age);
  persons.groupBy((p) => p.age < 40 ? "young" : "old",
      valueTransform: (p) => p.name);
}

class Person {
  int age;
  String name;

  Person(int d) {
    age = d;
  }
}
