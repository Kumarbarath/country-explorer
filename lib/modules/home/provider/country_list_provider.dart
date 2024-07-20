import 'package:country_explorer/models/country_model.dart';
import 'package:country_explorer/modules/country_details/view/country_detail.dart';
import 'package:country_explorer/network/services/country_network_service.dart';
import 'package:country_explorer/utils/custom_services/custom_services.dart';
import 'package:flutter/material.dart';

class CountryProvider extends ChangeNotifier {
  bool _isLoading = true;
  String _errorMessage = '';
  List<Country> _countryList = [];
  List<Country> _searchList = [];
  String _searchText = '';

  bool get isLoading => _isLoading;

  String get searchText => _searchText;

  String get errorMessage => _errorMessage;

  List<Country> get countryList => _countryList;

  List<Country> get searchList => _searchList;

  CountryProvider() {
    getCountryList();
  }

  List<Country> getCountryListForBuilder() {
    if (searchText.isNotEmpty) {
      return searchList;
    } else {
      return countryList;
    }
  }

  void searchCountries(String query) {
    _searchText = query;
    if (query.isNotEmpty) {
      _searchList = [];
      _searchList = countryList
          .where((country) =>
          country.name!.toLowerCase().contains(query.toLowerCase()))
          .toList();
      notifyListeners();
    }
  }

  getCountryList() async {
    try {
      _isLoading = true;
      _countryList = await CountryNetworkService().getCountryList();
      _isLoading = false;
    } catch (e) {
      _errorMessage = e.toString();
    }
    notifyListeners();
  }

  removeTheCountryFromList(index, context) {
    //If search is in progress remove element from both list
    if (_searchText.isNotEmpty) {
     Country resp =  _countryList.firstWhere((element) =>
      element.name!.toLowerCase() == _searchList[index].name!.toLowerCase());
     _searchList.removeAt(index);
     _countryList.removeWhere((element)=>element.name?.toLowerCase()==resp.name?.toLowerCase());
    }else{
      _countryList.removeAt(index);
    }
    CustomServices.showToast(context, "Item removed successfully");
    notifyListeners();
  }

  onTapCountry(BuildContext context, Country countryDetail) {
    FocusManager.instance.primaryFocus?.unfocus();

    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => CountryDetail(countryDetails: countryDetail)));
  }
}
