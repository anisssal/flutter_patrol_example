import 'package:collection/collection.dart';
import 'package:flutter_template/domain/entity/weather/city.dart';
import 'package:flutter_template/repository/weather/domain_city_mapper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../test_models/city_models.dart';
import '../../test_models/local_city_data_models.dart';
import '../../test_models/remote_city_models.dart';

void main() {
  late DomainCityMapper domainCityMapper;

  setUp(() {
    domainCityMapper = DomainCityMapperImpl();
  });

  tearDown(() {
    resetMocktailState();
  });

  test(
    "Given local city data, When map called, Then city is returned",
    () {
      // Given
      const localCityData = localCityData1;
      final city = city1;

      // When
      final result = domainCityMapper.map(localCityData);

      // Then
      expect(result, isA<City>());
      expect(result.title, city.title);
      expect(result.lat, city.lat);
      expect(result.lon, city.lon);
      expect(result.state, city.state);
      expect(result.country, city.country);
    },
  );

  test(
    "Given local city data list, When map list called, Then city list is returned",
    () {
      // Given
      final localCityData = allLocalCityDataList;
      final cityList = allCityList;

      // When
      final result = domainCityMapper.mapList(localCityData);

      // Then
      expect(result, isA<List<City>>());
      result.forEachIndexed((index, city) {
        expect(city.title, cityList[index].title);
        expect(city.country, cityList[index].country);
        expect(city.lat, cityList[index].lat);
        expect(city.lon, cityList[index].lon);
      });
    },
  );

  test(
    "Given remote city, When map remote city called, Then city is returned",
    () {
      // Given
      final remoteCityData = remoteCity1;
      final city = city1;

      // When
      final result = domainCityMapper.mapRemoteCity(remoteCityData);

      // Then
      expect(result, isA<City>());
      expect(result.title, city.title);
      expect(result.lat, city.lat);
      expect(result.lon, city.lon);
      expect(result.state, city.state);
      expect(result.country, city.country);
    },
  );

  test(
    "Given local city data list, When map list called, Then city list is returned",
    () {
      // Given
      final remoteCityList = allRemoteCityList;
      final cityList = allCityList;

      // When
      final result = domainCityMapper.mapRemoteCityList(remoteCityList);

      // Then
      expect(result, isA<List<City>>());
      result.forEachIndexed((index, city) {
        expect(city.title, cityList[index].title);
        expect(city.country, cityList[index].country);
        expect(city.lat, cityList[index].lat);
        expect(city.lon, cityList[index].lon);
      });
    },
  );
}
