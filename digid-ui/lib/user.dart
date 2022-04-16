import 'package:flutter/material.dart';

class User {
  String fullName = 'Gerrit Jan';
  String lastName = 'Broos';
  String email = 'Jano.Broos@netactive.co.za';
  String phone = '(+27) 72 907 1507';
  String addressNum = '215';
  String addressStreet = 'Cormorant Crescent';
  String city = 'Centurion';
  DateTime birthDate = DateTime.parse('2000-09-29');

  @override
  String toString() {
    return 'Full Name: ${fullName} ${lastName}' +
        '\n' +
        'Email: ${email}' +
        '\n' +
        'Phone Number: ${phone}' +
        '\n' +
        'Address: ${addressNum} ${addressStreet}, ${city}' +
        '\n' +
        'Birth Date: ${birthDate.day}/${birthDate.month}/${birthDate.year}';
  }

  Text GetText() {
    return Text(
      toString(),
      style: TextStyle(color: Color.fromARGB(255, 66, 66, 75), fontSize: 20),
      textAlign: TextAlign.center,
    );
  }

  DataTable GetTable() {
    TextStyle header = TextStyle(color: Color.fromARGB(255, 66, 66, 75), fontSize: 20);

    return DataTable(
      columns: [
        DataColumn(label: Text('')),
        DataColumn(label: Text('')),
      ],
      rows: [
        DataRow(cells: [DataCell(Text('Full Name', style: header)), DataCell(Text('${fullName} ${lastName}'))]),
        DataRow(cells: [DataCell(Text('Email', style: header)), DataCell(Text('${email}'))]),
        DataRow(cells: [DataCell(Text('Phone Number', style: header)), DataCell(Text('${phone}'))]),
        DataRow(cells: [DataCell(Text('Address', style: header)), DataCell(Text('${addressNum} ${addressStreet}, ${city}'))]),
        DataRow(cells: [DataCell(Text('Birth Date', style: header)), DataCell(Text('${birthDate.day}/${birthDate.month}/${birthDate.year}'))]),
      ],
      headingRowHeight: 0,
      columnSpacing: 20,
    );
  }
}
