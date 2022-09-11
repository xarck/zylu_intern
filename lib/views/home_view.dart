import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zylu_intern/controllers/home_controller.dart';
import 'package:zylu_intern/models/employee_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeController hc;
  @override
  void initState() {
    super.initState();
    hc = Provider.of(context, listen: false);
    fetchEmp();
  }

  fetchEmp() async {
    await hc.fetchEmployees();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Consumer<HomeController>(
        builder: (_, data, child) {
          return data.isLoading == true
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: data.employees.data?.length,
                  itemBuilder: (_, index) {
                    Data currEmployee = data.employees.data![index];
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: currEmployee.employeeAge! > 35
                            ? Colors.green[300]
                            : Colors.red[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 80,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Name : ${currEmployee.employeeName}"),
                          Text("Age : ${currEmployee.employeeAge}"),
                          Text("Salary : ${currEmployee.employeeSalary}")
                        ],
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
