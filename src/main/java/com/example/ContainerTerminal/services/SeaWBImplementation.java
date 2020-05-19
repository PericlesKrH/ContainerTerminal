
package com.example.ContainerTerminal.services;

import com.example.ContainerTerminal.models.Seawaybill;
import com.example.ContainerTerminal.repository.SeaWayBillRepository;
import java.util.List;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class SeaWBImplementation implements SeaWayBillInterface {
    
    
    @Autowired
    SeaWayBillRepository seaWayBill;

    @Override
    public List<Seawaybill> getAll() {
       
        List<Seawaybill> all=(List<Seawaybill>)seaWayBill.findAll();
        return all;
           
    }

    @Override
    public Seawaybill findById(Integer id) {

         Seawaybill s=seaWayBill.findById(id).get();
         return s;
    }

    @Override
    public void UpdateBill(Seawaybill s) {

       seaWayBill.save(s);
      
    }

    
}
