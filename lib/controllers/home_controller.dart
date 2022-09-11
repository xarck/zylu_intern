import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:zylu_intern/models/employee_model.dart';

class HomeController extends ChangeNotifier {
  bool isLoading = true;
  late EmployeeModel employees;

  fetchEmployees() async {
    try {
      Response response =
          await Dio().get("https://dummy.restapiexample.com/api/v1/employees");
      employees = EmployeeModel.fromJson(response.data);
      isLoading = false;
      notifyListeners();
    } catch (err) {
      print(err.toString());
    }
  }
}
