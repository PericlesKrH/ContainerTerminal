/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.ContainerTerminal.repository;

import com.example.ContainerTerminal.models.Container;
import java.util.List;
import org.springframework.data.repository.CrudRepository;

public interface ContainerRepository  extends CrudRepository<Container,Integer>{
   
}
