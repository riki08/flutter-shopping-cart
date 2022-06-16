import 'package:k11/entities/api_response.dart';
import 'package:k11/entities/user.dart';

abstract class UserListRespositoryIml {
  Future<ApiResponse> getUser();
  Future<ApiResponse> saveUsers(List<User> users);
}
