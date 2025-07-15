// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_adapters.dart';

// **************************************************************************
// AdaptersGenerator
// **************************************************************************

class AirQualityConcUnitsAdapter extends TypeAdapter<AirQualityConcUnits> {
  @override
  final typeId = 12;

  @override
  AirQualityConcUnits read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return AirQualityConcUnits.microgramsPerCubicMeter;
      case 1:
        return AirQualityConcUnits.partsPerBillion;
      default:
        return AirQualityConcUnits.microgramsPerCubicMeter;
    }
  }

  @override
  void write(BinaryWriter writer, AirQualityConcUnits obj) {
    switch (obj) {
      case AirQualityConcUnits.microgramsPerCubicMeter:
        writer.writeByte(0);
      case AirQualityConcUnits.partsPerBillion:
        writer.writeByte(1);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AirQualityConcUnitsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CurrentPollutantModelAdapter extends TypeAdapter<CurrentPollutantModel> {
  @override
  final typeId = 13;

  @override
  CurrentPollutantModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CurrentPollutantModel(
      pollutantName: fields[0] as String,
      pollutantConcentration: (fields[2] as num).toDouble(),
      pollutantSymbol: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CurrentPollutantModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.pollutantName)
      ..writeByte(1)
      ..write(obj.pollutantSymbol)
      ..writeByte(2)
      ..write(obj.pollutantConcentration);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CurrentPollutantModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CurrentWeatherVariableModelAdapter
    extends TypeAdapter<CurrentWeatherVariableModel> {
  @override
  final typeId = 14;

  @override
  CurrentWeatherVariableModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CurrentWeatherVariableModel(
      jsonName: fields[0] as String,
      displayName: fields[1] as String,
      unit: fields[2] as String,
      value: fields[3] as num,
    );
  }

  @override
  void write(BinaryWriter writer, CurrentWeatherVariableModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.jsonName)
      ..writeByte(1)
      ..write(obj.displayName)
      ..writeByte(2)
      ..write(obj.unit)
      ..writeByte(3)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CurrentWeatherVariableModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
