import 'package:country_explorer/models/country_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class CountryWidget extends StatelessWidget {
  final Country countryDetails;
  final VoidCallback? onTap;
  final Function(BuildContext context)? onRemove;
  final int index;

  const CountryWidget(
      {super.key,
      required this.countryDetails,
      required this.onTap,
      required this.onRemove,
      required this.index,
     });


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Slidable(
        key: ValueKey(index),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed:onRemove,
              backgroundColor: const Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),

          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 8.0, right: 16, top: 8, bottom: 8),
              child: Text(
                countryDetails.emoji ?? '-',
                style: const TextStyle(fontSize: 30),
              ),
            ),
            Text(countryDetails.name ?? 'N/A',style: Theme.of(context).textTheme.bodyMedium,)
          ],
        ),
      ),
    );
  }
}
