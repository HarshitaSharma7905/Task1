
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';

import 'Employee.dart';


Future<List<EmployeeData>> fetchEmployeeFromApi() async{
  final response = await http.get(Uri.parse('https://reqres.in/api/users?page=1'));
  if(response.statusCode==200){
    final jsonData = json.decode(response.body);
    final employeeList = jsonData['data'] as List<dynamic>;

    final employees = employeeList.map((employeeData) {
      return EmployeeData.fromJson(employeeData);
    }).toList();

    return employees;
  }else
  {
    throw Exception('Failed to load data');
  }
}
