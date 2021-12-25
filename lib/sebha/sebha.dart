import 'package:flutter/material.dart';

class SebhaTap extends StatefulWidget {
  @override
  State<SebhaTap> createState() => _SebhaTapState();
}

class _SebhaTapState extends State<SebhaTap> {
  int count = 0;
  List<String> text = ['سبحان اللّه', 'الحمدللّه', 'اللّه أكبر'];
  int index = 0;
  double angle = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          InkWell(
            onTap: tsbeh,
            child: Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                Container(
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.height * .06),
                    child: Image.asset('assets/images/head_seb7a_image.png')),
                Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * .1),
                    child: Transform.rotate(
                        angle: angle,
                        child:
                            Image.asset('assets/images/body_seb7a_image.png')))
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .03),
              child: Text('عددالتسبيحات',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500))),
          Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .03),
              decoration: BoxDecoration(
                  color: Color.fromARGB(145, 183, 147, 95),
                  borderRadius: BorderRadius.circular(24)),
              padding: EdgeInsets.all(15),
              child: Text('$count',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500))),
          Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .05),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 183, 147, 95),
                  borderRadius: BorderRadius.circular(24)),
              padding: EdgeInsets.all(8),
              child: Text('${text[index]}',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }

  void tsbeh() {
    count++;
    if (count % 33 == 0) {
      if (index == text.length - 1) {
        index = 0;
      } else {
        index++;
      }
    }
    setState(() {
      angle += 15;
    });
  }
}
