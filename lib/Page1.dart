// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:pakistan_jobs2/Pages/BalochistanJobs.dart';
import 'package:pakistan_jobs2/Pages/BaltistanJobs.dart';
import 'package:pakistan_jobs2/Pages/FedrelJobs.dart';
import 'package:pakistan_jobs2/Pages/KPKJobs.dart';
import 'package:pakistan_jobs2/Pages/PunjabJobs.dart';
import 'package:pakistan_jobs2/Pages/SindhJobs.dart';

// import 'package:get/get.dart';
// import 'package:pakistan_jobs2/GoogleSignIn.dart';
class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  final databaseReference = FirebaseDatabase.instance.reference();
  

  var titleList = [
    "KPK",
    "Jobs in Sindh",
    "Police Jobs",
    "Balochistan",
    "Ppsc",
    "Pakistan Navi",
    "PAF",
    "PSC",
    "Private",
    "POF",
    "FPSC",
    "Nescom",
    "Pakistan Army",
    "Jobs in Fedral",
    "css -competition",
    "PPSC Lectures",
    "ASF",
  ];
  List a = [
    'images/KPK.jpeg',
    'images/Jobs in Sindh.jpeg',
    'images/Police Jobs.jpeg',
    "images/Balochistan Jobs.jpeg",
    'images/PPSC.jpeg',
    'images/Pakistan Navy.jpeg',
    'images/PAF.jpeg',
    'images/PPSC.jpeg',
    'images/Private Jobs.jpeg',
    'images/POF.jpeg',
    'images/PPSC.jpeg',
    'images/POF.jpeg',
    'images/Pakistan Army.jpeg',
    'images/PPSC.jpeg',
    'images/CSS Competitive Examination.jpeg',
    'images/PPSC Lectures.jpeg',
    "images/images/POF.jpeg",
    "images/ASF.jpeg",
  ];
  var desList = [
    "Push Yourself,Becuse no one else is going to help you.",
    "Your Limitation- its only your Imagination",
    "Hard work Can Change the life",
    "confident is the most beutifull thing That you possess",
    "A Big Buisniss starts small",
    "Talent win game, Teamwork and intilligence win Championships",
    "Some time its small desicion that can chnge your life forever",
    "Push Yourself,Becuse no one else is going to help you.",
    "Your Limitation- its only your Imagination",
    "Hard work Can Change the life",
    "Push Yourself,Becuse no one else is going to help you.",
    "confident is the most beutifull thing That you possess",
    "A Big Buisniss starts small",
    "Talent win game, Teamwork and intilligence win Championships",
    "Some time its small desicion that can chnge your life forever",
    "Your Limitation- its only your Imagination",
    "Hard work Can Change the life",
    "confident is the most beutifull thing That you possess",
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width * 0.5;
    return Container(
      
      height: height * .4,
      width: width,
      // padding: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 200.0,
            width: 350.0,
            child: Carousel(
              dotSize: 4.00,
              dotSpacing: 15.0,
              dotColor: Colors.black,
              indicatorBgPadding: 5.0,
              dotBgColor: Colors.transparent,
              dotVerticalPadding: 5.0,
              dotPosition: DotPosition.bottomRight,
              images: [
                Image.asset(
                  "images/ppsc.png",
                  fit: BoxFit.fitHeight,
                ),
                Image.asset("images/KPK.jpeg", fit: BoxFit.cover),
                // Image.asset("images/POF.jpeg", fit: BoxFit.cover),
                Image.asset(
                  "images/Jobs in Sindh.jpeg",
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  "images/PPSC.jpeg",
                  fit: BoxFit.cover,
                ),
              ],
              showIndicator: false,
              borderRadius: false,
              moveIndicatorFromBottom: 180.0,
              noRadiusForIndicator: true,
              overlayShadow: true,
              overlayShadowColors: Colors.white,
              overlayShadowSize: 0.7,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: titleList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  // Route
                  onTap: () {
                    if (index == 0) {
                      Get.to(KPKJobs());
                    }
                    if (index == 1) {
                      Get.to(SindhJobs());
                    }
                    if (index == 2) {
                      Get.to(PunjabJobs());
                    }
                    if (index == 3) {
                      Get.to(BalochistanJobs());
                    }
                    if (index == 4) {
                      Get.to(FedrelJobs());
                    }
                    if (index == 5) {
                      Get.to(BaltistanJobs());
                    }
                  },
                  child: Card(
                    child: Row(
                      children: [
                        Container(
                          height: height * .1,
                          width: width * .5,
                          child: Image.asset(a[index]),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                titleList[index],
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                              ),
                              SizedBox(
                                height: height * .01,
                                width: width,
                              ),
                              Container(
                                width: width,
                                child: Text(
                                  desList[index],
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
