// // import 'package:flutter_test/flutter_test.dart';
// // import 'package:dio/dio.dart';
// // import 'package:recipes_app/data/repo/repository.dart';

// // import 'package:recipes_app/data/service/meal_service.dart';

// // // group: Testleri gruplamak için kullanılır.
// // // setUp: Her testten önce çalıştırılır, ortak hazırlık işlemleri için kullanılır.
// // // test: Her bir test senaryosu burada tanımlanır.
// // // expect: Gerçek değer ile beklenen değeri karşılaştırır.
// import 'package:dio/dio.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:recipes_app/data/repo/repository.dart';
// import 'package:recipes_app/data/service/meal_service.dart';

// void main() {


   
//   // group('MealDetailsRepository', () {
//   //   late MealDetailsRepository repository;
//   //   late MealService mealService;

//   //   setUp(() {
//   //     mealService = MealService(Dio());
//   //     repository = MealDetailsRepository(mealService);
//   //   });

//   //   test('fetchMealDetails verilen kimliğe ilişkin yemek ayrıntılarını döndürür', () async {

//   //     final mealDetails = await repository.fetchMealDetails('52772');
//   //     expect(mealDetails.meals!.first.strMeal, 'Teriyaki Chicken Casserole');
//   //   });

//   //   test('fetchMealDetails, hizmet başarısız olduğunda istisna atar', () async {
//   //     try {
//   //       await repository.fetchMealDetails('invalid_id');
//   //     } catch (e) {
//   //       expect(e, isException);
//   //     }
//   //   });
//   // });

  

// //   group('SearchRepository', () {
// //     late SearchRepository repository;
// //     late MealService mealService;

// //     setUp(() {
// //       mealService = MealService(Dio());
// //       repository = SearchRepository(mealService);
// //     });

// //     test('searchMeal verilen sorguya göre arama sonuçlarını döndürür', () async {
// //       final response = await repository.searchMeal('Spicy');
// //       expect(response.data.meals!.first.strMeal, 'Spicy Arrabiata Penne');
// //       print(response.data.meals!.first.strCategory);
// //     });
 

// //   test('searchMeal, hizmet başarısız olduğunda istisna atar', () async {
// //       try {
// //         await repository.searchMeal('invalid_id');
// //       } catch (e) {
// //         expect(e, isException);
// //       }
// //     });
// // });

//   // group("MealFilterRepository", () {
//   //   late MealFilterRepository repository;
//   //   late MealService mealService;

//   //   setUp(() {
//   //     mealService = MealService(Dio());
//   //     repository = MealFilterRepository(mealService);

//   //   },);

//   //   test('filterMeal verilerini sorguya göre filitreleme sonuçlarını döndürür', () async {
//   //     final response = await repository.filterMeal('Chicken');
//   //     print(response.data.meals!.first.strMeal);
//   //     expect(response.data.meals!.first.strMeal,'15-minute chicken & halloumi burgers');
//   //   },);
//   //   test('filterMeal başarısız olduğunda burası çalışır', () async {
//   //     try {
//   //       await repository.filterMeal('invalid_id'); 
//   //     } catch (e) {
//   //       expect(e, isException);
//   //     }
//   //   },);
//   // },);


// group("MealFilterRepository", () {
//   late MealFilterRepository repository;
//   late MealService mealService;

//   setUp(() {
//     mealService = MealService(Dio());
//     repository = MealFilterRepository(mealService);
//   });

//   test('filterMeal verilerini sorguya göre filtreleme sonuçlarını döndürür', () async {
//     final response = await repository.filterMeal('Chicken');
//     final firstMeal = response.data.meals!.first;

//     print('First Meal: ${firstMeal.strMeal}');
//     expect(firstMeal.strMeal, '15-minute chicken & halloumi burgers');

//     // listCategoryMeal kontrolü
//     final categoryResponse = await repository.listCategoryMeal();
//     expect(categoryResponse.data.meals!.first.strCategory, isNotEmpty);
//     print(categoryResponse.data.meals!.first.strCategory);
    
   
//   });

//   test('filterMeal başarısız olduğunda burası çalışır', () async {
//     try {
//       await repository.filterMeal('invalid_id'); 
//     } catch (e) {
//       expect(e, isException);
//     }
//   });
// });

// //  group("AreaFilterRepository", () {
// //     late AreaFilterRepository repository;
// //     late MealService mealService;

