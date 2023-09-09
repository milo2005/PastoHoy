import 'package:flutter/foundation.dart';

import '../../../domain/login/models/user.dart';
import '../dto/user_dto.dart';

class UserDtoAdapter {
  static User toModel(UserDto data) => User(
    email: data.email,
    password: data.password,
    name: data.name
  );

  static Future<List<User>> toModelAsync(List<UserDto> data) {
    return compute(
      (entity) => data.map((d) => UserDtoAdapter.toModel(d)).toList(),
      data,
    );
  }

  static UserDto fromModel(User model) => UserDto(
    name: model.name,
    password: model.password,
    email: model.email
  );

  static Future<List<UserDto>> fromModelAsync(List<User> models) {
    return compute(
      (models) => models.map((model) => UserDtoAdapter.fromModel(model)).toList(),
      models,
    );
  }
}

