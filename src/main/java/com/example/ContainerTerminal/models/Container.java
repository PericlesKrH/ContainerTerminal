/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.ContainerTerminal.models;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;


@Entity
@Table(name = "container")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Container.findAll", query = "SELECT c FROM Container c"),
    @NamedQuery(name = "Container.findByContainerid", query = "SELECT c FROM Container c WHERE c.containerid = :containerid"),
    @NamedQuery(name = "Container.findByContainername", query = "SELECT c FROM Container c WHERE c.containername = :containername"),
    @NamedQuery(name = "Container.findByType", query = "SELECT c FROM Container c WHERE c.type = :type"),
    @NamedQuery(name = "Container.findByDate", query = "SELECT c FROM Container c WHERE c.date = :date"),
    @NamedQuery(name = "Container.findByDischarged", query = "SELECT c FROM Container c WHERE c.discharged = :discharged")})
public class Container implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "containerid")
    private Integer containerid;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 12)
    @Column(name = "containername")
    private String containername;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 4)
    @Column(name = "type")
    private String type;
    @Column(name = "date")
   
    private LocalDate date;
    @Basic(optional = false)
    @NotNull
    @Column(name = "discharged")
    private short discharged;
    @JoinColumn(name = "orderid", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Seawaybill orderid;
    
    public Container() {
    }

    public Container(Integer containerid) {
        this.containerid = containerid;
    }

    public Container(Integer containerid, String containername, String type, short discharged) {
        this.containerid = containerid;
        this.containername = containername;
        this.type = type;
        this.discharged = discharged;
    }

    public Integer getContainerid() {
        return containerid;
    }

    public void setContainerid(Integer containerid) {
        this.containerid = containerid;
    }

    public String getContainername() {
        return containername;
    }

    public void setContainername(String containername) {
        this.containername = containername;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public short getDischarged() {
        return discharged;
    }

    public void setDischarged(short discharged) {
        this.discharged = discharged;
    }

    public Seawaybill getOrdernumber() {
        return orderid;
    }

    public void setOrdernumber(Seawaybill orderid) {
        this.orderid = orderid;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (containerid != null ? containerid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Container)) {
            return false;
        }
        Container other = (Container) object;
        if ((this.containerid == null && other.containerid != null) || (this.containerid != null && !this.containerid.equals(other.containerid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.example.ContainerTerminal.models.Container[ containerid=" + containerid + " ]";
    }
    
}
