import 'package:flutter/material.dart';

class SortDialogWidget extends StatefulWidget {
  final int sortFrom;
  const SortDialogWidget({Key? key, required this.sortFrom}) : super(key: key);

  @override
  StateSortDialogWidget createState() => StateSortDialogWidget();
}

class StateSortDialogWidget extends State<SortDialogWidget> {
  int? _selected = null;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Material(
      color: Colors.transparent,
      child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding: EdgeInsets.all(15.0),
                decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0))),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Chọn kiểu sắp xếp bạn mong muốn",
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
                    ),
                    widget.sortFrom == 0 ? Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _icon(0, text: "Mới nhất", icon: Icons.newspaper),
                        _icon(1, text: "Phổ biến", icon: Icons.hotel_class_rounded),
                        _icon(2, text: "A-Z", icon: Icons.format_indent_increase),
                        _icon(3, text: "Z-A", icon: Icons.format_indent_decrease),
                      ],
                    ) : Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _icon(0, text: "Giá thấp đến cao", icon: Icons.newspaper),
                        _icon(1, text: "Giá cao đến thấp", icon: Icons.hotel_class_rounded),
                        _icon(2, text: "Phổ biến", icon: Icons.format_indent_increase),
                        _icon(3, text: "Gần đây", icon: Icons.format_indent_decrease),
                        _icon(4, text: "Đã cũ", icon: Icons.format_indent_decrease),
                      ],
                    )
                  ],
                )),
          ]),
    ));
  }

  Widget _icon(int index, {required String text, required IconData icon}) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkResponse(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 30,
              color: _selected == index ? Colors.red : Colors.grey,
            ),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 10.0)),
            Text(text,
                style: TextStyle(
                    fontSize: 20,
                    color: _selected == index ? Colors.red : Colors.grey)),

            Transform.scale(
                scale: 1.2,
                child: Checkbox(
                  checkColor: Colors.white,
                  side: MaterialStateBorderSide.resolveWith(
                    (states) => _selected == index
                        ? BorderSide(width: 1.0, color: Colors.red)
                        : BorderSide(width: 1.0, color: Colors.grey),
                  ),
                  fillColor: MaterialStateProperty.resolveWith(getColor),
                  value: _selected == index ? true : false,
                  onChanged: (bool? value) {
                    setState(() {
                      value == true ? _selected = index : _selected = null;
                    });
                  },
                ))
          ],
        ),
        onTap: () => setState(
          () {
            _selected != index ? _selected = index : _selected = null;
          },
        ),
      ),
    );
  }
}
