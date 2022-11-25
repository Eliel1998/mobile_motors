import 'package:flutter/material.dart';
import 'package:mobile_motors/app/feature/cars/domain/entities/car_entity.dart';

class CarStore{
  
ValueNotifier <List<CarEntity>> cars = ValueNotifier<List<CarEntity>>([]);

void setCars(List<CarEntity> carsList){
  cars.value = carsList;
}

}