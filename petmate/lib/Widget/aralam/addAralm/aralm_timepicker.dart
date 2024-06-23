import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petmate/Util/textstyles.dart';

class AralmTimepicker extends StatefulWidget {
  const AralmTimepicker({super.key});

  @override
  State<AralmTimepicker> createState() => _AralmTimepickerState();
}

class _AralmTimepickerState extends State<AralmTimepicker> {
  final FixedExtentScrollController controller =
      FixedExtentScrollController(initialItem: 1);
  String selectedDay = '';
  String selectedtime = '';
  String selectedmin = '';

  List<String> time = [
    '00    :',
    '01    :',
    '02    :',
    '03    :',
    '04    :',
    '05    :',
    '06    :',
    '07    :',
    '08    :',
    '09    :',
    '10    :',
    '11    :',
    '12    :',
  ];
  List<String> min = [
    '00',
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30',
    '31',
    '32',
    '33',
    '34',
    '35',
    '36',
    '37',
    '38',
    '39',
    '40',
    '41',
    '42',
    '43',
    '44',
    '45',
    '46',
    '47',
    '48',
    '49',
    '50',
    '51',
    '52',
    '53',
    '54',
    '55',
    '56',
    '57',
    '58',
    '59',
  ];
  List<String> day = [
    '오전',
    '오후',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 185,
      height: 96,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 38,
            height: 96,
            child: CupertinoPicker.builder(
              itemExtent: 40,
              childCount: day.length,
              onSelectedItemChanged: (i) {
                setState(() {
                  selectedDay = day[0];
                });
              },
              itemBuilder: (context, index) {
                return Text(day[index], style: White(20, FontWeight.w600));
              },
            ),
          ),
          Container(
            width: 61,
            height: 96,
            child: CupertinoPicker.builder(
              itemExtent: 40,
              childCount: time.length,
              onSelectedItemChanged: (i) {
                setState(() {
                  selectedtime = time[0];
                });
              },
              itemBuilder: (context, index) {
                return Text(time[index], style: White(20, FontWeight.w600));
              },
            ),
          ),
          Container(
            width: 38,
            height: 96,
            child: CupertinoPicker.builder(
              itemExtent: 40,
              childCount: min.length,
              onSelectedItemChanged: (i) {
                setState(() {
                  selectedmin = min[0];
                });
              },
              itemBuilder: (context, index) {
                return Text(min[index], style: White(20, FontWeight.w600));
              },
            ),
          ),
        ],
      ),
    );
  }
}
