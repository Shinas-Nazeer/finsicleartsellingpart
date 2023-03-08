import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  const Mybutton({super.key, required this.label, required this.ontap, this.buttonColor = const Color(0xff40bfff),});

  final String label;
  final Function() ontap;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: InkWell(
        onTap: ontap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            boxShadow: const[
              BoxShadow(
                color: Color(0x3d40bfff),
                blurRadius: 30,
                offset:  Offset(0, 10),
              ),
            ],
            color: buttonColor      
          ),
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 311,
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.50,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class CoustomElevatedButoon extends StatelessWidget {
  const CoustomElevatedButoon(
      {super.key,
      required this.label,
      required this.ontap,
      required this.backGroundColor});
  final String label;
  final Function() ontap;
  final Color backGroundColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: backGroundColor),
      onPressed: ontap,
      child: Text(
        label,
      ),
    );
  }
}