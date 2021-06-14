package com.hgkj.model.service;

import com.hgkj.model.entity.Car;

import java.util.List;

public interface CarService {
    int addcarservice(Car car);
    Car onecarservice(Car car);
    List<Car> allcarservice(Car car);
    int updatecarservice(Car car);
    int deletecarservice(Car car);
}