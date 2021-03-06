import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoNumberKeyboard extends StatefulWidget {
  @override
  _DemoNumberKeyboard createState() => _DemoNumberKeyboard();
}

class _DemoNumberKeyboard extends State<DemoNumberKeyboard> {
  TextEditingController testInput = TextEditingController();

  Widget title(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Text(title, style: TextStyle(fontSize: 14, color: Colors.grey)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        title("基础用法"),
        NButton(
          text: "弹出默认键盘",
          type: "primary",
          onClick: () {
            NumberKeyboard(
              title: "默认键盘",
              closeButtomText: "完成",
              extraKey: ".",
            ).show(context);
          },
        ),
        title("双向绑定"),
        Field(
          placeholder: "点此输入",
          controller: testInput,
          readonly: true,
          onClick: () {
            NumberKeyboard(
                value: testInput.text,
                maxlength: 6,
                closeButtomText: "完成",
                extraKey: ".",
                onChange: (String val) {
                  setState(() {
                    testInput.text = val;
                  });
                }).show(context);
          },
        ),
      ],
    ));
  }
}
