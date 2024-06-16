import 'question.dart';
class Allquestion{
  int _qnumber=0;
  List<Questions> _questionbank=[
    Questions(q:'Sharks are mammals.',a:false),
    Questions(q:'Sea otters have a favorite rock they use to break open food',a:true),
    Questions(q:'The blue whale is the biggest animal to have ever lived',a:true),
    Questions(q:'The hummingbird egg is the world\'s smallest bird egg',a:true),
    Questions(q:'Sea otters have a favorite rock they use to break open food',a:false),
  ];

  reset(){
    _qnumber=-1;
  }
  getqnumber(){
    return _qnumber;
  }
  getlength(){
    return _questionbank.length;
  }

  void nextquestion(){
    if(_qnumber<_questionbank.length-1){
      _qnumber++;
    }
  }
  String getquestion([void nextquestion]){
    return _questionbank[_qnumber].questiontext;
  }
  bool getanswer(){
    return _questionbank[_qnumber].questionanswer;
  }
  iconstop(){
    if(_qnumber<_questionbank.length-1){

    }
  }
}