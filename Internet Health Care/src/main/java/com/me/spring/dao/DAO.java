package com.me.spring.dao;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;


public abstract class DAO {
    
	@SuppressWarnings("unchecked")
	public static Session getSession() {
        Session session = (Session) DAO.session.get();
        if (session == null) {
            session = sessionFactory.openSession();
            DAO.session.set(session);
        }
        return session;
    }

		 
	   protected DAO() {
	   }


	   protected void begin() {
	       getSession().beginTransaction();
	   }

	   protected void commit() {
	       getSession().getTransaction().commit();
	   }

	   protected void rollback() {
	       try {
	           getSession().getTransaction().rollback();
	       } catch (HibernateException e) {
	          
	       }
	       try {
	           getSession().close();
	       } catch (HibernateException e) {
	          
	       }
	      
	   }

	   public  void close() {
	       getSession().close();
	   }
		
	   @SuppressWarnings("rawtypes")
	private static final ThreadLocal session = new ThreadLocal();
	   @SuppressWarnings("deprecation")
	private static final SessionFactory sessionFactory = new Configuration().configure("/hibernate.cfg.xml").buildSessionFactory();
	}
