package com.store.model.service;

import static com.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.store.model.dao.StoreDao;
import com.store.model.vo.Category;

public class StoreService {
	
	public ArrayList<Category> selectCategory() {
				
		Connection conn = getConnection();
		
		ArrayList<Category> category = new StoreDao().selectCategory(conn);
		
		close(conn);
		
		return category;
		
	}

}
