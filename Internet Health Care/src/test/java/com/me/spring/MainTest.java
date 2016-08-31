package com.me.spring;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.me.spring.dao.HibernateUtil;
import com.me.spring.pojo.User;

public class MainTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Session session = HibernateUtil.getSessionFactory().openSession();
		
		Transaction t = session.beginTransaction();
		
	//	User user = new User();
		
		t.commit();
		session.close();
		
		System.out.println("Success");

	}

}
