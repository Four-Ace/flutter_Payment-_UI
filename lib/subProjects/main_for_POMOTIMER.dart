import 'dart:async';

import 'package:flutter/material.dart';

const Color maincolor = Color.fromARGB(255, 230, 77, 61);

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool isRunning = false;
  bool isResting = false;
  List<bool> isSelected = List<bool>.filled(5, false);
  late Timer timer;
  int totalseconds = 3599;
  int selectedTime = 3599;
  int cycle = 0;
  int cycleTimes = 0;

  int testselectsecond = 3;
  int testRestsecond = 6;

  void onTick(Timer timer) {
    if (totalseconds == 0) {
      resetTimer();
      setState(() {
        if (isResting == false) {
          cycle = cycle + 1;
          totalseconds = testRestsecond; // for resting time second
          isResting = true;
          rest5min();
        } else {
          isResting = false;
        }
        if (cycle == 4) {
          cycle = 0;
          cycleTimes = cycleTimes + 1;
        }
      });
    } else {
      setState(() {
        totalseconds = totalseconds - 1;
      });
    }
  }

  void onPause() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void onStart() {
    timer = Timer.periodic(const Duration(seconds: 1), onTick);
    setState(() {
      isRunning = true;
    });
  }

  void resetTimer() {
    timer.cancel();
    setState(() {
      isRunning = false;
      totalseconds = selectedTime;
    });
  }

  void ignore() {}

  void setSelected(int index) {
    isSelected = List<bool>.generate(5, (i) => i == index ? true : false);
  }

  void selectTimef(int ftime) {
    setState(() {
      selectedTime = ftime;
      totalseconds = selectedTime;
    });
  }

  void rest5min() {
    setState(() {
      onStart();
    });
  }

  String formatMin(int second) {
    var duration = Duration(seconds: second);
    return duration.toString().split(".").first.substring(2, 4);
  }

  String formatSec(int second) {
    var duration = Duration(seconds: second);
    return duration.toString().split(".").first.substring(5, 7);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: maincolor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 50,
                horizontal: 40,
              ),
              child: Text(
                'POMOTIMER',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  isResting
                      ? 'Rest time for 5 min!\n    (Test for 6 sec)'
                      : '    Select time for\nstart POMOTIMER!',
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                pomotimerLeftTime(
                  number: formatMin(totalseconds),
                  maincolor: maincolor,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Text(
                    ':',
                    style: TextStyle(
                      fontSize: 80,
                      color: Colors.white.withOpacity(0.3),
                    ),
                  ),
                ),
                pomotimerLeftTime(
                  number: formatSec(totalseconds),
                  maincolor: maincolor,
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: isSelected[0]
                          ? Colors.white
                          : Colors.white.withOpacity(0.4),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(5),
                    color: isSelected[0] ? Colors.white : maincolor,
                  ),
                  alignment: Alignment.center,
                  width: 70,
                  height: 50,
                  child: TextButton(
                    onPressed: () {
                      onStart();
                      resetTimer();
                      setSelected(0);
                      selectTimef(testselectsecond);
                    },
                    child: Text(
                      'test for\n3sec',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w900,
                        color: isSelected[0]
                            ? maincolor
                            : Colors.white.withOpacity(0.4),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: isSelected[1]
                          ? Colors.white
                          : Colors.white.withOpacity(0.4),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(5),
                    color: isSelected[1] ? Colors.white : maincolor,
                  ),
                  alignment: Alignment.center,
                  width: 70,
                  height: 50,
                  child: TextButton(
                    onPressed: () {
                      onStart();
                      resetTimer();
                      setSelected(1);
                      selectTimef(20 * 60);
                    },
                    child: Text(
                      '20',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        color: isSelected[1]
                            ? maincolor
                            : Colors.white.withOpacity(0.4),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: isSelected[2]
                          ? Colors.white
                          : Colors.white.withOpacity(0.4),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(5),
                    color: isSelected[2] ? Colors.white : maincolor,
                  ),
                  alignment: Alignment.center,
                  width: 70,
                  height: 50,
                  child: TextButton(
                    onPressed: () {
                      onStart();
                      resetTimer();
                      setSelected(2);
                      selectTimef(25 * 60);
                    },
                    child: Text(
                      '25',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        color: isSelected[2]
                            ? maincolor
                            : Colors.white.withOpacity(0.4),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: isSelected[3]
                          ? Colors.white
                          : Colors.white.withOpacity(0.4),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(5),
                    color: isSelected[3] ? Colors.white : maincolor,
                  ),
                  alignment: Alignment.center,
                  width: 70,
                  height: 50,
                  child: TextButton(
                    onPressed: () {
                      onStart();
                      resetTimer();
                      setSelected(3);
                      selectTimef(30 * 60);
                    },
                    child: Text(
                      '30',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        color: isSelected[3]
                            ? maincolor
                            : Colors.white.withOpacity(0.4),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: isSelected[4]
                          ? Colors.white
                          : Colors.white.withOpacity(0.4),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(5),
                    color: isSelected[4] ? Colors.white : maincolor,
                  ),
                  alignment: Alignment.center,
                  width: 70,
                  height: 50,
                  child: TextButton(
                    onPressed: () {
                      onStart();
                      resetTimer();
                      setSelected(4);
                      selectTimef(35 * 60);
                    },
                    child: Text(
                      '35',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        color: isSelected[4]
                            ? maincolor
                            : Colors.white.withOpacity(0.4),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: isRunning ? Colors.white : maincolor,
                    shape: BoxShape.circle,
                  ),
                  child: Transform.translate(
                    offset: const Offset(-18, -18),
                    child: IconButton(
                      onPressed: isRunning ? onPause : onStart,
                      iconSize: 120,
                      icon: isRunning
                          ? const Icon(
                              Icons.pause_circle,
                            )
                          : const Icon(
                              Icons.play_circle,
                            ),
                      color: isRunning
                          ? const Color.fromARGB(225, 191, 58, 43)
                          : Colors.white,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: isResting ? ignore : resetTimer,
                  icon: const Icon(
                    Icons.refresh,
                    color: Colors.white,
                  ),
                  iconSize: 120,
                ),
              ],
            ),
            const SizedBox(
              height: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                roundNgoal(
                  rg: 'CYCLE\n',
                  count: cycle,
                  maxcount: 4,
                ),
                roundNgoal(
                  rg: '1 ROUND \n= 4 CYCLE',
                  count: cycleTimes,
                  maxcount: 12,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class roundNgoal extends StatelessWidget {
  String rg;
  int count = 0;
  int maxcount = 0;

  roundNgoal({
    super.key,
    required this.rg,
    required this.count,
    required this.maxcount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              '$count',
              style: TextStyle(
                color: Colors.white.withOpacity(0.4),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '/$maxcount',
              style: TextStyle(
                color: Colors.white.withOpacity(0.4),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 25,
        ),
        Text(
          rg,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class selectTime extends StatelessWidget {
  final VoidCallback onPressed;
  int num;
  bool isSelected = false;
  selectTime({
    super.key,
    required this.num,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? Colors.white : Colors.white.withOpacity(0.4),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(5),
        color: isSelected ? Colors.white : maincolor,
      ),
      alignment: Alignment.center,
      width: 70,
      height: 50,
      child: TextButton(
        onPressed: () {
          isSelected = !isSelected;
          onPressed;
        },
        child: Text(
          '$num',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w900,
            color: isSelected ? maincolor : Colors.white.withOpacity(0.4),
          ),
        ),
      ),
    );
  }
}

class pomotimerLeftTime extends StatelessWidget {
  String number;

  final Color maincolor;

  pomotimerLeftTime({
    super.key,
    required this.number,
    required this.maincolor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      alignment: Alignment.center,
      width: 150,
      height: 190,
      child: Text(
        number,
        style: TextStyle(
          fontSize: 100,
          fontWeight: FontWeight.bold,
          color: maincolor,
        ),
      ),
    );
  }
}
