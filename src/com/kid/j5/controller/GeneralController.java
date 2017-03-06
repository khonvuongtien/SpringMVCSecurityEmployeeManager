package com.kid.j5.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kid.j5.model.Authorities;
import com.kid.j5.model.Depart;
import com.kid.j5.model.DepartDAO;
import com.kid.j5.model.Record;
import com.kid.j5.model.RecordDAO;
import com.kid.j5.model.Staff;
import com.kid.j5.model.StaffDAO;
import com.kid.j5.model.User;
import com.kid.j5.model.UserDAO;

@Controller
@Component("generalController")
public class GeneralController {

	UserDAO userDAO;
	StaffDAO staffDAO;
	DepartDAO departDAO;
	RecordDAO recordDAO;
	@Autowired
	ServletContext context;
	@Autowired
	MailSender mailSender;

	@Autowired
	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
		//System.out.println("set dao");
	}
	
	
	@Autowired
	public void setStaffDAO(StaffDAO staffDAO) {
		this.staffDAO = staffDAO;
	}


	@Autowired
	public void setDepartDAO(DepartDAO departDAO) {
		this.departDAO = departDAO;
	}

	
	@Autowired
	public void setRecordDAO(RecordDAO recordDAO) {
		this.recordDAO = recordDAO;
	}


	@RequestMapping("/index")
	public String showindex(Model model) {
		
		
		return "redirect:/";
	}
	
	@RequestMapping("/")
	public String defaultPage(Model model){
		List<Staff> list1 = new ArrayList();
		List<Staff> list2 = new ArrayList();
		List<Staff> list3 = new ArrayList();
		List<Staff> defaultList = recordDAO.forIndex();
		//System.out.println("size:"+defaultList.size());
		for (int i = 0; i <2; i++) {
			if(defaultList.size()>i){
				list1.add(defaultList.get(i));			
				//System.out.println("iflist1: "+list1.get(0).getStaffId());
			}else{
				model.addAttribute("list1",list1);
//				System.out.println("elselist1: "+list1.get(0).getStaffId());
				return "index";
			}
		}
		for (int i = 2; i <6 ; i++) {
			if(defaultList.size()>i){
				list2.add(defaultList.get(i));
//				System.out.println("iflist2: "+list2.get(0).getStaffId());
			}else{
				model.addAttribute("list1",list1);
				model.addAttribute("list2",list2);
//				System.out.println("elselist2: "+list2.get(0).getStaffId());
				return "index";
			}
		}
		for (int i = 6; i < 10; i++) {
			if(defaultList.size()>i){
				list3.add(defaultList.get(i));
//				System.out.println("iflist3");
			}else{
				model.addAttribute("list1",list1);
				model.addAttribute("list2",list2);
				model.addAttribute("list3",list3);
//				System.out.println("elselist3");
				return "index";
			}
		}

		model.addAttribute("list1",list1);
		model.addAttribute("list2",list2);
		model.addAttribute("list3",list3);
		return "index";
	}

	@RequestMapping("/QuanLyTaiKhoan")
	public String showQuanLyTaiKhoan(Model model, HttpServletRequest request) {
		model.addAttribute("userList", userDAO.getUserList(Integer.parseInt(request.getParameter("page"))));
		model.addAttribute("user", new User("", "", "", "", "admin"));
		float totalPage = userDAO.getTotalUser()/5;
		model.addAttribute("totalPage",((int)Math.ceil(totalPage)));
		
		return "QuanLyTaiKhoan";
	}
	
