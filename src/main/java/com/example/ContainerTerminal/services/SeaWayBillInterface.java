/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.ContainerTerminal.services;

import com.example.ContainerTerminal.models.Seawaybill;
import java.util.List;


public interface SeaWayBillInterface {
  
public List<Seawaybill> getAll();

public Seawaybill findById(Integer id);
   
public void UpdateBill(Seawaybill s);
}
