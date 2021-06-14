package com.hgkj.model.service.impl;

import com.hgkj.model.dao.CarMapper;
import com.hgkj.model.entity.Car;
import com.hgkj.model.service.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class CarServiceimpl implements CarService {
    @Autowired
    private CarMapper carMapper;

    public void setCarMapper(CarMapper carMapper) {
        this.carMapper = carMapper;
    }

    @Override
    public int addcarservice(Car car) {
        return carMapper.addcar(car);
    }

    @Override
    public Car onecarservice(Car car) {
        return carMapper.onecar(car);
    }

    @Override
    public List<Car> allcarservice(Car car) {
        return carMapper.allcar(car);
    }

    @Override
    public int updatecarservice(Car car) {
        return carMapper.updatecar(car);
    }

    @Override
    public int deletecarservice(Car car) {
        return carMapper.deletecar(car);
    }
}