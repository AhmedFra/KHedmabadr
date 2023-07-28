import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(children: [
        Container(
          
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            )
          ),
          width: 15,
        ),
        Expanded(child: Padding(padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text('Learning Web Developer'),
              subtitle: Text('Learning English'),
              trailing: Transform.scale(
                scale: 1.5,
                
                child: Checkbox(
                  activeColor: Colors.blue.shade800,
                  shape: CircleBorder(),
                  value:true,
                  onChanged:(value) => print('object'),
                  )),
            ),
           Transform.translate(
            offset: Offset(0,-12,),
             child: Container(
              child: Column(
                children: [
                   Divider(
                thickness:1.5,
                
                color: Colors.grey.shade200,
              ),
              Row(
                children: [
                  Text('Today'),
                  Gap(12),
                  Text('09:15PM- 11;45PM')
                ],
              )
                ],
              ),
             ),
           )
            
          ],
        ),
        ))
      ],),
    );
  }
}
