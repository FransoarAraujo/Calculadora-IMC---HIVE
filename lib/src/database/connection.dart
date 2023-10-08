import 'package:hive_flutter/hive_flutter.dart';
import '../models/imc.dart';
import '../models/imc_adpter.dart';

class Connection {
  static late Box<Imc> imcBox;

  static Future<void> init() async {
    await Hive.initFlutter();
    if (!Hive.isAdapterRegistered(0)) { 
      Hive.registerAdapter(ImcAdapter());
    }
    imcBox = await Hive.openBox<Imc>('imcs');
  }

  static Future<void> closeBox() async {
    await imcBox.close();
  }

  static Future<void> addImc(Imc newImc) async {
  await Connection.imcBox.add(newImc);
}
List<Imc> getAllImcs() {
  return Connection.imcBox.values.toList();
}
Future<void> updateImc(int imcId, Imc updatedImc) async {
  await Connection.imcBox.put(imcId, updatedImc);
}

}
