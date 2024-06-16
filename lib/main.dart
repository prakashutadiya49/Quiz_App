import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizzler/questionbank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'questionbank.dart';
Allquestion q1=Allquestion();
void main() {
  runApp(
    MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[900],
          /*appBar: AppBar(
          scrolledUnderElevation: 25,
            backgroundColor: Colors.red,
            title: Text(
              'Quizzer',
              style: GoogleFonts.abyssinicaSil(
                textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ),*/
          body: const quiz(),
        ),
      ),
    ),
  );
}

// ignore: camel_case_types
class quiz extends StatefulWidget {
  const quiz({super.key});

  @override
  State<quiz> createState() => _quizState();
}

// ignore: camel_case_types
class _quizState extends State<quiz> {
  bool uanswer = true;
    List<Icon> l1 = [];

  Isfinished(){
    print(q1.getqnumber()+1);
    print("\n");
    print(q1.getlength());
    if(q1.getqnumber()+1==q1.getlength()){
      Alert(
        context: context,
        type: AlertType.success,
        title: "QUIZ OVER",
        desc: "congratulations",
        buttons: [
          DialogButton(
            color: Colors.green,
            child: Text(
              "RESTART",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();

      //Alert(context: context, title: "Alert", desc: "quiz is over\nRESTART").show();
      q1.reset();
      l1.clear();

    }

  }
    showicon() {
    if (uanswer == q1.getanswer()) {
      print(uanswer);
        l1.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
      }
      else {
        print(uanswer);
        l1.add(
          Icon(
            Icons.close_sharp,
            color: Colors.red,
          ),
        );
      }
    Isfinished();

  }
    @override
    Widget build(BuildContext context) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 6,
            child: Center(
              child: Text(
                q1.getquestion(),
                textAlign: TextAlign.center,
                style: GoogleFonts.abhayaLibre(
                  textStyle: TextStyle(fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
            child: Card(
              //height: 70,
              margin: EdgeInsets.all(10),
              color: Colors.green,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    uanswer = true;
                    showicon();
                    q1.nextquestion();
                  });
                },
                child: Text(
                  'True',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ),
          // SizedBox(
          //  height: ,
          //),
          Expanded(
            child: Card(
              margin: EdgeInsets.all(10),
              color: Colors.red,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    uanswer = false;
                    showicon();
                    q1.nextquestion();
                  });
                },
                child: Text(
                  'False',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ),
          Row(
            children: l1,
          )
        ],
      );
    }
  }

