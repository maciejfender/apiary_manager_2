import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';

class ApiaryData {
  ApiaryData({
    required this.name,
    required this.creation,
  });

  // static ApiaryData parseFromJson(String json){
  //   final dynamic jsonDecoded = jsonDecode(json);
  //   if(jsonDecoded is Map){
  //     log("message");
  //   }
  //   else
  //   final ApiaryData apiaryData = ApiaryData(name: jsonDecoded['string'], creation: jsonDecoded["creation"]);
  //   return apiaryData;
  // }
  
  String name;
  DateTime creation;
}