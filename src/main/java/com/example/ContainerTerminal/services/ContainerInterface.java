/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.ContainerTerminal.services;

import com.example.ContainerTerminal.models.Container;
import java.util.List;



public interface ContainerInterface {
  
   public List<Container> getAllContainers();

public Container findById(Integer id);
   
    public void updateCon(Container s);
}
