import 'package:country_explorer/models/country_model.dart';
import 'package:country_explorer/modules/home/provider/country_list_provider.dart';
import 'package:country_explorer/modules/home/widgets/country_widget.dart';
import 'package:country_explorer/modules/home/widgets/search_widget.dart';
import 'package:country_explorer/utils/constants/constants.dart';
import 'package:country_explorer/utils/custom_services/custom_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountryExplorer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ChangeNotifierProvider(
        create: (context) => CountryProvider(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Text(
              appName,
              style: theme.textTheme.titleLarge?.copyWith(color: Colors.white),
            ),
          ),
          body: Consumer<CountryProvider>(builder: (context, provider, child) {
            return provider.isLoading
                ? CustomServices.showLoading()
                : provider.errorMessage.isNotEmpty
                    ? CustomServices.somethingWentWrong()
                    : Column(
                        children: [
                          SearchWidget(onChange: (value) {
                            provider.searchCountries(value);
                          }),
                          provider.getCountryListForBuilder().isEmpty
                              ? Expanded(
                                child: Center(
                                  child: Text("No data found",
                                      style:
                                          Theme.of(context).textTheme.titleMedium),
                                ),
                              )
                              : Expanded(
                                  child: ListView.separated(
                                      separatorBuilder: (context, index) {
                                        return CustomServices.divider();
                                      },
                                      itemCount: provider
                                          .getCountryListForBuilder()
                                          .length,
                                      itemBuilder:
                                          (BuildContext context, index) {
                                        List<Country> countryList =
                                            provider.getCountryListForBuilder();
                                        return CountryWidget(
                                          countryDetails: countryList[index],
                                          onRemove: (BuildContext context){
                                            provider.removeTheCountryFromList(index,context);
                                          },
                                          onTap: () {

                                            provider.onTapCountry(
                                                context, countryList[index]);
                                          },
                                          index: index,
                                        );
                                      }),
                                ),
                        ],
                      );
          }),
        ));
  }
}
