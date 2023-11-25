import 'package:flutter/material.dart';
import 'package:sports_iiitd/common/colors.dart';

class FineActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      FineActionBox(
          "Pay Fine", "assets/wallet.png", "Complete your fine transaction"),
      FineActionBox("Status", "assets/document_red.png",
          "Check the status of your fines"),
      FineActionBox(
          "Reports", "assets/danger.png", "Check out your current reports")
    ]);
  }
}

class FineActionBox extends StatelessWidget {
  final String boxTitle;
  final String imageSrc;
  final String description;

  FineActionBox(this.boxTitle, this.imageSrc, this.description);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
      },
      child: Container(
        height: 125,
        width: MediaQuery.of(context).size.width / 3 - 20,
        decoration: BoxDecoration(
          color: CustomColors.red.withOpacity(0.1),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(
            color: CustomColors.red,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  imageSrc,
                  scale: 1,
                ),
                Text(boxTitle,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    )),
                Text(description,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 8,
                    ))
              ]),
        ),
      ),
    );
  }
}
