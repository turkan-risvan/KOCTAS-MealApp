// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'meal_service.dart';

// // **************************************************************************
// // RetrofitGenerator
// // **************************************************************************

// // ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element

// class _MealService implements MealService {
//   _MealService(
//     this._dio, {
//     this.baseUrl,
//   }) {
//     baseUrl ??= 'https://www.themealdb.com/api/json/v1/1/';
//   }

//   final Dio _dio;

//   String? baseUrl;

//   @override
//   Future<SearchModel> searchMeal(String query) async {
//     final _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{r's': query};
//     final _headers = <String, dynamic>{};
//     const Map<String, dynamic>? _data = null;
//     final _result = await _dio
//         .fetch<Map<String, dynamic>>(_setStreamType<SearchModel>(Options(
//       method: 'GET',
//       headers: _headers,
//       extra: _extra,
//     )
//             .compose(
//               _dio.options,
//               'search.php?f=a',
//               queryParameters: queryParameters,
//               data: _data,
//             )
//             .copyWith(
//                 baseUrl: _combineBaseUrls(
//               _dio.options.baseUrl,
//               baseUrl,
//             ))));
//     final _value = SearchModel.fromJson(_result.data!);
//     return _value;
//   }

//   @override
//   Future<MealDetailsModel> getMealDetails(String id) async {
//     final _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{r'i': id};
//     final _headers = <String, dynamic>{};
//     const Map<String, dynamic>? _data = null;
//     final _result = await _dio
//         .fetch<Map<String, dynamic>>(_setStreamType<MealDetailsModel>(Options(
//       method: 'GET',
//       headers: _headers,
//       extra: _extra,
//     )
//             .compose(
//               _dio.options,
//               'lookup.php?i=52772',
//               queryParameters: queryParameters,
//               data: _data,
//             )
//             .copyWith(
//                 baseUrl: _combineBaseUrls(
//               _dio.options.baseUrl,
//               baseUrl,
//             ))));
//     final _value = MealDetailsModel.fromJson(_result.data!);
//     return _value;
//   }

//   @override
//   Future<MealRandomModel> getRandomMeal() async {
//     final _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     const Map<String, dynamic>? _data = null;
//     final _result = await _dio
//         .fetch<Map<String, dynamic>>(_setStreamType<MealRandomModel>(Options(
//       method: 'GET',
//       headers: _headers,
//       extra: _extra,
//     )
//             .compose(
//               _dio.options,
//               'random.php',
//               queryParameters: queryParameters,
//               data: _data,
//             )
//             .copyWith(
//                 baseUrl: _combineBaseUrls(
//               _dio.options.baseUrl,
//               baseUrl,
//             ))));
//     final _value = MealRandomModel.fromJson(_result.data!);
//     return _value;
//   }

//   @override
//   Future<CategoriesModel> getCategories() async {
//     final _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     const Map<String, dynamic>? _data = null;
//     final _result = await _dio
//         .fetch<Map<String, dynamic>>(_setStreamType<CategoriesModel>(Options(
//       method: 'GET',
//       headers: _headers,
//       extra: _extra,
//     )
//             .compose(
//               _dio.options,
//               'categories.php',
//               queryParameters: queryParameters,
//               data: _data,
//             )
//             .copyWith(
//                 baseUrl: _combineBaseUrls(
//               _dio.options.baseUrl,
//               baseUrl,
//             ))));
//     final _value = CategoriesModel.fromJson(_result.data!);
//     return _value;
//   }

//   RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
//     if (T != dynamic &&
//         !(requestOptions.responseType == ResponseType.bytes ||
//             requestOptions.responseType == ResponseType.stream)) {
//       if (T == String) {
//         requestOptions.responseType = ResponseType.plain;
//       } else {
//         requestOptions.responseType = ResponseType.json;
//       }
//     }
//     return requestOptions;
//   }

//   String _combineBaseUrls(
//     String dioBaseUrl,
//     String? baseUrl,
//   ) {
//     if (baseUrl == null || baseUrl.trim().isEmpty) {
//       return dioBaseUrl;
//     }

//     final url = Uri.parse(baseUrl);

//     if (url.isAbsolute) {
//       return url.toString();
//     }

//     return Uri.parse(dioBaseUrl).resolveUri(url).toString();
//   }
// }
