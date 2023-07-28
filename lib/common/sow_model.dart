import 'package:dz_app/constants/app_style.dart';
import 'package:dz_app/provider/date_provider.dart';
import 'package:dz_app/provider/radio_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import '../widget/Date_field.dart';
import '../widget/Radio_widget.dart';
import '../widget/text-field.dart';



class AddNewTaskModel extends ConsumerWidget {
  const AddNewTaskModel({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateprov = ref.watch(dateProvider);
    return Container(
      padding: EdgeInsets.all(30),
     height: MediaQuery.of(context).size.height*0.7,
     decoration: BoxDecoration(
       color: Colors.white,
       borderRadius: BorderRadius.circular(16),
     ),
     child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         SizedBox(
          width: double.infinity,
           child: Text(
            'New Task ToDo',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
           ),
         ),
         Divider(
          thickness: 1.2,
          color: Colors.grey.shade200,
         ),
         Gap(12),
         Text('Title Task',style: AppStyle.headingStyle),
         Gap(6),
         TextFieldWidget(maxLine: 1,hintText: 'Add Tasks Name',),
         Gap(12),
         Text('Description',style: AppStyle.headingStyle),
         Gap(6),
         TextFieldWidget(maxLine: 5,hintText: 'Add Descriptions',),
         Gap(12),
         Text('Category',style: AppStyle.headingStyle),
         
         Row(
          children: [
            Expanded(child: RadioWidget(colegColor: Colors.green, titleRadio: 'LRN', valueinput: 1, onchangeValue: () =>ref.read(radioProvider.notifier).update((state) => 1))),
            Expanded(child: RadioWidget(colegColor: Colors.blue.shade700, titleRadio: 'Wrk',valueinput: 2,onchangeValue: () =>ref.read(radioProvider.notifier).update((state) => 2))),
            Expanded(child: RadioWidget(colegColor: Colors.amberAccent.shade700, titleRadio: 'GEN',valueinput: 3,onchangeValue: () =>ref.read(radioProvider.notifier).update((state) => 3))),
            
          ],
         ),
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DateTimewidget(titleText: 'Date', valueText: dateprov, icon: Icons.calendar_month_outlined, onTap: () async{
              final getvalue = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2023), lastDate: DateTime(2030));
              if (getvalue !=null) {
                final format = DateFormat.yMd();
                ref
                .read(dateProvider.notifier)
                .update((state) => format.format(getvalue));
              }
            },),
            Gap(22),
            DateTimewidget(titleText: 'Time', valueText: ref.watch(timeProvider), icon: Icons.access_time_rounded, onTap: () async{
             final getTime = await showTimePicker(context: context, initialTime: TimeOfDay.now());
             if (getTime !=null) {
                
                ref
                .read(timeProvider.notifier)
                .update((state) => getTime.format(context));
              }
            },),
          ],
         ),
          Gap(12),
         Row(
          children: [
            Expanded(child: 
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.blue.shade800,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)
                ),
                side: BorderSide(color: Colors.blue.shade600),
                padding: EdgeInsets.symmetric(vertical: 12)
              ),
              onPressed: () => Navigator.pop(context),
               child: Text('Cancel'),
              ),
            ),
            Gap(20),
              Expanded(child: 
            ElevatedButton(
               style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)
                ),
                side: BorderSide(color: Colors.blue.shade600),
                padding: EdgeInsets.symmetric(vertical: 12)
              ),
              onPressed: () {
                
              }, child: Text('Create'),
              )
            )
          ],
         )
       ],
     ),
    );
  }
}

