package waa.mum.edu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.validation.Valid;

import waa.mum.edu.domain.JsonResponse;
import waa.mum.edu.domain.Product;
import waa.mum.edu.service.impl.ProductService;


@Controller
@RequestMapping({"/","/products"})
public class ProductController {
	@Autowired
        ProductService productService;
 
	
 	@RequestMapping(value={"","/list"})
	public String listProducts(Model model) {
        model.addAttribute("products",productService.getAllProduct());
 		System.out.println(productService.getAllProduct());
 		return "products";
	}
	
 	@RequestMapping(value="/admin", method=RequestMethod.GET)
	public String listProductsAdmin(Model model) {
        model.addAttribute("products",productService.getAllProduct());
        model.addAttribute("product",new Product());
 		return "products-admin";
	}
	
 	@RequestMapping(value="/saveProduct/add")
 	public @ResponseBody
        JsonResponse addProduct(@Valid @ModelAttribute("product") Product productToBeAdded,
 			BindingResult bindingResult) {
 		JsonResponse res = new JsonResponse();
 		if (bindingResult.hasErrors()) {
 			res.setStatus("FAIL"); 
 			res.setType("add");
 			res.setResult(bindingResult.getAllErrors());
		}else {	
			productService.saveProduct(productToBeAdded);
			res.setStatus("SUCCESS");
			res.setType("add");            
		}
		return res;
 	}
 	
 	
 	@RequestMapping(value="/saveProduct/edit")
 	public @ResponseBody
        JsonResponse saveProduct(@Valid @ModelAttribute("product") Product productToBeAdded,
 			BindingResult bindingResult) {
 		JsonResponse res = new JsonResponse();
 		if (bindingResult.hasErrors()) {
 			res.setStatus("FAIL"); 
 			res.setType("edit");
 			res.setResult(bindingResult.getAllErrors());
 		}else {	
 			productService.saveProduct(productToBeAdded);
 			res.setStatus("SUCCESS");
 			res.setType("edit");
 		} 		
 		return res; 
 	}
 	
 	@RequestMapping(value="/deleteProduct/{id}")
 	public @ResponseBody
        JsonResponse deleteProduct (Model model, @PathVariable("id") Long productId) {
 		JsonResponse res = new JsonResponse();
		System.out.println(productId);
		try {
			productService.deleteProduct(productId);
			res.setStatus("SUCCESS");
			res.setType("edit");
		} catch (Exception up) {
	      System.out.println("Transaction Failed!!!" + up.getMessage());
 
		}
 		return res; 
 	}
 	
 	
 	
  	/*@RequestMapping("/employee/{number}")
	public String getEmployeeByNumber(Model model, @PathVariable("number")int number) {

  		// Replace
  		Employee employee = employeeService.findEmployeeByEmployeeNumber(number);
  		System.out.println("employe===>"+employee.getFirstName());
  		List<Employee>employees=new ArrayList<Employee>();
  		 employees.add(employee);
  		
  		model.addAttribute("employees",employees);
		return "employees";
	}

	
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addNewEmployee(@ModelAttribute("newEmployee") Employee newEmployee) {
	   return "addEmployee";
	}
	   
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String processAddNewEmployee(@ModelAttribute("newEmployee") Employee employeeToBeAdded) {
		employeeService.saveEmployee(employeeToBeAdded);
		
	   	return "redirect:/employees/list";
	}*/
	
 
}
