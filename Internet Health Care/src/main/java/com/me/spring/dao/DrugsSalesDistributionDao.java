package com.me.spring.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;

import com.me.spring.pojo.DrugsSalesDistribution;

public class DrugsSalesDistributionDao extends DAO {

	
	@SuppressWarnings("unchecked")
	public List<DrugsSalesDistribution> getAllDrugManfacturer() {
        begin();
        Query q = getSession().createQuery("SELECT drugManufacturerName from DrugsSalesDistribution");
		List<DrugsSalesDistribution> drugManufacturers = q.list();
		commit();
		return drugManufacturers;
	}

	
	@SuppressWarnings("unchecked")
	public List<DrugsSalesDistribution> getSales(String drugManufacturerName) throws Exception {
		try {
            begin();
            Query q = getSession().createQuery("SELECT drugManufacturerName from DrugsSalesDistribution");
            //q.setParameter("drugManufacturerName", drugManufacturerName);
            System.out.println(q.list());
            List<DrugsSalesDistribution> salesInfo =  q.list();
            System.out.println(salesInfo);
            commit();
            return salesInfo;
        } catch (HibernateException e) {
            rollback();
            throw new Exception("Could not get salesInfo " + e.getMessage());
        }
	}
		
	
}
