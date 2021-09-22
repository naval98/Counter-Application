import 'dart:io';

void main(List<String> arguments) {
  int operationvalue;
  int function;
  bool stop = false;
  String? tempinput;
  LBSIMCounter lbsimCounter;

  // take input for incrementvalue    string? !=string

  print('please enter username');
  tempinput = stdin.readLineSync();

  if (tempinput != null && tempinput.isNotEmpty) {
    lbsimCounter = LBSIMCounter(
      username: tempinput,
      count: 100,
    );
  } else {
    return;
  }
  while (!stop) {
    print('enter operational value');
    tempinput = stdin.readLineSync();

    if (tempinput != null && tempinput.isNotEmpty) {
      print('tempinput is :$tempinput');
      operationvalue = int.parse(tempinput);
    } else {
      operationvalue = 0;
    }

    print('''
   enter your choice
   0. print value
   1. Increment
   2. Decrement
   3. change username
   4. Multiply
   5. Divide
   6. Remainder
   10. stop the operation 
''');

    tempinput = stdin.readLineSync();

    if (tempinput != null && tempinput.isNotEmpty) {
      function = int.parse(tempinput);
    } else {
      function = -1;
    }

    print('starting counter with value:${lbsimCounter.count}');

    switch (function) {
      case 0:
        print(lbsimCounter.count);
        break;
      case 1:
        incrementCounter(counter: lbsimCounter, incrementvalue: operationvalue);
        break;
      case 2:
        decrementCounter(counter: lbsimCounter, decrementvalue: operationvalue);
        break;
      case 3:
        changeusername(counter: lbsimCounter);
        break;
      case 4:
        multiplycounter(counter: lbsimCounter, multiplyvalue: operationvalue);
        break;
      case 5:
        divideCounter(counter: lbsimCounter, dividevalue: operationvalue);
        break;
      case 6:
        remainderCounter(counter: lbsimCounter, remaindervalue: operationvalue);
        break;
      case 10:
        stop = true;
        break;
      default:
        print('Are kuch to kr');
    }
    print(
        'current value of count is ${lbsimCounter.count} by ${lbsimCounter.username}');
  }
  print(
      'final current value of count is ${lbsimCounter.count} ${lbsimCounter.username}');
}

void changeusername({required LBSIMCounter counter}) {
  String? tempinput = stdin.readLineSync();
  if (tempinput != null && tempinput.isNotEmpty) {
    print('New user is :$tempinput');
    counter.username = tempinput;
  }
}

void incrementCounter(
    {required LBSIMCounter counter, required int incrementvalue}) {
  counter.count = counter.count + incrementvalue;
}

void decrementCounter(
    {required LBSIMCounter counter, required int decrementvalue}) {
  counter.count = counter.count - decrementvalue;
}

void multiplycounter(
    {required LBSIMCounter counter, required int multiplyvalue}) {
  counter.count = counter.count * multiplyvalue;
}

void divideCounter({required LBSIMCounter counter, required int dividevalue}) {
  counter.count = counter.count ~/ dividevalue;
}

void remainderCounter(
    {required LBSIMCounter counter, required int remaindervalue}) {
  counter.count = counter.count % remaindervalue;
}

class LBSIMCounter {
  int count;
  String username;

  LBSIMCounter({required this.count, required this.username});
}
