/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, override_on_non_overriding_member, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart' as amplify_core;


/** This is an auto generated class representing the Profile type in your schema. */
class Profile extends amplify_core.Model {
  static const classType = const _ProfileModelType();
  final String id;
  final String? _email;
  final String? _firstName;
  final String? _lastName;
  final String? _homeCity;
  final String? _owner;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  ProfileModelIdentifier get modelIdentifier {
      return ProfileModelIdentifier(
        id: id
      );
  }
  
  String get email {
    try {
      return _email!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get firstName {
    return _firstName;
  }
  
  String? get lastName {
    return _lastName;
  }
  
  String? get homeCity {
    return _homeCity;
  }
  
  String get owner {
    try {
      return _owner!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Profile._internal({required this.id, required email, firstName, lastName, homeCity, required owner, createdAt, updatedAt}): _email = email, _firstName = firstName, _lastName = lastName, _homeCity = homeCity, _owner = owner, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Profile({String? id, required String email, String? firstName, String? lastName, String? homeCity, required String owner}) {
    return Profile._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      email: email,
      firstName: firstName,
      lastName: lastName,
      homeCity: homeCity,
      owner: owner);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Profile &&
      id == other.id &&
      _email == other._email &&
      _firstName == other._firstName &&
      _lastName == other._lastName &&
      _homeCity == other._homeCity &&
      _owner == other._owner;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Profile {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("email=" + "$_email" + ", ");
    buffer.write("firstName=" + "$_firstName" + ", ");
    buffer.write("lastName=" + "$_lastName" + ", ");
    buffer.write("homeCity=" + "$_homeCity" + ", ");
    buffer.write("owner=" + "$_owner" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Profile copyWith({String? email, String? firstName, String? lastName, String? homeCity, String? owner}) {
    return Profile._internal(
      id: id,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      homeCity: homeCity ?? this.homeCity,
      owner: owner ?? this.owner);
  }
  
  Profile copyWithModelFieldValues({
    ModelFieldValue<String>? email,
    ModelFieldValue<String?>? firstName,
    ModelFieldValue<String?>? lastName,
    ModelFieldValue<String?>? homeCity,
    ModelFieldValue<String>? owner
  }) {
    return Profile._internal(
      id: id,
      email: email == null ? this.email : email.value,
      firstName: firstName == null ? this.firstName : firstName.value,
      lastName: lastName == null ? this.lastName : lastName.value,
      homeCity: homeCity == null ? this.homeCity : homeCity.value,
      owner: owner == null ? this.owner : owner.value
    );
  }
  
  Profile.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _email = json['email'],
      _firstName = json['firstName'],
      _lastName = json['lastName'],
      _homeCity = json['homeCity'],
      _owner = json['owner'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'email': _email, 'firstName': _firstName, 'lastName': _lastName, 'homeCity': _homeCity, 'owner': _owner, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'email': _email,
    'firstName': _firstName,
    'lastName': _lastName,
    'homeCity': _homeCity,
    'owner': _owner,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<ProfileModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<ProfileModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final EMAIL = amplify_core.QueryField(fieldName: "email");
  static final FIRSTNAME = amplify_core.QueryField(fieldName: "firstName");
  static final LASTNAME = amplify_core.QueryField(fieldName: "lastName");
  static final HOMECITY = amplify_core.QueryField(fieldName: "homeCity");
  static final OWNER = amplify_core.QueryField(fieldName: "owner");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Profile";
    modelSchemaDefinition.pluralName = "Profiles";
    
    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.PRIVATE,
        provider: amplify_core.AuthRuleProvider.IAM,
        operations: const [
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.UPDATE,
          amplify_core.ModelOperation.DELETE,
          amplify_core.ModelOperation.READ
        ]),
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.OWNER,
        ownerField: "owner",
        identityClaim: "cognito:username",
        provider: amplify_core.AuthRuleProvider.USERPOOLS,
        operations: const [
          amplify_core.ModelOperation.READ,
          amplify_core.ModelOperation.UPDATE,
          amplify_core.ModelOperation.CREATE
        ])
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Profile.EMAIL,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Profile.FIRSTNAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Profile.LASTNAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Profile.HOMECITY,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Profile.OWNER,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _ProfileModelType extends amplify_core.ModelType<Profile> {
  const _ProfileModelType();
  
  @override
  Profile fromJson(Map<String, dynamic> jsonData) {
    return Profile.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Profile';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Profile] in your schema.
 */
class ProfileModelIdentifier implements amplify_core.ModelIdentifier<Profile> {
  final String id;

  /** Create an instance of ProfileModelIdentifier using [id] the primary key. */
  const ProfileModelIdentifier({
    required this.id});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'ProfileModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is ProfileModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}