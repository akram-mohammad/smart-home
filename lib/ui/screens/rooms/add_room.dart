import 'package:direct_select_flutter/direct_select_container.dart';
import 'package:direct_select_flutter/direct_select_item.dart';
import 'package:direct_select_flutter/direct_select_list.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/ui/widgets/empty_appbar.dart';

class AddRoom extends StatelessWidget {
  const AddRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: EmptyAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Add New Room',
                      style: TextStyle(
                          fontSize: 28.0, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Room Type:',
                      style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.w600),
                    ),
                    Container(height: 350, width: 100, child: directDropDown())
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

DirectSelectItem<String> getDropDownMenuItem(String value) {
  return DirectSelectItem<String>(
      itemHeight: 56,
      value: value,
      itemBuilder: (context, value) {
        return Text(value);
      });
}

_getDslDecoration() {
  return BoxDecoration(
    border: BorderDirectional(
      bottom: BorderSide(width: 1, color: Colors.black12),
      top: BorderSide(width: 1, color: Colors.black12),
    ),
  );
}

Widget directDropDown() {
  return DirectSelectContainer(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          SizedBox(height: 150.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Container(
                  alignment: AlignmentDirectional.centerStart,
                  margin: EdgeInsets.only(left: 4),
                  child: Text("City"),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                  child: Card(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Expanded(
                            child: Padding(
                                child: DirectSelectList<String>(
                                    values: ['df', 'sdf', 'asdf'],
                                    defaultItemIndex: 3,
                                    itemBuilder: (String value) =>
                                        getDropDownMenuItem(value),
                                    focusedItemDecoration: _getDslDecoration(),
                                    onItemSelectedListener:
                                        (item, index, context) {
                                      Scaffold.of(context).showSnackBar(
                                          SnackBar(content: Text(item)));
                                    }),
                                padding: EdgeInsets.only(left: 12))),
                        Padding(
                          padding: EdgeInsets.only(right: 8),
                          child: Icon(
                            Icons.unfold_more,
                            color: Colors.black38,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
