import 'dart:convert';

import 'package:e_commrece_app/core/connstens/const.dart';
import 'package:e_commrece_app/core/services/shared_preferences/shared_pref_manger.dart';
import 'package:e_commrece_app/features/auth/data/model/user_model.dart';

UserModel? getUser() {
  final jsonUser = SharedPrefManger().getString(KUserData);
  if (jsonUser == null) {
    return null;
  }
  return UserModel.fromJson(jsonDecode(jsonUser));
}
