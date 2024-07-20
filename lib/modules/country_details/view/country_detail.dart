import 'package:country_explorer/models/country_model.dart';
import 'package:flutter/material.dart';

class CountryDetail extends StatelessWidget {
  final Country countryDetails;

  const CountryDetail({super.key, required this.countryDetails});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Text(countryDetails.name ?? 'N/A',
            style: Theme
                .of(context)
                .textTheme
                .titleLarge),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: Text(
                  countryDetails.emoji ?? '',
                  style: const TextStyle(fontSize: 220),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Theme.of(context).primaryColor.withOpacity(.2),
                  ),
                  child:Column(
                    children: [
                      getTextWidget("Country Name", countryDetails.name ?? 'N/A',context),
                      getTextWidget("Capital", countryDetails.capital ?? 'N/A',context),
                      getTextWidget("Currency", countryDetails.currency ?? 'N/A',context),
                      getTextWidget("Languages", countryDetails.languagesString ,context),
                    ],
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


  Widget getTextWidget(String label, String value,BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,

        children: [

           Expanded(
            child: Text(
              label,
              style: theme.textTheme.bodyLarge,
            ),
          ),
          const Spacer(),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.left,
              style: theme.textTheme.bodyMedium,
            ),
          ),


        ],
      ),
    );
  }
}
