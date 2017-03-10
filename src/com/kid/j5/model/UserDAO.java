package com.kid.j5.model;

import java.util.List;



import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Component("userDAO")
public class UserDAO {
SessionFactory sessionFactory;
//Session session;
	
	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
}

	public Session session(){
		return sessionFactory.getCurrentSession();
	}

	public void createUser(Authorities auth,User user){
		
		session().save(auth);
		session().save(user);
		
	}
	
	public void updateUser(User user){
		session().update(user);
	}
	

	@SuppressWarnings("unchecked")
	public float getTotalUser(){
			List<User> users = session().createQuery("from User").list();			
		return users.size();
	}
	
	@SuppressWarnings("unchecked")
	public List<User> getUserList(int pageNumber){
		List<User> users;
		List<Authorities> auths;
		Query query = session().createQuery("from User");
		query.setMaxResults(5);
		if(pageNumber == 1 ){
			query.setFirstResult(0);
		}else{
			query.setFirstResult(pageNumber *4 -5 + pageNumber);
		}
		users = query.list();
		 Query query1 = session().createQuery("from Authorities");
		 query1.setMaxResults(5);
			if(pageNumber == 1 ){
				query1.setFirstResult(0);
			}else{
				query1.setFirstResult(pageNumber *4 -5 + pageNumber);
			}
			auths = query1.list();
		for (int i = 0; i < auths.size(); i++) {
			
			if(users.get(i).getUsername().equalsIgnoreCase(auths.get(i).getUsername())){					
				users.get(i).setRole(auths.get(i).getAuthority());
			}
		}
	return users;
}
	
	
	@SuppressWarnings("unchecked")
	public List<String> getAuthorities(){
		Criteria crit = session().createCriteria(Authorities.class);
		crit.setProjection(Projections.distinct(Projections.property("authority")));		
		return crit.list();
	}
	
	public User loadUser(String username){
		User user = (User)session().load(User.class, username);
		Authorities auth =(Authorities) session().load(Authorities.class, username);
		user.setRole(auth.getAuthority());
		return user;
	}
	
	public User getUserViaEmail(String email){
		User user = (User)(session().createQuery("from User e where e.email like '"+email+"'").uniqueResult());
		Authorities auth =(Authorities) session().load(Authorities.class, user.getUsername());
		user.setRole(auth.getAuthority());
		return user;
	}
}
