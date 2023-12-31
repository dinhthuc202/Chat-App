// // GENERATED CODE - DO NOT MODIFY BY HAND
//
// part of 'phone_number_entity.dart';
//
// // **************************************************************************
// // IsarCollectionGenerator
// // **************************************************************************
//
// // coverage:ignore-file
// // ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types
//
// extension GetPhoneNumberEntityCollection on Isar {
//   IsarCollection<PhoneNumberEntity> get phoneNumberEntitys => this.collection();
// }
//
// const PhoneNumberEntitySchema = CollectionSchema(
//   name: r'PhoneNumberEntity',
//   id: 5091447672906576251,
//   properties: {
//     r'contry': PropertySchema(
//       id: 0,
//       name: r'contry',
//       type: IsarType.string,
//     ),
//     r'firstNumber': PropertySchema(
//       id: 1,
//       name: r'firstNumber',
//       type: IsarType.string,
//     ),
//     r'idContry': PropertySchema(
//       id: 2,
//       name: r'idContry',
//       type: IsarType.string,
//     ),
//     r'phoneNumber': PropertySchema(
//       id: 3,
//       name: r'phoneNumber',
//       type: IsarType.string,
//     )
//   },
//   estimateSize: _phoneNumberEntityEstimateSize,
//   serialize: _phoneNumberEntitySerialize,
//   deserialize: _phoneNumberEntityDeserialize,
//   deserializeProp: _phoneNumberEntityDeserializeProp,
//   idName: r'id',
//   indexes: {
//     r'phoneNumber': IndexSchema(
//       id: 5414128966131364535,
//       name: r'phoneNumber',
//       unique: false,
//       replace: false,
//       properties: [
//         IndexPropertySchema(
//           name: r'phoneNumber',
//           type: IndexType.value,
//           caseSensitive: true,
//         )
//       ],
//     )
//   },
//   links: {
//     r'phones': LinkSchema(
//       id: 6344217283716561608,
//       name: r'phones',
//       target: r'PhoneNumberEntity',
//       single: false,
//     )
//   },
//   embeddedSchemas: {},
//   getId: _phoneNumberEntityGetId,
//   getLinks: _phoneNumberEntityGetLinks,
//   attach: _phoneNumberEntityAttach,
//   version: '3.1.0',
// );
//
// int _phoneNumberEntityEstimateSize(
//   PhoneNumberEntity object,
//   List<int> offsets,
//   Map<Type, List<int>> allOffsets,
// ) {
//   var bytesCount = offsets.last;
//   {
//     final value = object.contry;
//     if (value != null) {
//       bytesCount += 3 + value.length * 3;
//     }
//   }
//   {
//     final value = object.firstNumber;
//     if (value != null) {
//       bytesCount += 3 + value.length * 3;
//     }
//   }
//   {
//     final value = object.idContry;
//     if (value != null) {
//       bytesCount += 3 + value.length * 3;
//     }
//   }
//   {
//     final value = object.phoneNumber;
//     if (value != null) {
//       bytesCount += 3 + value.length * 3;
//     }
//   }
//   return bytesCount;
// }
//
// void _phoneNumberEntitySerialize(
//   PhoneNumberEntity object,
//   IsarWriter writer,
//   List<int> offsets,
//   Map<Type, List<int>> allOffsets,
// ) {
//   writer.writeString(offsets[0], object.contry);
//   writer.writeString(offsets[1], object.firstNumber);
//   writer.writeString(offsets[2], object.idContry);
//   writer.writeString(offsets[3], object.phoneNumber);
// }
//
// PhoneNumberEntity _phoneNumberEntityDeserialize(
//   Id id,
//   IsarReader reader,
//   List<int> offsets,
//   Map<Type, List<int>> allOffsets,
// ) {
//   final object = PhoneNumberEntity(
//     contry: reader.readStringOrNull(offsets[0]),
//     firstNumber: reader.readStringOrNull(offsets[1]),
//     idContry: reader.readStringOrNull(offsets[2]),
//     phoneNumber: reader.readStringOrNull(offsets[3]),
//   );
//   object.id = id;
//   return object;
// }
//
// P _phoneNumberEntityDeserializeProp<P>(
//   IsarReader reader,
//   int propertyId,
//   int offset,
//   Map<Type, List<int>> allOffsets,
// ) {
//   switch (propertyId) {
//     case 0:
//       return (reader.readStringOrNull(offset)) as P;
//     case 1:
//       return (reader.readStringOrNull(offset)) as P;
//     case 2:
//       return (reader.readStringOrNull(offset)) as P;
//     case 3:
//       return (reader.readStringOrNull(offset)) as P;
//     default:
//       throw IsarError('Unknown property with id $propertyId');
//   }
// }
//
// Id _phoneNumberEntityGetId(PhoneNumberEntity object) {
//   return object.id;
// }
//
// List<IsarLinkBase<dynamic>> _phoneNumberEntityGetLinks(
//     PhoneNumberEntity object) {
//   return [object.phones];
// }
//
// void _phoneNumberEntityAttach(
//     IsarCollection<dynamic> col, Id id, PhoneNumberEntity object) {
//   object.id = id;
//   object.phones
//       .attach(col, col.isar.collection<PhoneNumberEntity>(), r'phones', id);
// }
//
// extension PhoneNumberEntityQueryWhereSort
//     on QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QWhere> {
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterWhere> anyId() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addWhereClause(const IdWhereClause.any());
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterWhere>
//       anyPhoneNumber() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addWhereClause(
//         const IndexWhereClause.any(indexName: r'phoneNumber'),
//       );
//     });
//   }
// }
//
// extension PhoneNumberEntityQueryWhere
//     on QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QWhereClause> {
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterWhereClause>
//       idEqualTo(Id id) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addWhereClause(IdWhereClause.between(
//         lower: id,
//         upper: id,
//       ));
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterWhereClause>
//       idNotEqualTo(Id id) {
//     return QueryBuilder.apply(this, (query) {
//       if (query.whereSort == Sort.asc) {
//         return query
//             .addWhereClause(
//               IdWhereClause.lessThan(upper: id, includeUpper: false),
//             )
//             .addWhereClause(
//               IdWhereClause.greaterThan(lower: id, includeLower: false),
//             );
//       } else {
//         return query
//             .addWhereClause(
//               IdWhereClause.greaterThan(lower: id, includeLower: false),
//             )
//             .addWhereClause(
//               IdWhereClause.lessThan(upper: id, includeUpper: false),
//             );
//       }
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterWhereClause>
//       idGreaterThan(Id id, {bool include = false}) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addWhereClause(
//         IdWhereClause.greaterThan(lower: id, includeLower: include),
//       );
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterWhereClause>
//       idLessThan(Id id, {bool include = false}) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addWhereClause(
//         IdWhereClause.lessThan(upper: id, includeUpper: include),
//       );
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterWhereClause>
//       idBetween(
//     Id lowerId,
//     Id upperId, {
//     bool includeLower = true,
//     bool includeUpper = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addWhereClause(IdWhereClause.between(
//         lower: lowerId,
//         includeLower: includeLower,
//         upper: upperId,
//         includeUpper: includeUpper,
//       ));
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterWhereClause>
//       phoneNumberIsNull() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addWhereClause(IndexWhereClause.equalTo(
//         indexName: r'phoneNumber',
//         value: [null],
//       ));
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterWhereClause>
//       phoneNumberIsNotNull() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addWhereClause(IndexWhereClause.between(
//         indexName: r'phoneNumber',
//         lower: [null],
//         includeLower: false,
//         upper: [],
//       ));
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterWhereClause>
//       phoneNumberEqualTo(String? phoneNumber) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addWhereClause(IndexWhereClause.equalTo(
//         indexName: r'phoneNumber',
//         value: [phoneNumber],
//       ));
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterWhereClause>
//       phoneNumberNotEqualTo(String? phoneNumber) {
//     return QueryBuilder.apply(this, (query) {
//       if (query.whereSort == Sort.asc) {
//         return query
//             .addWhereClause(IndexWhereClause.between(
//               indexName: r'phoneNumber',
//               lower: [],
//               upper: [phoneNumber],
//               includeUpper: false,
//             ))
//             .addWhereClause(IndexWhereClause.between(
//               indexName: r'phoneNumber',
//               lower: [phoneNumber],
//               includeLower: false,
//               upper: [],
//             ));
//       } else {
//         return query
//             .addWhereClause(IndexWhereClause.between(
//               indexName: r'phoneNumber',
//               lower: [phoneNumber],
//               includeLower: false,
//               upper: [],
//             ))
//             .addWhereClause(IndexWhereClause.between(
//               indexName: r'phoneNumber',
//               lower: [],
//               upper: [phoneNumber],
//               includeUpper: false,
//             ));
//       }
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterWhereClause>
//       phoneNumberGreaterThan(
//     String? phoneNumber, {
//     bool include = false,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addWhereClause(IndexWhereClause.between(
//         indexName: r'phoneNumber',
//         lower: [phoneNumber],
//         includeLower: include,
//         upper: [],
//       ));
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterWhereClause>
//       phoneNumberLessThan(
//     String? phoneNumber, {
//     bool include = false,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addWhereClause(IndexWhereClause.between(
//         indexName: r'phoneNumber',
//         lower: [],
//         upper: [phoneNumber],
//         includeUpper: include,
//       ));
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterWhereClause>
//       phoneNumberBetween(
//     String? lowerPhoneNumber,
//     String? upperPhoneNumber, {
//     bool includeLower = true,
//     bool includeUpper = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addWhereClause(IndexWhereClause.between(
//         indexName: r'phoneNumber',
//         lower: [lowerPhoneNumber],
//         includeLower: includeLower,
//         upper: [upperPhoneNumber],
//         includeUpper: includeUpper,
//       ));
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterWhereClause>
//       phoneNumberStartsWith(String PhoneNumberPrefix) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addWhereClause(IndexWhereClause.between(
//         indexName: r'phoneNumber',
//         lower: [PhoneNumberPrefix],
//         upper: ['$PhoneNumberPrefix\u{FFFFF}'],
//       ));
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterWhereClause>
//       phoneNumberIsEmpty() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addWhereClause(IndexWhereClause.equalTo(
//         indexName: r'phoneNumber',
//         value: [''],
//       ));
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterWhereClause>
//       phoneNumberIsNotEmpty() {
//     return QueryBuilder.apply(this, (query) {
//       if (query.whereSort == Sort.asc) {
//         return query
//             .addWhereClause(IndexWhereClause.lessThan(
//               indexName: r'phoneNumber',
//               upper: [''],
//             ))
//             .addWhereClause(IndexWhereClause.greaterThan(
//               indexName: r'phoneNumber',
//               lower: [''],
//             ));
//       } else {
//         return query
//             .addWhereClause(IndexWhereClause.greaterThan(
//               indexName: r'phoneNumber',
//               lower: [''],
//             ))
//             .addWhereClause(IndexWhereClause.lessThan(
//               indexName: r'phoneNumber',
//               upper: [''],
//             ));
//       }
//     });
//   }
// }
//
// extension PhoneNumberEntityQueryFilter
//     on QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QFilterCondition> {
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterFilterCondition>
//       contryIsNull() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(const FilterCondition.isNull(
//         property: r'contry',
//       ));
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterFilterCondition>
//       contryIsNotNull() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(const FilterCondition.isNotNull(
//         property: r'contry',
//       ));
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterFilterCondition>
//       contryEqualTo(
//     String? value, {
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.equalTo(
//         property: r'contry',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterFilterCondition>
//       contryGreaterThan(
//     String? value, {
//     bool include = false,
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.greaterThan(
//         include: include,
//         property: r'contry',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterFilterCondition>
//       contryLessThan(
//     String? value, {
//     bool include = false,
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.lessThan(
//         include: include,
//         property: r'contry',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterFilterCondition>
//       contryBetween(
//     String? lower,
//     String? upper, {
//     bool includeLower = true,
//     bool includeUpper = true,
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.between(
//         property: r'contry',
//         lower: lower,
//         includeLower: includeLower,
//         upper: upper,
//         includeUpper: includeUpper,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterFilterCondition>
//       contryStartsWith(
//     String value, {
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.startsWith(
//         property: r'contry',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterFilterCondition>
//       contryEndsWith(
//     String value, {
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.endsWith(
//         property: r'contry',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterFilterCondition>
//       contryContains(String value, {bool caseSensitive = true}) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.contains(
//         property: r'contry',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterFilterCondition>
//       contryMatches(String pattern, {bool caseSensitive = true}) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.matches(
//         property: r'contry',
//         wildcard: pattern,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterFilterCondition>
//       contryIsEmpty() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.equalTo(
//         property: r'contry',
//         value: '',
//       ));
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterFilterCondition>
//       contryIsNotEmpty() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.greaterThan(
//         property: r'contry',
//         value: '',
//       ));
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterFilterCondition>
//       firstNumberIsNull() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(const FilterCondition.isNull(
//         property: r'firstNumber',
//       ));
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterFilterCondition>
//       firstNumberIsNotNull() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(const FilterCondition.isNotNull(
//         property: r'firstNumber',
//       ));
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterFilterCondition>
//       firstNumberEqualTo(
//     String? value, {
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.equalTo(
//         property: r'firstNumber',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterFilterCondition>
//       firstNumberGreaterThan(
//     String? value, {
//     bool include = false,
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.greaterThan(
//         include: include,
//         property: r'firstNumber',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterFilterCondition>
//       firstNumberLessThan(
//     String? value, {
//     bool include = false,
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.lessThan(
//         include: include,
//         property: r'firstNumber',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterFilterCondition>
//       firstNumberBetween(
//     String? lower,
//     String? upper, {
//     bool includeLower = true,
//     bool includeUpper = true,
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.between(
//         property: r'firstNumber',
//         lower: lower,
//         includeLower: includeLower,
//         upper: upper,
//         includeUpper: includeUpper,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterFilterCondition>
//       firstNumberStartsWith(
//     String value, {
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.startsWith(
//         property: r'firstNumber',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterFilterCondition>
//       firstNumberEndsWith(
//     String value, {
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.endsWith(
//         property: r'firstNumber',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterFilterCondition>
//       firstNumberContains(String value, {bool caseSensitive = true}) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.contains(
//         property: r'firstNumber',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterFilterCondition>
//       firstNumberMatches(String pattern, {bool caseSensitive = true}) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.matches(
//         property: r'firstNumber',
//         wildcard: pattern,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterFilterCondition>
//       firstNumberIsEmpty() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.equalTo(
//         property: r'firstNumber',
//         value: '',
//       ));
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterFilterCondition>
//       firstNumberIsNotEmpty() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.greaterThan(
//         property: r'firstNumber',
//         value: '',
//       ));
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterFilterCondition>
//       idEqualTo(Id value) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.equalTo(
//         property: r'id',
//         value: value,
//       ));
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterFilterCondition>
//       idGreaterThan(
//     Id value, {
//     bool include = false,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.greaterThan(
//         include: include,
//         property: r'id',
//         value: value,
//       ));
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterFilterCondition>
//       idLessThan(
//     Id value, {
//     bool include = false,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.lessThan(
//         include: include,
//         property: r'id',
//         value: value,
//       ));
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterFilterCondition>
//       idBetween(
//     Id lower,
//     Id upper, {
//     bool includeLower = true,
//     bool includeUpper = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.between(
//         property: r'id',
//         lower: lower,
//         includeLower: includeLower,
//         upper: upper,
//         includeUpper: includeUpper,
//       ));
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterFilterCondition>
//       idContryIsNull() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(const FilterCondition.isNull(
//         property: r'idContry',
//       ));
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterFilterCondition>
//       idContryIsNotNull() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(const FilterCondition.isNotNull(
//         property: r'idContry',
//       ));
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterFilterCondition>
//       idContryEqualTo(
//     String? value, {
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.equalTo(
//         property: r'idContry',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterFilterCondition>
//       idContryGreaterThan(
//     String? value, {
//     bool include = false,
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.greaterThan(
//         include: include,
//         property: r'idContry',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterFilterCondition>
//       idContryLessThan(
//     String? value, {
//     bool include = false,
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.lessThan(
//         include: include,
//         property: r'idContry',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterFilterCondition>
//       idContryBetween(
//     String? lower,
//     String? upper, {
//     bool includeLower = true,
//     bool includeUpper = true,
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.between(
//         property: r'idContry',
//         lower: lower,
//         includeLower: includeLower,
//         upper: upper,
//         includeUpper: includeUpper,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterFilterCondition>
//       idContryStartsWith(
//     String value, {
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.startsWith(
//         property: r'idContry',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterFilterCondition>
//       idContryEndsWith(
//     String value, {
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.endsWith(
//         property: r'idContry',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterFilterCondition>
//       idContryContains(String value, {bool caseSensitive = true}) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.contains(
//         property: r'idContry',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterFilterCondition>
//       idContryMatches(String pattern, {bool caseSensitive = true}) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.matches(
//         property: r'idContry',
//         wildcard: pattern,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterFilterCondition>
//       idContryIsEmpty() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.equalTo(
//         property: r'idContry',
//         value: '',
//       ));
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterFilterCondition>
//       idContryIsNotEmpty() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.greaterThan(
//         property: r'idContry',
//         value: '',
//       ));
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterFilterCondition>
//       phoneNumberIsNull() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(const FilterCondition.isNull(
//         property: r'phoneNumber',
//       ));
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterFilterCondition>
//       phoneNumberIsNotNull() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(const FilterCondition.isNotNull(
//         property: r'phoneNumber',
//       ));
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterFilterCondition>
//       phoneNumberEqualTo(
//     String? value, {
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.equalTo(
//         property: r'phoneNumber',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterFilterCondition>
//       phoneNumberGreaterThan(
//     String? value, {
//     bool include = false,
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.greaterThan(
//         include: include,
//         property: r'phoneNumber',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterFilterCondition>
//       phoneNumberLessThan(
//     String? value, {
//     bool include = false,
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.lessThan(
//         include: include,
//         property: r'phoneNumber',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterFilterCondition>
//       phoneNumberBetween(
//     String? lower,
//     String? upper, {
//     bool includeLower = true,
//     bool includeUpper = true,
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.between(
//         property: r'phoneNumber',
//         lower: lower,
//         includeLower: includeLower,
//         upper: upper,
//         includeUpper: includeUpper,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterFilterCondition>
//       phoneNumberStartsWith(
//     String value, {
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.startsWith(
//         property: r'phoneNumber',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterFilterCondition>
//       phoneNumberEndsWith(
//     String value, {
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.endsWith(
//         property: r'phoneNumber',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterFilterCondition>
//       phoneNumberContains(String value, {bool caseSensitive = true}) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.contains(
//         property: r'phoneNumber',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterFilterCondition>
//       phoneNumberMatches(String pattern, {bool caseSensitive = true}) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.matches(
//         property: r'phoneNumber',
//         wildcard: pattern,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterFilterCondition>
//       phoneNumberIsEmpty() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.equalTo(
//         property: r'phoneNumber',
//         value: '',
//       ));
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterFilterCondition>
//       phoneNumberIsNotEmpty() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.greaterThan(
//         property: r'phoneNumber',
//         value: '',
//       ));
//     });
//   }
// }
//
// extension PhoneNumberEntityQueryObject
//     on QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QFilterCondition> {}
//
// extension PhoneNumberEntityQueryLinks
//     on QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QFilterCondition> {
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterFilterCondition>
//       phones(FilterQuery<PhoneNumberEntity> q) {
//     return QueryBuilder.apply(this, (query) {
//       return query.link(q, r'phones');
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterFilterCondition>
//       phonesLengthEqualTo(int length) {
//     return QueryBuilder.apply(this, (query) {
//       return query.linkLength(r'phones', length, true, length, true);
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterFilterCondition>
//       phonesIsEmpty() {
//     return QueryBuilder.apply(this, (query) {
//       return query.linkLength(r'phones', 0, true, 0, true);
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterFilterCondition>
//       phonesIsNotEmpty() {
//     return QueryBuilder.apply(this, (query) {
//       return query.linkLength(r'phones', 0, false, 999999, true);
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterFilterCondition>
//       phonesLengthLessThan(
//     int length, {
//     bool include = false,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.linkLength(r'phones', 0, true, length, include);
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterFilterCondition>
//       phonesLengthGreaterThan(
//     int length, {
//     bool include = false,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.linkLength(r'phones', length, include, 999999, true);
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterFilterCondition>
//       phonesLengthBetween(
//     int lower,
//     int upper, {
//     bool includeLower = true,
//     bool includeUpper = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.linkLength(
//           r'phones', lower, includeLower, upper, includeUpper);
//     });
//   }
// }
//
// extension PhoneNumberEntityQuerySortBy
//     on QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QSortBy> {
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterSortBy>
//       sortByContry() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'contry', Sort.asc);
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterSortBy>
//       sortByContryDesc() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'contry', Sort.desc);
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterSortBy>
//       sortByFirstNumber() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'firstNumber', Sort.asc);
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterSortBy>
//       sortByFirstNumberDesc() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'firstNumber', Sort.desc);
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterSortBy>
//       sortByIdContry() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'idContry', Sort.asc);
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterSortBy>
//       sortByIdContryDesc() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'idContry', Sort.desc);
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterSortBy>
//       sortByPhoneNumber() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'phoneNumber', Sort.asc);
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterSortBy>
//       sortByPhoneNumberDesc() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'phoneNumber', Sort.desc);
//     });
//   }
// }
//
// extension PhoneNumberEntityQuerySortThenBy
//     on QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QSortThenBy> {
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterSortBy>
//       thenByContry() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'contry', Sort.asc);
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterSortBy>
//       thenByContryDesc() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'contry', Sort.desc);
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterSortBy>
//       thenByFirstNumber() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'firstNumber', Sort.asc);
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterSortBy>
//       thenByFirstNumberDesc() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'firstNumber', Sort.desc);
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterSortBy> thenById() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'id', Sort.asc);
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterSortBy>
//       thenByIdDesc() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'id', Sort.desc);
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterSortBy>
//       thenByIdContry() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'idContry', Sort.asc);
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterSortBy>
//       thenByIdContryDesc() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'idContry', Sort.desc);
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterSortBy>
//       thenByPhoneNumber() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'phoneNumber', Sort.asc);
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QAfterSortBy>
//       thenByPhoneNumberDesc() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'phoneNumber', Sort.desc);
//     });
//   }
// }
//
// extension PhoneNumberEntityQueryWhereDistinct
//     on QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QDistinct> {
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QDistinct>
//       distinctByContry({bool caseSensitive = true}) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addDistinctBy(r'contry', caseSensitive: caseSensitive);
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QDistinct>
//       distinctByFirstNumber({bool caseSensitive = true}) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addDistinctBy(r'firstNumber', caseSensitive: caseSensitive);
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QDistinct>
//       distinctByIdContry({bool caseSensitive = true}) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addDistinctBy(r'idContry', caseSensitive: caseSensitive);
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QDistinct>
//       distinctByPhoneNumber({bool caseSensitive = true}) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addDistinctBy(r'phoneNumber', caseSensitive: caseSensitive);
//     });
//   }
// }
//
// extension PhoneNumberEntityQueryProperty
//     on QueryBuilder<PhoneNumberEntity, PhoneNumberEntity, QQueryProperty> {
//   QueryBuilder<PhoneNumberEntity, int, QQueryOperations> idProperty() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addPropertyName(r'id');
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, String?, QQueryOperations> contryProperty() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addPropertyName(r'contry');
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, String?, QQueryOperations>
//       firstNumberProperty() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addPropertyName(r'firstNumber');
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, String?, QQueryOperations>
//       idContryProperty() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addPropertyName(r'idContry');
//     });
//   }
//
//   QueryBuilder<PhoneNumberEntity, String?, QQueryOperations>
//       phoneNumberProperty() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addPropertyName(r'phoneNumber');
//     });
//   }
// }
