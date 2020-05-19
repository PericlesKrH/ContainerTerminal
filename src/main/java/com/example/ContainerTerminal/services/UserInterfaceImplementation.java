
package com.example.ContainerTerminal.services;

import com.example.ContainerTerminal.models.User;
import com.example.ContainerTerminal.repository.UserRepository;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class UserInterfaceImplementation implements UserInterface{
    
    @Autowired
    UserRepository userrepository;

    @Override
    public User findByUsername(String username) {

User u=userrepository.findByUsername(username);
return u;
    }

    @Override
    public void insertUser(User u) {
                
        userrepository.save(u);
         
    }

    @Override
    public User findById(Integer id) {
             
        User u= userrepository.findById(id).get();
return u;
    }

    @Override
    public void updateUser(User u) {
          
        userrepository.save(u);
          

    }

  
    
    
    
}
