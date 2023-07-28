import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'common/sow_model.dart';
import 'widget/cardWidget.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        
        elevation: 0,
        title: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.amber.shade200,
            radius: 25,
            child: Image.asset('assets/profile_page2.png'),
          ),
          title: Text(
            'Hello I\'m',
            style: TextStyle(fontSize: 12 ,color: Colors.grey.shade400),
          ),
          subtitle: Text('Bedr Houhou ',
          style: TextStyle(fontWeight: FontWeight.bold,
          color:Colors.black),
          ),
        ),
        actions: [
          Padding(padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              IconButton(onPressed: () {}, 
              icon: Icon(Icons.calendar_month_outlined)),
              IconButton(onPressed: () {},
              icon: Icon(Icons.notifications_none))
            ],
          ),
          
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(padding: 
        EdgeInsets.symmetric(horizontal: 30),
        child: Column(children: [
          Gap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Today\'s Task',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color:Colors.black
                  ),),
                  Text('Wednesday,11 May',style: 
                  TextStyle(color: Colors.grey)
                  ,)
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFD5E8FA),
                  foregroundColor: Colors.blue.shade800,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                  )
                ),
                onPressed: () => showModalBottomSheet(
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)
                  ),
                  context: context,
                   builder: (context)=>AddNewTaskModel()),
               child: Text('+ New Task')),
            ],
          ),
          Gap(20),
          ListView.builder(
            itemCount: 3,
            shrinkWrap: true,
            itemBuilder: (context, index)=>
          CardWidget())
          
        ]),
        ),
      ),
    );
  }
}


