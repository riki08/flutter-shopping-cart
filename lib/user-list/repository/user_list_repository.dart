import 'package:hive/hive.dart';
import 'package:k11/entities/api_response.dart';
import 'package:k11/entities/user.dart';

import 'package:k11/user-list/data/user_list_repository_iml.dart';
import 'package:k11/utils/api_helper.dart';

class UserListRepository extends UserListRespositoryIml {
  final ApiBaseHelper apiBaseHelper;

  UserListRepository(this.apiBaseHelper);

  @override
  Future<ApiResponse> getUser() async {
    final response = await apiBaseHelper.getHttp('users?page=1');
    if (response.data != null &&
        response.data['data'] != null &&
        response.status == 200) {
      var list =
          (response.data['data'] as List).map((e) => User.fromJson(e)).toList();

      response.data = list;
    }

    return response;
  }

  @override
  Future<ApiResponse> saveUsers(List<User> users) async {
    var box = await Hive.openBox<List<User>>('users-list');
    ApiResponse apiResponse =
        ApiResponse(message: '', data: false, status: 200);
    await box.delete('users');

    await box.put('users', users);

    apiResponse.data = true;

    return apiResponse;
  }
}
