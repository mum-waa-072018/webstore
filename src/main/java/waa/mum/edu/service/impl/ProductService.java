package waa.mum.edu.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import waa.mum.edu.domain.Product;
import waa.mum.edu.repository.ProductRepository;

@Service
@Transactional
public class ProductService {
	
	@Autowired
        ProductRepository productRepository;
	
  public Product findproductById(Long Id) {
	  
	return productRepository.findOne(Id);
	  
  }
  
  public void saveProduct(Product product) {
	  productRepository.save(product);
  }
  
  public List<Product> getAllProduct(){
	return (List<Product>) productRepository.findAll();
  }
  
}
