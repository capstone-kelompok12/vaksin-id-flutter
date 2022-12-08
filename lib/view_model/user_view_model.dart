import 'package:flutter/cupertino.dart';
import 'package:vaksin_id_flutter/models/user_model.dart';
import 'package:vaksin_id_flutter/services/user_service.dart';

class UserViewModel extends ChangeNotifier {
  final userService = UserService();

  // List<UserModel> _userProfile = [];
  // List<UserModel> get userProfile => _userProfile;
  UserModel _user = UserModel();
  UserModel get user => _user;

  getUsersProfile() async {
    final getProfile = await userService.getUserProfile();
    _user = getProfile;
    print('User provider : $_user');
    print(_user.email);
    notifyListeners();
  }
}
