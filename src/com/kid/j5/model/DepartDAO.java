package com.kid.j5.model;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Component("departDAO")
public class DepartDAO {
	
	SessionFactory sessionFactory;
	//Session session;
		
		@Autowired
		public void setSessionFactory(SessionFactory sessionFactory) {
			this.sessionFactory = sessionFactory;
		
		System.out.println("set session factory and session");
	}

		public Session session(){
			return sessionFactory.getCurrentSession();
		}
		
		
		@SuppressWarnings("unchecked")
		public List<Depart> getDepartList(int pageNumber){
			List<Depart> departs ;
			
			Query query = session().createQuery("from Depart");
			query.setMaxResults(5);
			if(pageNumber == 1 ){
				query.setFirstResult(0);
			}else{
				query.setFirstResult(pageNumber *4 -5 + pageNumber);
			}
			departs = query.list();
			
			
		return departs;
	}

		public float getTotalDepart(){
			return session().createQuery("from Depart").list().size();
		}
		public void createDepart(Depart depart){
			session().save(depart);
		}
		public Depart loadDepart(String departId){
			Depart depart = (Depart)session().get(Depart.class, departId);			
			
			return depart;
		}
		public void updateDepart(Depart depart){
			session().update(depart);
		}
		public void deleteDepart(String departId){
			Depart depart = (Depart)session().get(Depart.class, departId);			
			session().delete(depart);
		}
}
