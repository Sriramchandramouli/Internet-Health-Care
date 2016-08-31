package com.me.spring.dao;



import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.Restrictions;

import com.me.spring.pojo.Doctor;
import com.me.spring.pojo.User;

public class UserDao extends DAO{
	
	public User queryUserByNameAndPassword(String username, String password)
            throws Exception {
        try {
            begin();
            Query q = getSession().createQuery("from User where username = :username and password = :password");
            q.setString("username", username);
            q.setString("password", password);
            User user = (User) q.uniqueResult();
            commit();
            return user;
        } catch (HibernateException e) {
            rollback();
            throw new Exception("Could not get user " + username, e);
        }
    }
	
	public User queryUserByNameAndEmail(String username, String email)
            throws Exception {
        try {
            begin();
            Query q = getSession().createQuery("from User where username = :username or email = :email");
            q.setString("username", username);
            q.setString("email", email);
            User user = (User) q.uniqueResult();
            commit();
            return user;
        } catch (HibernateException e) {
            rollback();
            throw new Exception("Could not get user " + username, e);
        }
    }
	
	public User createNewUser(String username, String password, String gender, String role, String email, int age, String secretquestion, String answer) throws Exception {
		
		try {
            begin();
            User user = new User();
            user.setUsername(username);
            user.setPassword(password);
            user.setGender(gender);
            user.setRole(role);
            user.setEmail(email);
            user.setAge(age);
            user.setSecretquestion(secretquestion);
            user.setAnswer(answer);
            getSession().save(user);
            commit();
            return user;
        } catch (HibernateException e) {
            rollback();
            throw new Exception("Could not get user " + username, e);
        }
		
	}
	
	@SuppressWarnings("unchecked")
	public List<User> getSearchResult(String username, String email) {
		
		Criteria cr = getSession().createCriteria(User.class);
		Disjunction or = Restrictions.disjunction();
		//Conjunction and = Restrictions.conjunction();
		
		if (username != null)
	        or.add(Restrictions.ilike("username", username+"%"));
	      if (email != null)
	        or.add(Restrictions.ilike("email", "%"+email));
	      

	      cr.add(or);

	      return (List<User>) cr.list();      
		
	}
	
	public void changePassword(String password, String newPassword, int userid) throws Exception{
		try {
		begin();
		Query q = getSession().createQuery("update User set password = :newPassword where userid = :userid AND password = :password");
		q.setString("newPassword",newPassword);
		q.setString("password", password);
		q.setInteger("userid", userid);
		q.executeUpdate();
		
		commit();
		
		} catch (HibernateException e) {
            rollback();
            throw new Exception("Could not get user ", e);
	}

	}
	
	public String getAnswer(String username) throws Exception{
		try {
		begin();
		Query q = getSession().createQuery("select answer from User where username = :username");
		q.setString("username", username);
		String answer = (String) q.uniqueResult();
		commit();
		return answer;
		
		} catch (HibernateException e) {
            rollback();
            throw new Exception("Could not get user ", e);
	}

	}
	
	public void changePassword1(String newPassword, String answer, String username) throws Exception{
		try {
		begin();
		Query q = getSession().createQuery("update User set password = :newPassword where username = :username AND answer = :answer");
		q.setString("newPassword", newPassword);
		q.setString("answer", answer);
		q.setString("username", username);
		q.executeUpdate();
		
		commit();
		
		} catch (HibernateException e) {
            rollback();
            throw new Exception("Could not get user ", e);
	}

	}

}
