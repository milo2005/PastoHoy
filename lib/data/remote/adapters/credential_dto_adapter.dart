import 'package:flutter/foundation.dart';

import '../../../domain/account/models/credentias.dart';
import '../dtos/credential_dto.dart';

class CredentialDtoAdapter {
  static Credentials toModel(CredentialDto data) => Credentials(
    email: data.email,
    password: data.password
  );

  static Future<List<Credentials>> toModelAsync(List<CredentialDto> data) {
    return compute(
      (entity) => data.map((data) => CredentialDtoAdapter.toModel(data)).toList(),
      data,
    );
  }

  static CredentialDto fromModel(Credentials model) => CredentialDto(
    password: model.password,
    email: model.email
  );

  static Future<List<CredentialDto>> fromModelAsync(List<Credentials> models) {
    return compute(
      (models) => models.map((model) => CredentialDtoAdapter.fromModel(model)).toList(),
      models,
    );
  }
}
