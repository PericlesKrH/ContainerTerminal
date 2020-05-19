/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.ContainerTerminal.models;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;


@Entity
@Table(name = "seawaybill")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Seawaybill.findAll", query = "SELECT s FROM Seawaybill s"),
    @NamedQuery(name = "Seawaybill.findById", query = "SELECT s FROM Seawaybill s WHERE s.id = :id"),
    @NamedQuery(name = "Seawaybill.findByBookingnumber", query = "SELECT s FROM Seawaybill s WHERE s.bookingnumber = :bookingnumber"),
    @NamedQuery(name = "Seawaybill.findByCustom", query = "SELECT s FROM Seawaybill s WHERE s.custom = :custom"),

})
public class Seawaybill implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "bookingnumber")
    private String bookingnumber;
    @Basic(optional = false)
    @NotNull
    @Column(name = "custom")
    private Integer custom;
//    @Basic(optional = false)
//    @NotNull
   // @Column(name = "paid")
    //private short paid;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "orderid")
    private Collection<Container> containerCollection;
    @JoinColumn(name = "userid", referencedColumnName = "userid")
    @ManyToOne(optional = false)
    private User userid;

    public Seawaybill() {
    }

    public Seawaybill(Integer id) {
        this.id = id;
    }

    public Seawaybill(Integer id, String bookingnumber, Integer custom) {
        this.id = id;
        this.bookingnumber = bookingnumber;
        this.custom = custom;
       // this.paid = paid;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getBookingnumber() {
        return bookingnumber;
    }

    public void setBookingnumber(String bookingnumber) {
        this.bookingnumber = bookingnumber;
    }

    public Integer getCustom() {
        return custom;
    }

    public void setCustom(Integer custom) {
        this.custom = custom;
    }

//    public short getPaid() {
//        return paid;
//    }
//
//    public void setPaid(short paid) {
//        this.paid = paid;
//    }

    @XmlTransient
    public Collection<Container> getContainerCollection() {
        return containerCollection;
    }

    public void setContainerCollection(Collection<Container> containerCollection) {
        this.containerCollection = containerCollection;
    }

    public User getUserid() {
        return userid;
    }

    public void setUserid(User userid) {
        this.userid = userid;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Seawaybill)) {
            return false;
        }
        Seawaybill other = (Seawaybill) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.example.ContainerTerminal.models.Seawaybill[ id=" + id + " ]";
    }
    
}
