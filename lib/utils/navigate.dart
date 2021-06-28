import 'package:flutter/material.dart';

push({required BuildContext context, required Widget page}) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
}

pushToLogin({required BuildContext context, required Widget page}) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
}

pushNamed({required BuildContext context, required String page}) {
  Navigator.of(context).pushNamed(page);
}

pushReplacementNamed({required BuildContext context, required String page}) {
  Navigator.of(context).pushReplacementNamed(page);
}

pushReplacement({required BuildContext context, required Widget page}) {
  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => page));
}

pushAndRemoveUntil({required BuildContext context, required Widget page}) {
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (context) => page),
    (Route<dynamic> route) => false,
  );
}

pushNamedAndRemoveUntil({required BuildContext context, required String page}) {
  Navigator.of(context).pushNamedAndRemoveUntil(page, (route) => false);
}

pop({required BuildContext context}) {
  Navigator.of(context).pop();
}
