package com.library.bookhub.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.library.bookhub.entity.Computer;
import com.library.bookhub.entity.PointOrder;
import com.library.bookhub.entity.User;

@Mapper
public interface PointRepository {
	
	public Integer getUserOrderId(String userName);
	public int ProductOrder(PointOrder pointOrder);
	public User getUser(String userName);
	public int userPointUpdate(User user);
	public List<Computer> getComputerFlag();
	public int computerUsedUpdate(Computer entity);
	public int computerNotUsedUpdate(Computer entity);
	public List<PointOrder> myOrderList(String username);
	public boolean orderRefund(int id);
}
