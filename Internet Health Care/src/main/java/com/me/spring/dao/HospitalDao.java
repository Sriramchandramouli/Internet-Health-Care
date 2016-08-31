package com.me.spring.dao;

import java.util.ArrayList;





import org.hibernate.HibernateException;
import org.hibernate.Query;

import com.me.spring.pojo.Hospital;

public class HospitalDao extends DAO{
	
	@SuppressWarnings("unchecked")
	public ArrayList<Hospital> getHospitalList(String name) throws Exception {
		
		try {
		            begin();
		        	ArrayList <Hospital> hospitalList = new ArrayList<Hospital>();
		            Query q = getSession().createQuery("from hospital_details where username = :username");
		            q.setString("username", name);
		            hospitalList = (ArrayList<Hospital>) q.list();
		            
		            commit();
		            return hospitalList;
		        } catch (HibernateException e) {
		            rollback();
		            throw new Exception("Could not get user " + name, e);
		        }
		
		
		
	}

}
