import 'package:flutter/material.dart';

import 'API.dart';
import 'Employee.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class Task extends StatefulWidget {
  const Task({Key? key}) : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  List<EmployeeData> employee=[];
   String firstname='';
   String lastname='';
   String email='';
   String url='';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchEmployeeData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Home Page',style: TextStyle(color: Colors.black,),),
          centerTitle: true,
      actions: [GestureDetector(
        onTap: () {
          fetchEmployeeData();

        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.refresh),
        ),
      )]),
      body: Column(children: [

        SingleChildScrollView(

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              employee.length,
                  (index) {
                return Container(
                  width: 100,
                  height: 50,// Set a fixed width for each item
                  margin: EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 100,
                        child: ElevatedButton(onPressed: () {
                          setState(() {
                              firstname=employee[index].firstName.toString();
                              lastname=employee[index].lastName.toString();
                              email=employee[index].email.toString();
                              url=employee[index].avatar.toString();

                          });

                        }, child: Text(
                          employee[index].firstName,
                          style: TextStyle(color: Colors.white),
                        ),),
                      )

                    ],
                  ),
                );
              },
            ),
          ),
        ),
      SizedBox(height: 10,),
       Container(

         color: Colors.grey,
         padding: EdgeInsets.all(20),
         child: Column(children: [
           Container(
             width: 900,


             child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Container(
                     width: 200,
                     child: Row(

                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [
                         ElevatedButton(style:ElevatedButton.styleFrom(backgroundColor: Colors.yellow),onPressed: () {

                         }, child: Text('Edit')),
                         ElevatedButton(style:ElevatedButton.styleFrom(backgroundColor: Colors.red),onPressed: () {

                         }, child: Text('Delete'))
                       ],),
                   ),
                   Container(width: 100,height: 100,decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.white),
                     child: Image.network(url,width: 100,height: 100),
                   )
                 ]),
           ),
           Container(child: Column(children: [
             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text('First Name'), Text(firstname)],),
             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text('Last Name'), Text(lastname)],),
             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text('Email'), Text(email)],),

           ]),)
         ]),
       )
      ],)

    );
  }
//  fetch data from API:--
Future<void> fetchEmployeeData() async{
List<EmployeeData> fetchEmployees = await fetchEmployeeFromApi();
setState(() {
  employee=fetchEmployees;
});

}
}
