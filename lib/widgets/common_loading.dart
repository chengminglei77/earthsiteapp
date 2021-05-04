import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonLoading extends StatelessWidget {
  const CommonLoading({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
          child: Container(
            child:
              Text('正在加载...'),
      )),
    );
  }
}
