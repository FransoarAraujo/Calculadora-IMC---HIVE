import 'package:hive/hive.dart';

import 'imc.dart';

class ImcAdapter extends TypeAdapter<Imc> {
  @override
  int get typeId => 0;

  @override
  Imc read(BinaryReader reader) {
    return Imc(
      id: reader.readInt(),
      altuta: reader.readInt(),
      peso: reader.readInt(),
      nome: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, Imc imc) {
    writer.writeInt(imc.id);
    writer.writeInt(imc.altuta);
    writer.writeInt(imc.peso);
    writer.writeString(imc.nome);
  }
}
