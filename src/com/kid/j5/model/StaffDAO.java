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
@Component("staffDAO")
public class StaffDAO {
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
		public List<Staff> getStaffList(int pageNumber){
			List<Staff> staffs ;
			
			Query query = session().createQuery("from Staff");
			query.setMaxResults(5);
			if(pageNumber == 1 ){
				query.setFirstResult(0);
			}else{
				query.setFirstResult(pageNumber *4 -5 + pageNumber);
			}
			staffs = query.list();
			
			
		return staffs;
	}
		public float getTotalStaff(){
			return session().createQuery("from Staff").list().size();
		}
		@SuppressWarnings("unchecked")
		public List<Depart> getDepartName(){
//			Criteria crit = session().createCriteria(Depart.class);
//			crit.setProjection(Projections.distinct(Projections.property("name")));
			return session().createQuery("from Depart").list();
		}
		public void createStaff(Staff staff){
			
			session().save(staff);
			
		}
		public Depart getDepart(String departId){
			return (Depart)session().load(Depart.class, departId);
		}
		
		public void updateStaff(Staff staff){
			session().update(staff);
		}
		public Staff loadStaff(String staffid){
			Staff staff = (Staff)session().get(Staff.class, staffid);			
			
			return staff;
		}
		public void deleteStaff(String staffid){
			Staff staff = (Staff)session().get(Staff.class, staffid);			
			session().delete(staff);
		}
}
