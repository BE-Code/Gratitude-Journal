import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class Editor extends StatefulWidget {
  @override
  _EditorState createState() => _EditorState();
}

class _EditorState extends State<Editor> {
  final QuillController _controller = QuillController.basic();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Gratitude Journal',
                  style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold)),
              SizedBox(width: 5),
              Icon(Icons.create_rounded, color: Colors.white, size: 25),
              SizedBox(width: 50)
            ],
          ),
          backgroundColor: Colors.blueGrey),
      body: Container(
        child: Column(children: <Widget>[
          QuillSimpleToolbar(controller: _controller),
          Expanded(
            child: Container(
              child: QuillEditor.basic(
                controller: _controller,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
