import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:manaze/application_controller.dart';
import 'package:manaze/models/transaction.dart';
import 'package:manaze/services/impl/transaction_service_impl.dart';
import 'package:manaze/services/transaction_service.dart';

import 'dummy.dart';
import 'repositories/impl/transaction_repository_impl.dart';
import 'repositories/transaction_repository.dart';

Future<void> locator() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TransactionAdapter());
  Hive.registerAdapter(TransactionTypeAdapter());
  await Hive.openBox<Transaction>('transactions');

  // Repository
  Get.put<TransactionRepository>(TransactionRepositoryImpl());
  // Controller
  Get.put<TransactionService>(
    TransactionServiceImpl(Get.find<TransactionRepository>()),
  );

  Get.put(ApplicationController(
    Get.find<TransactionService>(),
  ));

  await seed();
}
