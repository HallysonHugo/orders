// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetConfigModelCollection on Isar {
  IsarCollection<ConfigModel> get configModels => this.collection();
}

const ConfigModelSchema = CollectionSchema(
  name: r'ConfigModel',
  id: -752269032857087123,
  properties: {
    r'baseUrl': PropertySchema(
      id: 0,
      name: r'baseUrl',
      type: IsarType.string,
    ),
    r'connectionType': PropertySchema(
      id: 1,
      name: r'connectionType',
      type: IsarType.byte,
      enumMap: _ConfigModelconnectionTypeEnumValueMap,
    )
  },
  estimateSize: _configModelEstimateSize,
  serialize: _configModelSerialize,
  deserialize: _configModelDeserialize,
  deserializeProp: _configModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _configModelGetId,
  getLinks: _configModelGetLinks,
  attach: _configModelAttach,
  version: '3.1.0+1',
);

int _configModelEstimateSize(
  ConfigModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.baseUrl.length * 3;
  return bytesCount;
}

void _configModelSerialize(
  ConfigModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.baseUrl);
  writer.writeByte(offsets[1], object.connectionType.index);
}

ConfigModel _configModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ConfigModel();
  object.baseUrl = reader.readString(offsets[0]);
  object.connectionType = _ConfigModelconnectionTypeValueEnumMap[
          reader.readByteOrNull(offsets[1])] ??
      ConnectionType.http;
  object.id = id;
  return object;
}

P _configModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (_ConfigModelconnectionTypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          ConnectionType.http) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _ConfigModelconnectionTypeEnumValueMap = {
  'http': 0,
  'https': 1,
};
const _ConfigModelconnectionTypeValueEnumMap = {
  0: ConnectionType.http,
  1: ConnectionType.https,
};

Id _configModelGetId(ConfigModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _configModelGetLinks(ConfigModel object) {
  return [];
}

void _configModelAttach(
    IsarCollection<dynamic> col, Id id, ConfigModel object) {
  object.id = id;
}

extension ConfigModelQueryWhereSort
    on QueryBuilder<ConfigModel, ConfigModel, QWhere> {
  QueryBuilder<ConfigModel, ConfigModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ConfigModelQueryWhere
    on QueryBuilder<ConfigModel, ConfigModel, QWhereClause> {
  QueryBuilder<ConfigModel, ConfigModel, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ConfigModel, ConfigModel, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<ConfigModel, ConfigModel, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ConfigModel, ConfigModel, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ConfigModel, ConfigModel, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ConfigModelQueryFilter
    on QueryBuilder<ConfigModel, ConfigModel, QFilterCondition> {
  QueryBuilder<ConfigModel, ConfigModel, QAfterFilterCondition> baseUrlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'baseUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ConfigModel, ConfigModel, QAfterFilterCondition>
      baseUrlGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'baseUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ConfigModel, ConfigModel, QAfterFilterCondition> baseUrlLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'baseUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ConfigModel, ConfigModel, QAfterFilterCondition> baseUrlBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'baseUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ConfigModel, ConfigModel, QAfterFilterCondition>
      baseUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'baseUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ConfigModel, ConfigModel, QAfterFilterCondition> baseUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'baseUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ConfigModel, ConfigModel, QAfterFilterCondition> baseUrlContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'baseUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ConfigModel, ConfigModel, QAfterFilterCondition> baseUrlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'baseUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ConfigModel, ConfigModel, QAfterFilterCondition>
      baseUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'baseUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<ConfigModel, ConfigModel, QAfterFilterCondition>
      baseUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'baseUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<ConfigModel, ConfigModel, QAfterFilterCondition>
      connectionTypeEqualTo(ConnectionType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'connectionType',
        value: value,
      ));
    });
  }

  QueryBuilder<ConfigModel, ConfigModel, QAfterFilterCondition>
      connectionTypeGreaterThan(
    ConnectionType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'connectionType',
        value: value,
      ));
    });
  }

  QueryBuilder<ConfigModel, ConfigModel, QAfterFilterCondition>
      connectionTypeLessThan(
    ConnectionType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'connectionType',
        value: value,
      ));
    });
  }

  QueryBuilder<ConfigModel, ConfigModel, QAfterFilterCondition>
      connectionTypeBetween(
    ConnectionType lower,
    ConnectionType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'connectionType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ConfigModel, ConfigModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ConfigModel, ConfigModel, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ConfigModel, ConfigModel, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ConfigModel, ConfigModel, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ConfigModelQueryObject
    on QueryBuilder<ConfigModel, ConfigModel, QFilterCondition> {}

extension ConfigModelQueryLinks
    on QueryBuilder<ConfigModel, ConfigModel, QFilterCondition> {}

extension ConfigModelQuerySortBy
    on QueryBuilder<ConfigModel, ConfigModel, QSortBy> {
  QueryBuilder<ConfigModel, ConfigModel, QAfterSortBy> sortByBaseUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseUrl', Sort.asc);
    });
  }

  QueryBuilder<ConfigModel, ConfigModel, QAfterSortBy> sortByBaseUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseUrl', Sort.desc);
    });
  }

  QueryBuilder<ConfigModel, ConfigModel, QAfterSortBy> sortByConnectionType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'connectionType', Sort.asc);
    });
  }

  QueryBuilder<ConfigModel, ConfigModel, QAfterSortBy>
      sortByConnectionTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'connectionType', Sort.desc);
    });
  }
}

extension ConfigModelQuerySortThenBy
    on QueryBuilder<ConfigModel, ConfigModel, QSortThenBy> {
  QueryBuilder<ConfigModel, ConfigModel, QAfterSortBy> thenByBaseUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseUrl', Sort.asc);
    });
  }

  QueryBuilder<ConfigModel, ConfigModel, QAfterSortBy> thenByBaseUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseUrl', Sort.desc);
    });
  }

  QueryBuilder<ConfigModel, ConfigModel, QAfterSortBy> thenByConnectionType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'connectionType', Sort.asc);
    });
  }

  QueryBuilder<ConfigModel, ConfigModel, QAfterSortBy>
      thenByConnectionTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'connectionType', Sort.desc);
    });
  }

  QueryBuilder<ConfigModel, ConfigModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ConfigModel, ConfigModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension ConfigModelQueryWhereDistinct
    on QueryBuilder<ConfigModel, ConfigModel, QDistinct> {
  QueryBuilder<ConfigModel, ConfigModel, QDistinct> distinctByBaseUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'baseUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ConfigModel, ConfigModel, QDistinct> distinctByConnectionType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'connectionType');
    });
  }
}

extension ConfigModelQueryProperty
    on QueryBuilder<ConfigModel, ConfigModel, QQueryProperty> {
  QueryBuilder<ConfigModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ConfigModel, String, QQueryOperations> baseUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'baseUrl');
    });
  }

  QueryBuilder<ConfigModel, ConnectionType, QQueryOperations>
      connectionTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'connectionType');
    });
  }
}
