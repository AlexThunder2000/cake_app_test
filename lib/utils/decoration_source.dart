import 'package:flutter/material.dart';

Decoration customContainerDecoration = BoxDecoration(
  boxShadow: const [
    BoxShadow(
      color: Color.fromRGBO(11, 11, 34, 0.05),
      blurRadius: 40.0,
      spreadRadius: -9.0,
      offset: Offset(0, 25),
    )
  ],
  borderRadius: BorderRadius.circular(16),
  color: Colors.white,
);
