import 'dart:async';

main() async {
  print("start");

  var some = await doSomething();
  
  print("${some} done");
}

Future<String> doSomething() async {
  var task = heavyTask(); /* 重い非同期処理 */

  print("${await oneSecondTick()}");
  print("${await oneSecondTick()}");
  print("${await oneSecondTick()}");
  print("${await oneSecondTick()}");
  print("${await oneSecondTick()}");
  print("${await oneSecondTick()}");

  print("${await task}"); /* 重い処理待ち */
  
  return "something";
}

const oneSecond = Duration(seconds: 1);
const fiveSecond = Duration(seconds: 5);

Future<bool> oneSecondTick() async {
  await Future.delayed(oneSecond);
  return true;
}

/* 非同期で動く */
Future<bool> heavyTask() async {
  await Future.delayed(fiveSecond); /* 非同期で5秒待ち */ 
  print("heavy task1");
  await Future.delayed(fiveSecond); /* 非同期で5秒待ち */ 
  print("heavy task2");
  return true;
}
