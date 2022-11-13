import 'package:emigrar/constants/constantColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProfileRoot extends StatefulWidget {
  const ProfileRoot({Key? key}) : super(key: key);

  @override
  State<ProfileRoot> createState() => _ProfileRootState();
}

class _ProfileRootState extends State<ProfileRoot> {
  @override
  Widget build(BuildContext context) {
    CC cc = CC();
    return Container(
        color: cc.black,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "Hello Trekker",
                  style: TextStyle(
                    color: cc.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
              ),
            ),
            //Row number two for 2458 coins
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.center,
                child: CircularPercentIndicator(
                  radius: 120,
                  lineWidth: 30,
                  percent: 0.75,
                  animation: true,
                  animationDuration: 1000,
                  progressColor: cc.violet,
                  backgroundColor: Colors.deepPurple.shade100,
                  circularStrokeCap: CircularStrokeCap.round,
                  center: Text(
                    '2458 COINS EARNED',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: cc.white,
                    ),
                  ),
                ),
              ),
            ),

            //row 3 for mini progress bar
            Expanded(
                flex: 1,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Container(
                        alignment: Alignment.center,
                        child: CircularPercentIndicator(
                          radius: 50,
                          lineWidth: 15,
                          percent: 0.95,
                          animation: true,
                          animationDuration: 1000,
                          progressColor: Colors.green,
                          backgroundColor: Colors.green.shade100,
                          circularStrokeCap: CircularStrokeCap.round,
                          center: Text(
                            '95%',
                            style: TextStyle(fontSize: 20, color: cc.white),
                          ),
                          footer: new Text(
                            'HeartBeat',
                            style: TextStyle(
                              fontSize: 15,
                              color: cc.white,
                            ),
                          ),
                        ),
                      ),
                    ),

                    //Bar for Distance
                    Expanded(
                      flex: 3,
                      child: Container(
                        alignment: Alignment.center,
                        child: CircularPercentIndicator(
                          radius: 50,
                          lineWidth: 15,
                          percent: 0.53,
                          animation: true,
                          animationDuration: 1000,
                          progressColor: Colors.deepOrange,
                          backgroundColor: Colors.deepOrange.shade100,
                          circularStrokeCap: CircularStrokeCap.round,
                          center: Text(
                            '53%',
                            style: TextStyle(fontSize: 20, color: cc.white),
                          ),
                          footer: new Text(
                            'Distance',
                            style: TextStyle(
                              fontSize: 15,
                              color: cc.white,
                            ),
                          ),
                        ),
                      ),
                    ),

                    //Bar for Altitude
                    Expanded(
                      flex: 3,
                      child: Container(
                        alignment: Alignment.center,
                        child: CircularPercentIndicator(
                          radius: 50,
                          lineWidth: 15,
                          percent: 0.15,
                          animation: true,
                          animationDuration: 1000,
                          progressColor: Colors.blue,
                          backgroundColor: Colors.blue.shade100,
                          circularStrokeCap: CircularStrokeCap.round,
                          center: Text(
                            '15%',
                            style: TextStyle(fontSize: 20, color: cc.white),
                          ),
                          footer: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Text(
                              'Altitude',
                              style: TextStyle(
                                fontSize: 15,
                                color: cc.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),

            Expanded(
              flex: 1,
              child: Container(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: cc.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60)),
                      padding: EdgeInsets.all(16),
                    ),
                    onPressed: () {
                      Fluttertoast.showToast(
                        msg: "Comming Soon",
                        toastLength: Toast.LENGTH_SHORT,
                      );
                    },
                    child: Text(
                      '                    SOS                    ',
                      style: TextStyle(fontSize: 24),
                    ),
                  )),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "Logout",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