// //     setUp(() {
// //       mealService = MealService(Dio());
// //       repository = AreaFilterRepository(mealService);

// //     },);

// //     test('filterArea verilerini sorguya göre filitreleme sonuçlarını döndürür', () async {
// //       final response = await repository.filterArea('Canadian');
// //       print(response.data.meals!.first.strMeal);
// //       expect(response.data.meals!.first.strMeal,'BeaverTails');
// //     },);
// //     test('filterArea başarısız olduğunda burası çalışır', () async {
// //       try {
// //         await repository.filterArea('invalid_id'); 
// //       } catch (e) {
// //         expect(e, isException);
// //       }
// //     },);
// //   },);

//  group("AreaFilterRepository", () {
//     late AreaFilterRepository repository;
//     late MealService mealService;

//     setUp(() {
//       mealService = MealService(Dio());
//       repository = AreaFilterRepository(mealService);

//     },);

//     test('filterArea verilerini sorguya göre filitreleme sonuçlarını döndürür', () async {
//       final response = await repository.filterArea('Canadian');

//       print(response.data.meals!.first.strMeal);
//       expect(response.data.meals!.first.strMeal,'BeaverTails');

//        // listCategoryMeal kontrolü
//     final areaResponse = await repository.listAreaMeal();
//     expect(areaResponse.data.meals!.first.strArea, isNotEmpty);
//     print(areaResponse.data.meals!.first.strArea);

//     },);
//     test('filterArea başarısız olduğunda burası çalışır', () async {
//       try {
//         await repository.filterArea('invalid_id'); 
//       } catch (e) {
//         expect(e, isException);
//       }
//     },);
//   },);
 


// //  group("RandomRepository", () {
// //   late RandomRepository repository;
// //   late MealService mealService;

// //   setUp(() {
// //     mealService = MealService(Dio());
// //     repository = RandomRepository(mealService);
// //   });

// // test('Random verilerini sorguya göre filtreleme sonuçlarını döndürür', () async {
// //   final response = await repository.getRandomMeal();
// //   final firstMeal = response.data.meals!.first;

// //   // Meal verisinin belirli bir yapıya sahip olup olmadığını kontrol edin
// //   expect(firstMeal.strMeal, isNotNull, reason: 'strMeal boş olmamalıdır');
// //   expect(firstMeal.strMeal, isNotEmpty, reason: 'strMeal boş olmamalıdır');

// //   expect(firstMeal.strCategory, isNotNull, reason: 'strCategory boş olmamalıdır');
// //   expect(firstMeal.strCategory, isNotEmpty, reason: 'strCategory boş olmamalıdır');

// //   expect(firstMeal.strArea, isNotNull, reason: 'strArea boş olmamalıdır');
// //   expect(firstMeal.strArea, isNotEmpty, reason: 'strArea boş olmamalıdır');
// // });

// // // random veriyi test etmek için 2 yöntem 
// // // test('Random verileri belirli bir yapıya sahip olmalıdır', () async {
// // //   final response = await repository.getRandomMeal();
// // //   final firstMeal = response.data.meals!.first;

// // //   // Yanıt yapısının kontrolü
// // //   expect(firstMeal, isA<Meal>(), reason: 'Yanıt bir Meal olmalıdır');
// // //   expect(firstMeal.strMealThumb, isNotNull, reason: 'strMealThumb boş olmamalıdır');
// // //   expect(firstMeal.strInstructions, isNotNull, reason: 'strInstructions boş olmamalıdır');
// // // });

// // // random veriyi test etmek için 3 yöntem 
// // // test('Random verilerini sorguya göre filtreleme sonuçlarını döndürür', () async {
// // //   final response = await repository.getRandomMeal();
// // //   final firstMeal = response.data.meals!.first;

// // //   // Geçerli kategoriler listesi
// // //   const validCategories = ['Beef', 'Vegetarian', 'Chicken', 'Seafood', 'Pasta'];

// // //   // Kategorinin geçerli bir kategori olup olmadığını kontrol edin
// // //   expect(validCategories, contains(firstMeal.strCategory), reason: 'strCategory geçerli bir kategori olmalıdır');
// // // });


// //   test('filterArea başarısız olduğunda burası çalışır', () async {
// //     try {
// //       await repository.getRandomMeal(); 
// //     } catch (e) {
// //       expect(e, isException);
// //     }
// //   });
// // });


// }


