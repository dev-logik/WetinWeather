// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_adapters.dart';

// **************************************************************************
// AdaptersGenerator
// **************************************************************************

class CurrentPollutantModelAdapter extends TypeAdapter<CurrentPollutantModel> {
  @override
  final typeId = 0;

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
  final typeId = 1;

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

class AirQualityConcUnitsAdapter extends TypeAdapter<AirQualityConcUnits> {
  @override
  final typeId = 2;

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

class HourlyWeatherForecastModelAdapter
    extends TypeAdapter<HourlyWeatherForecastModel> {
  @override
  final typeId = 3;

  @override
  HourlyWeatherForecastModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HourlyWeatherForecastModel(
      relativeHumidity: (fields[2] as num).toInt(),
      temperature: (fields[3] as num).toDouble(),
      dewPoint: (fields[1] as num).toDouble(),
      realFeel: (fields[4] as num).toDouble(),
      precipitationProb: (fields[5] as num).toInt(),
      precipitation: (fields[6] as num).toDouble(),
      rain: (fields[7] as num).toDouble(),
      showers: (fields[8] as num).toDouble(),
      snowFall: (fields[9] as num).toDouble(),
      weatherCode: (fields[10] as num).toInt(),
      cloudCover: (fields[11] as num).toInt(),
      windSpeed: (fields[12] as num).toDouble(),
      windDirection: (fields[13] as num).toInt(),
      time: fields[14] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HourlyWeatherForecastModel obj) {
    writer
      ..writeByte(14)
      ..writeByte(1)
      ..write(obj.dewPoint)
      ..writeByte(2)
      ..write(obj.relativeHumidity)
      ..writeByte(3)
      ..write(obj.temperature)
      ..writeByte(4)
      ..write(obj.realFeel)
      ..writeByte(5)
      ..write(obj.precipitationProb)
      ..writeByte(6)
      ..write(obj.precipitation)
      ..writeByte(7)
      ..write(obj.rain)
      ..writeByte(8)
      ..write(obj.showers)
      ..writeByte(9)
      ..write(obj.snowFall)
      ..writeByte(10)
      ..write(obj.weatherCode)
      ..writeByte(11)
      ..write(obj.cloudCover)
      ..writeByte(12)
      ..write(obj.windSpeed)
      ..writeByte(13)
      ..write(obj.windDirection)
      ..writeByte(14)
      ..write(obj.time);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HourlyWeatherForecastModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
