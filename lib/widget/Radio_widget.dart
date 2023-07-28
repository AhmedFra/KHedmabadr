import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/radio_provider.dart';

class RadioWidget extends ConsumerWidget {
  const RadioWidget({
    super.key,
    required this.colegColor,
    required this.titleRadio,
    required this.valueinput,
    required this.onchangeValue,
  });
  final String titleRadio;
  final Color colegColor;
  final int valueinput;
  final VoidCallback onchangeValue;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final radioCategory = ref.watch(radioProvider);
    return Material(
      child: Theme(
        data: ThemeData(unselectedWidgetColor:colegColor),
        child: RadioListTile(
          activeColor: colegColor,
         contentPadding: EdgeInsets.zero,
         title: Transform.translate(
           offset: Offset(-22,0), child:  Text(titleRadio,style: TextStyle(
            color: colegColor,fontWeight: FontWeight.w700
           ),),),
         value: valueinput,
         groupValue: radioCategory,
         onChanged: (value)=>onchangeValue()),
      ),
    );
  }
}

