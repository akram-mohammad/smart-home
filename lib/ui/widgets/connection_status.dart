import 'package:flutter/material.dart';

class ConnectionStatus extends StatefulWidget {
  const ConnectionStatus({Key? key, required this.status, required this.text})
      : super(key: key);
  final String status;
  final String text;

  @override
  _ConnectionStatusState createState() => _ConnectionStatusState();
}

class _ConnectionStatusState extends State<ConnectionStatus> {
  Widget succeeded() {
    return Icon(
      Icons.check,
      color: Theme.of(context).accentColor,
      size: 20.0,
    );
  }

  Widget pendingCircle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Container(
        height: 11,
        width: 11.0,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: Colors.yellow,
        ),
      ),
    );
  }

  Widget failed() {
    return Container(
      padding: EdgeInsets.zero,
      child: Icon(
        Icons.close_rounded,
        color: Colors.red,
        size: 20.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: Row(
        children: [
          widget.status == "pending"
              ? pendingCircle()
              : widget.status == "failed"
                  ? failed()
                  : succeeded(),
          SizedBox(
            width: 10.0,
          ),
          Text(
            widget.text,
            style: TextStyle(fontSize: 15.0),
          )
        ],
      ),
    );
  }
}
