/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.ContainerTerminal.repository;

import com.example.ContainerTerminal.models.Seawaybill;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


public interface SeaWayBillRepository extends JpaRepository<Seawaybill,Integer> {

}
    

 
    
