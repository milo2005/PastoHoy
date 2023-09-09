import 'package:flutter/foundation.dart';

import 'package:flutter/foundation.dart';
import 'package:pasto_hoy/domain/account/models/user.dart';

import '../dtos/user_dto.dart';

class UserDtoAdapter {
  static User toModel(UserDto data) => User(
    name: data.name,
    email: data.email,
    password: data.password
  );

  static Future<List<User>> toModelAsync(List<UserDto> data) {
    return compute(
      (entity) => data.map((d) => UserDtoAdapter.toModel(d)).toList(),
      data,
    );
  }

  static UserDto fromModel(User model) => UserDto(
    password: model.password,
    email: model.email,
    name: model.name
  );

  static Future<List<UserDto>> fromModelAsync(List<User> models) {
    return compute(
      (models) => models.map((model) => UserDtoAdapter.fromModel(model)).toList(),
      models,
    );
  }
}
