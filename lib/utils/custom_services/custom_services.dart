import 'package:flutter/material.dart';

class CustomServices {
  CustomServices._();

  //common loading for all screens
  static Widget showLoading() {
    return  const Center(child:  CircularProgressIndicator.adaptive());
  }

  //common error widget for all screens

  static Widget somethingWentWrong() {
    return const Center(child:  Text('Oops something went wrong!'));
  }

  static Widget divider() {
    return const  Divider(
      height: 0,
      thickness: .4,
      color: Colors.grey,
    );
  }

  static  showToast(context,message){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)));
  }
}
