import 'package:flutter/foundation.dart';
import 'package:pasto_hoy/domain/login/models/credential.dart';

import '../dto/credential_dto.dart';

class CredentialDtoAdapter {
  static Credentials toModel(CredentialDto data) => Credentials(
    password: data.password,
    email: data.email
  );

  static Future<List<Credentials>> toModelAsync(List<CredentialDto> data) {
    return compute(
      (entity) => data.map((d) => CredentialDtoAdapter.toModel(d)).toList(),
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

