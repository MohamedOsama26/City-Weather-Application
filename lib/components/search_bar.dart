import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key, required this.onFocus, required this.onSubmit, required this.onChange}) : super(key: key);
  final Function onFocus;
  final Function onSubmit;
  final Function onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: MediaQuery.of(context).size.width-30,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(30),
        // boxShadow:
      ),
      // color: Colors.black12,
      child: TextFormField(
        onChanged: (text){
          onChange();
          print(text);
        },
        onTap: (){
          onFocus();
        },
        onFieldSubmitted: (x){
          if(x=='') {
            onSubmit();
          }
        },
        decoration: const InputDecoration(
          focusColor: Colors.black26,
          iconColor: Colors.black26,
          hoverColor: Colors.black26,
          fillColor: Colors.red,
          icon: Icon(Icons.search),
          border: InputBorder.none,
        ),
        style: const TextStyle(
          color: Colors.black87,
        ),
        cursorColor: Colors.black87,
      ),
    );
  }
}
