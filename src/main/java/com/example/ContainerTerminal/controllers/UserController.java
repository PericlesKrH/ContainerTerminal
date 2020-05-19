package com.example.ContainerTerminal.controllers;

import com.example.ContainerTerminal.Daos.PriceDao;
import com.example.ContainerTerminal.models.Container;
import com.example.ContainerTerminal.models.Role;
import com.example.ContainerTerminal.models.Seawaybill;
import com.example.ContainerTerminal.models.User;
import com.example.ContainerTerminal.paypal.Order;
import com.example.ContainerTerminal.paypal.PaypalService;
import com.example.ContainerTerminal.services.ContainerInterface;
import com.example.ContainerTerminal.services.SeaWayBillInterface;
import com.example.ContainerTerminal.services.UserInterface;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payment;
import com.paypal.base.rest.PayPalRESTException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserController {

    @Autowired
    UserInterface userinterface;

    @Autowired
    ContainerInterface containerinterface;
    
    @Autowired
    SeaWayBillInterface seawaybillinterface;
    
    @Autowired
PasswordEncoder passwordEncoder;

    @GetMapping("/")
    public String start() {
        
        return "/index";
    }

    @GetMapping("/login")
    public String goToLogIn() {
        
        return "loginPage";
    }

    @GetMapping("/contact")
    public String goToContact() {
        
        return "contact";
    }

    @GetMapping("/about")
    public String goToAbout() {
        
        return "about";
    }

    @GetMapping("/gallery")
    public String goToGallery() {
        
        return "gallery";
    }
 

    @PostMapping("/submitlogin")
    public String login(@RequestParam(name = "fname") String username,
            @RequestParam(name = "pas") String password, ModelMap mm, HttpSession session
    ) {
        User u = userinterface.findByUsername(username);
        if (u == null) {
                      mm.addAttribute("message", "Invalid Username");
            return "loginPage" ;

        } else {
            if (passwordEncoder.matches(password,u.getPassword())) {
                session.setAttribute("user", u);
                if (u.getRoleid().getRoleid()==1) {
                    return "adminPage";
                }
                else{
                        return "welcome";
                }
        
            } else {
             mm.addAttribute("message", "Invalid Password ");
                return "loginPage";
            }
        }
    }

    @PostMapping("/search")
    public String searchOrderNumber(@RequestParam(name = "search") String order, ModelMap mm,HttpSession session) {
       
        List<Container> all = containerinterface.getAllContainers();
        List<Container> containers = new ArrayList<>();
        boolean exists = false;
        for (int i = 0; i < all.size(); i++) {
            if (order.equals(all.get(i).getOrdernumber().getBookingnumber())) {

                containers.add(all.get(i));
          exists = true;
         }
        }
        if (exists == true) {
            session.setAttribute("containers", containers);
            mm.addAttribute("containers", containers);
            return "c_table_1";
        } else {
      return "c_table_1";
     }
    }
    
    
    @GetMapping("/payment")
public String goToPaymentDetails(ModelMap mm,HttpSession session){
   
 List<PriceDao> prices=new ArrayList<>();
  List<Container> containers=(List<Container>) session.getAttribute("containers");
  
        for (int i = 0; i <containers.size() ; i++) {
            int totalCounter=0;
        PriceDao pd=new PriceDao();
      
        String string = containers.get(i).getType();
String[] parts = string.split(" ");
String part1 = parts[0]; // 20
String part2 = parts[1]; // C
      
            if ("20".equals(part1)) {
              pd.setWeight(33);
              totalCounter+=33; 
            }
            else{
                 pd.setWeight(43);
              totalCounter+=43; 
            }
           
            if ("N".equals(part2)) {
                pd.setType(5);
                totalCounter+=5;
            }
            else if ("C".equals(part2)) {
            
            pd.setType(20);
                totalCounter+=20;
            }            
            else{
            pd.setType(50);
                totalCounter+=50;
            }
            
            totalCounter+=20;
            pd.setTotal(totalCounter);
            prices.add(pd);
        }
   
   mm.addAttribute("prices",prices);
    return "Payment";
   
}









@GetMapping("/history")
public String getHistoryOfUser(ModelMap mm,HttpSession session){

   User u=(User) session.getAttribute("user");
   
   List<Seawaybill> all=new ArrayList<>() ;
    
   for (int i = 0; i < seawaybillinterface.getAll().size(); i++) {
        if (Objects.equals(seawaybillinterface.getAll().get(i).getUserid().getUserid(), u.getUserid()))
        {
            all.add(seawaybillinterface.getAll().get(i));
        }
   
    }
   
 
       
   mm.addAttribute("kappa",all);
   
return "wb_table_1";
}








    @GetMapping(value="/goToRegister")
    public String gotoform(ModelMap mm){
    
    return"registerForm";
    }
    
  
        @PostMapping(value ="/registerForm") 
    public String submitForm(
            @RequestParam(name="uname")String uname,
           @RequestParam(name="pas")String pas,@RequestParam(name="vat")String afm,@RequestParam(name="doy")String doy,
          @RequestParam(name="address")String address )
    {
        Role r=new Role();
        r.setRoleid(2);
    User u=new User();
    u.setUsername(uname);
    u.setAfm(afm);
    u.setAddress(address);
    u.setDoy(doy);
    u.setPassword(passwordEncoder.encode(pas));
    u.setRoleid(r);
   userinterface.insertUser(u);
  
    return "index";
    }
    
    
      @GetMapping(value = "/seeAllWaybills")
    public String getAllWayBills(ModelMap mm) {
        List<Seawaybill> seaway = seawaybillinterface.getAll();
        mm.addAttribute("all", seaway);
        List<Container> container = containerinterface.getAllContainers();
        mm.addAttribute("containers", container);
        return "adminTable";
    }

    @GetMapping(value = "preupdate/{id}")
    public String preupdate(@PathVariable(name = "id") Integer id,
            ModelMap mm) {

        Seawaybill s = seawaybillinterface.findById(id);

        mm.addAttribute("sea", s);

        return "updateForm";
    }

    @GetMapping(value = "preUpdateCon/{id}")
    public String preUpdateCon(@PathVariable(name = "id") Integer id,
            ModelMap mm) {

        Container c = containerinterface.findById(id);

        mm.addAttribute("con", c);

        return "updatedCon";
    }

    @PostMapping(value = "/updatedForm")
    public String updateContainer(@RequestParam(name = "uid") Integer id,
            @RequestParam(name = "bn") String bn,
            @RequestParam(name = "custom") Integer custom,
         
            
            @RequestParam(name = "userid") Integer userId) {
        User user = userinterface.findById(userId);
        Seawaybill temp = new Seawaybill();
        temp.setId(id);
        temp.setBookingnumber(bn);
        temp.setCustom(custom);

        temp.setUserid(user);

        seawaybillinterface.UpdateBill(temp);

        return "redirect:/seeAllWaybills";
    }

    @PostMapping(value = "/updatedCon")
    public String updateCont(@RequestParam(name = "uid") Integer id,
            @RequestParam(name = "bn") String bn,
            @RequestParam(name = "type") String type,
            @RequestParam(name = "disDate") String disDate,
            @RequestParam(name = "dis") Short dis,
            @RequestParam(name = "billId") Integer billId) {
        Seawaybill bill = seawaybillinterface.findById(billId);
        String[] parts = disDate.split("-");
        int days = Integer.parseInt(parts[2]);
        int mounth = Integer.parseInt(parts[1]);
        int year = Integer.parseInt(parts[0]);
        LocalDate date = LocalDate.of(year, mounth, days);
     
        Container con = new Container();
        con.setContainerid(id);
        con.setContainername(bn);
        con.setType(type);
        con.setDate(date);
        con.setDischarged(dis);
        con.setOrdernumber(bill);
        containerinterface.updateCon(con);
        return "redirect:/seeAllWaybills";
    }

    
    
    
    
    
    
    
    
    
    

    
    
    
    @GetMapping("/goToPaypal")
    public String goToPaypal(){
    return "home";}
    
    @Autowired
	PaypalService service;

	public static final String SUCCESS_URL = "welcome";
	public static final String CANCEL_URL = "pay/cancel";

	

	@PostMapping("/pay")
	public String payment(@ModelAttribute("order") Order order) {
		try {
			Payment payment = service.createPayment(order.getPrice(), order.getCurrency(), order.getMethod(),
					order.getIntent(), order.getDescription(), "http://localhost:8080/" + CANCEL_URL,
					"http://localhost:8080/" + SUCCESS_URL);
			for(Links link:payment.getLinks()) {
				if(link.getRel().equals("approval_url")) {
					return "redirect:"+link.getHref();
				}
			}
			
		} catch (PayPalRESTException e) {
		
			e.printStackTrace();
		}
		return "redirect:/home";
	}
	
	 @GetMapping(value = CANCEL_URL)
	    public String cancelPay() {
	        return "redirect:/payment";
	    }

	    @GetMapping(value = SUCCESS_URL)
	    public String successPay(@RequestParam("paymentId") String paymentId, @RequestParam("PayerID") String payerId) {
	        try {
	            Payment payment = service.executePayment(paymentId, payerId);
	            System.out.println(payment.toJSON());
	            if (payment.getState().equals("approved")) {
	                return "welcome";
	            }
	        } catch (PayPalRESTException e) {
	         System.out.println(e.getMessage());
	        }
	        return "redirect:/home";
	    }

            @GetMapping("/goToSeeChat")
            public String chat(){
            
            return "chat";
            }
    
}
  
