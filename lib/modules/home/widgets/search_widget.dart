import 'package:country_explorer/utils/constants/constants.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {

  final Function(String) onChange;

  const SearchWidget({super.key, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 50,
        child: TextField(
          onChanged: onChange,
          style: Theme.of(context).textTheme.bodyMedium,
          decoration:  InputDecoration(
            hintText:searchCountry,
            hintStyle: Theme.of(context).textTheme.bodyMedium,


            prefixIcon: const Icon(Icons.search),
            border:const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(7.0)),
            ),
          ),
        ),
      ),
    );
  }
}