//	public String showPageQuanLyTaiKhoan(Model model , HttpServletRequest request){
//		model.addAttribute("userList", userDAO.getUserList(Integer.parseInt(request.getParameter("page"))));
//		model.addAttribute("user", new User("", "", "", "", "admin"));
//		return "QuanLyTaiKhoan";
//	}

	@ModelAttribute("authorities")
	public Map<String, String> getAuthorities() {
		Map<String, String> map = new HashMap();
		userDAO.getAuthorities().forEach(e -> {
			map.put(e, e);
		});
		return map;
	}

	@RequestMapping("/TaoTaiKhoan")
	public String createUser(HttpServletRequest request, Model model, @Valid User user, BindingResult result) {
		if (result.hasErrors()) {
			model.addAttribute("userList", userDAO.getUserList(1));
			float totalPage = userDAO.getTotalUser()/5;
			model.addAttribute("totalPage",((int)Math.ceil(totalPage)));

			return "QuanLyTaiKhoan";
		} else {

			if (request.getParameter("action").equals("create")) {
				Authorities auth = new Authorities(user.getRole(), user.getUsername());
				userDAO.createUser(auth, user);
				model.addAttribute("userList", userDAO.getUserList(1));
				model.addAttribute("user", new User("", "", "", "", "admin"));
				float totalPage = userDAO.getTotalUser()/5;
				model.addAttribute("totalPage",((int)Math.ceil(totalPage)));

			} else {
				userDAO.updateUser(user);
				model.addAttribute("userList", userDAO.getUserList(1));
				model.addAttribute("user", new User("", "", "", "", "admin"));
				float totalPage = userDAO.getTotalUser()/5;
				model.addAttribute("totalPage",((int)Math.ceil(totalPage)));
			}

			return "QuanLyTaiKhoan";
		}
	}

	@RequestMapping(value = "/ThongTinTaiKhoan", method = RequestMethod.GET)
	public String getUserDetail(HttpServletRequest request, Model model) {
		User user = userDAO.loadUser(request.getParameter("name"));
		model.addAttribute("userList", userDAO.getUserList(1));
		model.addAttribute("user", user);
		float totalPage = userDAO.getTotalUser()/5;
		model.addAttribute("totalPage",((int)Math.ceil(totalPage)));
		// model.addAttribute("user",new User("","","","","admin"));
		return "QuanLyTaiKhoan";
	}
	
	@RequestMapping(value="/QuanLyNhanVien", method=RequestMethod.GET)
	public String getStaffs(Model model, HttpServletRequest request){
		List<Staff> staffs = staffDAO.getStaffList(Integer.parseInt(request.getParameter("page")));
		model.addAttribute("staffList", staffs);
		model.addAttribute("staff", new Staff());
		float totalPage = staffDAO.getTotalStaff()/5;
		model.addAttribute("totalPage",((int)Math.ceil(totalPage)) );
		return "QuanLyNhanVien";
	}
	@ModelAttribute("departs")
	public List<Depart> getDeparts(){
		return staffDAO.getDepartName();
	}
	@ModelAttribute("years")
	public List<String> getYears(){
		return recordDAO.getYears();
	}
	@RequestMapping("/TaoNhanVien")
	public String taoNhanVien(HttpServletRequest request,@RequestParam MultipartFile image, Model model, @Valid Staff staff, BindingResult result){
		if (result.hasErrors()) {
			model.addAttribute("staffList", staffDAO.getStaffList(1));
			float totalPage = staffDAO.getTotalStaff()/5;
			model.addAttribute("totalPage",((int)Math.ceil(totalPage)) );
			return "QuanLyNhanVien";
		} else {

			if (request.getParameter("action").equals("create")) {
				byte[] b;
				String imgName = "";
				try {
					b = image.getBytes();
				imgName = staff.getStaffName()+staff.getDepart().getDepartId()+".jpg";
					BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(new File(context.getRealPath("/WEB-INF/jsps/images/")+imgName)));
					bos.write(b);
					bos.flush();
					bos.close();
					
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} 
				staff.setPhoto(context.getContextPath()+"/static/images/"+imgName);
				staff.setDepart(staffDAO.getDepart(staff.getDepart().getDepartId()));
				staffDAO.createStaff(staff);
				model.addAttribute("staffList", staffDAO.getStaffList(1));
				model.addAttribute("staff", new Staff("","","M","","","","","") );
				float totalPage = staffDAO.getTotalStaff()/5;
				model.addAttribute("totalPage",((int)Math.ceil(totalPage)));

			} 
			else {
				String imgName = staff.getStaffName()+staff.getDepart().getDepartId()+".jpg";
				try {
					image.transferTo(new File(context.getRealPath("/WEB-INF/jsps/images/")+imgName));
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				staff.setPhoto(context.getContextPath()+"/static/images/"+imgName);
				staffDAO.updateStaff(staff);
				model.addAttribute("staffList", staffDAO.getStaffList(1));
				model.addAttribute("staff", new Staff("","","M","","","","","") );
				//set number of pages
				float totalPage = staffDAO.getTotalStaff()/5;
				model.addAttribute("totalPage",((int)Math.ceil(totalPage)));
			}

			return "QuanLyNhanVien";
		}
		
	}
	@RequestMapping(value = "/ThongTinNhanVien", method = RequestMethod.GET)
	public String getStaffDetail(HttpServletRequest request, Model model) {
		Staff staff = staffDAO.loadStaff(request.getParameter("name"));
		model.addAttribute("staffList", staffDAO.getStaffList(1));
		model.addAttribute("staff", staff);
		
		float totalPage = staffDAO.getTotalStaff()/5;
		model.addAttribute("totalPage",((int)Math.ceil(totalPage)));
		return "QuanLyNhanVien";
	}
	@RequestMapping(value = "/XoaNhanVien", method = RequestMethod.GET)
	public String delStaff(HttpServletRequest request, Model model) {
		staffDAO.deleteStaff(request.getParameter("manv"));
		
		model.addAttribute("staffList", staffDAO.getStaffList(1));
		model.addAttribute("staff", new Staff("","","M","","","","","") );
		
		float totalPage = staffDAO.getTotalStaff()/5;
		model.addAttribute("totalPage",((int)Math.ceil(totalPage)));
		return "QuanLyNhanVien";
	}
	//Quan Ly Phong Ban
	@RequestMapping(value="/QuanLyPhongBan", method=RequestMethod.GET)
	public String getDeparts(Model model, HttpServletRequest request){
		List<Depart> departs = departDAO.getDepartList(Integer.parseInt(request.getParameter("page")));
		model.addAttribute("departList", departs);
		model.addAttribute("depart", new Depart());
		float totalPage = departDAO.getTotalDepart()/5;
		model.addAttribute("totalPage",((int)Math.ceil(totalPage)) );
		return "QuanLyPhongBan";
	}
	
	@RequestMapping("/TaoPhongBan")
	public String taoPhongBan(HttpServletRequest request, Model model, @Valid Depart depart, BindingResult result){
		if (result.hasErrors()) {
			model.addAttribute("departList", departDAO.getDepartList(1));
			float totalPage = departDAO.getTotalDepart()/5;
			model.addAttribute("totalPage",((int)Math.ceil(totalPage)) );
			return "QuanLyPhongBan";
		} else {

			if (request.getParameter("action").equals("create")) {
				departDAO.createDepart(depart);
				return "redirect:/QuanLyPhongBan?page=1";

			} 
			else {
				departDAO.updateDepart(depart);
				model.addAttribute("departList", departDAO.getDepartList(1));
				model.addAttribute("depart", new Depart());
				//set number of pages
				float totalPage = departDAO.getTotalDepart()/5;
				model.addAttribute("totalPage",((int)Math.ceil(totalPage)) );
			}

			return "QuanLyPhongBan";
		}
		
	}
	@RequestMapping(value = "/ThongTinPhongBan", method = RequestMethod.GET)
	public String getDepartDetail(HttpServletRequest request, Model model) {
		Depart depart = departDAO.loadDepart(request.getParameter("name"));
		model.addAttribute("departList", departDAO.getDepartList(1));
		model.addAttribute("depart", depart);
		
		float totalPage = departDAO.getTotalDepart()/5;
		model.addAttribute("totalPage",((int)Math.ceil(totalPage)) );
		return "QuanLyPhongBan";
	}
	@RequestMapping(value = "/XoaPhongBan", method = RequestMethod.GET)
	public String delDepart(HttpServletRequest request, Model model) {
		departDAO.deleteDepart(request.getParameter("mapb"));
		
		
		return "redirect:/QuanLyPhongBan?page=1";
	}
	
	//Thanh Tich
	@RequestMapping("/ThanhTich")
	public String showThanhTich(Model model, HttpServletRequest request){
		List<Staff> staffs = staffDAO.getStaffList(Integer.parseInt(request.getParameter("page")));
		model.addAttribute("staffList", staffs);
		model.addAttribute("staff", new Staff());
		float totalPage = staffDAO.getTotalStaff()/5;
		model.addAttribute("totalPage",((int)Math.ceil(totalPage)) );
		
		return "ThanhTich";
	}
	@RequestMapping("/KyLuat")
	public String kyluat(Model model,HttpServletRequest request){
		//System.out.println("KyUat");
		if(request.getParameter("note").equals("")){
			recordDAO.saveRecord(staffDAO.loadStaff(request.getParameter("manv")), 0);
			SimpleMailMessage message = new SimpleMailMessage();
			message.setText("Bad ");
			message.setTo("tienkhonvuong@gmail.com");

			message.setSubject("Annoucement");
			
			mailSender.send(message);
		}
		else{
			recordDAO.saveRecord(staffDAO.loadStaff(request.getParameter("manv")),request.getParameter("note"), 0);
			SimpleMailMessage message = new SimpleMailMessage();
			message.setText("Bad ");
			message.setTo("tienkhonvuong@gmail.com");
			message.setSubject("Annoucement");			
			mailSender.send(message);
		}
		return "redirect:/ThanhTich?page=1";
	}
	@RequestMapping("/KhenThuong")
	public String khenthuong(Model model,HttpServletRequest request){
		//System.out.println("Khen Thuong");
		if(request.getParameter("note").equals("")){
			recordDAO.saveRecord(staffDAO.loadStaff(request.getParameter("manv")), 1);
			SimpleMailMessage message = new SimpleMailMessage();
			message.setText("Good ");
			message.setTo("tienkhonvuong@gmail.com");

			message.setSubject("Annoucement");
			
			mailSender.send(message);
		}
		else{
			recordDAO.saveRecord(staffDAO.loadStaff(request.getParameter("manv")),request.getParameter("note"), 1);
			SimpleMailMessage message = new SimpleMailMessage();
			message.setText("Good ");
			message.setTo("tienkhonvuong@gmail.com");

			message.setSubject("Annoucement");
			
			mailSender.send(message);
		}
		return "redirect:/ThanhTich?page=1";
	}
	// Quan Ly Thanh Tich
	@RequestMapping("/QuanLyThanhTich")
	public String showQuanLyThanhTich(Model model, HttpServletRequest request){
		List<Record> records = recordDAO.getRecordList(Integer.parseInt(request.getParameter("page")));
		model.addAttribute("recordList", records);	
		model.addAttribute("record", new Record());
		float totalPage = recordDAO.getTotalRecord()/5;
		model.addAttribute("totalPage",((int)Math.ceil(totalPage)) );
		
		return "QuanLyThanhTich";
	}
	@RequestMapping("/XoaThanhTich")	
	public String delRecord(HttpServletRequest request, Model model) {
		recordDAO.deleteRecord(Integer.parseInt(request.getParameter("manv")));		
		return "redirect:/QuanLyThanhTich?page=1";
	}
	@RequestMapping(value = "/ThongTinThanhTich", method = RequestMethod.GET)
	public String getRecordDetail(HttpServletRequest request, Model model) {
		Record record = recordDAO.loadRecord(Integer.parseInt(request.getParameter("name")));
		model.addAttribute("recordList", recordDAO.getRecordList(1));
		model.addAttribute("record", record);
		
		float totalPage = recordDAO.getTotalRecord()/5;
		model.addAttribute("totalPage",((int)Math.ceil(totalPage)) );
		return "QuanLyThanhTich";
	}
	@RequestMapping(value="/CapNhatThanhTich")
	public String updateRecord(Record record){
		//System.out.println(record.getReason());
		recordDAO.updateRecord(record);
		return "redirect:/QuanLyThanhTich?page=1";
	}
	
	
	@RequestMapping(value="/LocThanhTich",method=RequestMethod.GET)
	public String filterRecord(HttpServletRequest request,Model model){
		
//		System.out.println(request.getParameter("departName"));
		List<Record> records = recordDAO.getRecordViaDepartNameAndYear(request.getParameter("departName"),request.getParameter("year"),Integer.parseInt(request.getParameter("page")));
		model.addAttribute("recordList", records);	
		model.addAttribute("record", new Record());
		float totalPage = recordDAO.getRecordFilterSize()/5;
		model.addAttribute("totalPage",((int)Math.ceil(totalPage)) );
		return "QuanLyThanhTich";
	}
}
