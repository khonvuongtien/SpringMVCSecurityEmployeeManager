package com.kid.j5.model;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Component("recordDAO")
public class RecordDAO {
	
	StaffDAO staffDAO;
	float RecordFilterSize=0;
	@Autowired
	public void setStaffDAO(StaffDAO staffDAO) {
		this.staffDAO = staffDAO;
	}


	SessionFactory sessionFactory;
	//Session session;
		
		@Autowired
		public void setSessionFactory(SessionFactory sessionFactory) {
			this.sessionFactory = sessionFactory;
		
		//System.out.println("set session factory and session");
	}

		public Session session(){
			return sessionFactory.getCurrentSession();
		}
		
		
	public void saveRecord(Staff staff, String reason, int type){
		Record record = new Record();
		DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		LocalDate date = LocalDate.now();
		record.setDate(format.format(date));
		record.setReason(reason);
		record.setType(type);
		record.setStaff(staff);
		session().save(record);
	}
	public void saveRecord(Staff staff, int type){
		Record record = new Record();
		DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		LocalDate date = LocalDate.now();
		record.setDate(format.format(date));
		record.setType(type);
		record.setStaff(staff);
		session().save(record);
	}
	@SuppressWarnings("unchecked")
	public List<Record> getRecordList(int pageNumber){
		List<Record> records ;
		
		Query query = session().createQuery("from Record");
		query.setMaxResults(5);
		if(pageNumber == 1 ){
			query.setFirstResult(0);
		}else{
			query.setFirstResult(pageNumber *4 -5 + pageNumber);
		}
		records = query.list();
		
		
	return records;
}
	public float getTotalRecord(){
		return session().createQuery("from Record").list().size();
	}
	public void deleteRecord(int recordId){
		Record record = (Record)session().get(Record.class, recordId);			
		session().delete(record);
	}
	public Record loadRecord(int recordId){
		Record record = (Record)session().get(Record.class, recordId);			
		return record;
	}
	public void updateRecord(Record record){
		session().update(record);
	}
	
	
	@SuppressWarnings("unchecked")
	public List<Staff> forIndex(){
		Criteria crit = session().createCriteria(Record.class);		
		crit.add(Restrictions.eq("type", 1));
		//crit.setProjection(Projections.distinct(Projections.property("staff")));
		crit.createAlias("staff", "st").setProjection(Projections.distinct(Projections.property("st.StaffId")));
		List<String> staffIds = crit.list();
		List<Staff> staffs = new ArrayList();
		for (int i = 0; i < staffIds.size(); i++) {
			staffs.add(staffDAO.loadStaff(staffIds.get(i)));
		}
		Collections.sort(staffs,new Comparator<Staff>() {

			@Override
			public int compare(Staff o1, Staff o2) {
				
				return countType1(o2)-countType1(o1);
			}
		});		
		//staffs.sort((Staff o1, Staff o2)->o2.getRecord().size()-o1.getRecord().size());
		
		return staffs;
	}
	
	public int countType1(Staff staff){
		int numb = staff.getRecord().size()-session().createQuery("from Record r where r.type = 0 and r.staff.StaffId like '"+staff.getStaffId()+"'").list().size();
		
		return numb;
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<String> getYears(){
		List<String> dates = session().createCriteria(Record.class).setProjection(Projections.distinct(Projections.property("date"))).list();
		List<String> years = new ArrayList();
		Set<String> noDuplicateYears = new HashSet();
		for (int i = 0; i < dates.size(); i++) {
			String[] year = dates.get(i).split("/");
			noDuplicateYears.add(year[0]);		
		}
		years.addAll(noDuplicateYears);
		return years;
	}
	
	public List<Record> getRecordViaDepartNameAndYear(String departName,String year,int pageNumber){
		
		Criteria crit = session().createCriteria(Record.class);
		crit.add(Restrictions.ilike("date", year, MatchMode.START));
		crit.createAlias("staff", "st").createAlias("st.depart", "d").add(Restrictions.eq("d.name", departName));		
		crit.setMaxResults(5);
		if(pageNumber==1){
			crit.setFirstResult(0);
		}else{
			crit.setFirstResult(pageNumber*4-5+pageNumber);
		}
		List<Record> records = crit.list();
		
		RecordFilterSize = crit.list().size();		
		return records;
	}
	
	public float getRecordFilterSize(){
		return RecordFilterSize;
	}
}
