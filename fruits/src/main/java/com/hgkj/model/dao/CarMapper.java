package com.hgkj.model.dao;

import com.hgkj.model.entity.Car;

import java.util.List;

public interface CarMapper {
   int addcar(Car car);
   Car onecar(Car car);
   List<Car> allcar(Car car);
   int updatecar(Car car);
   int deletecar(Car car);
}