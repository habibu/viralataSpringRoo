// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.roo.viralatas.domain;

import com.roo.viralatas.domain.Status;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

privileged aspect Status_Roo_Jpa_Entity {
    
    declare @type: Status: @Entity;
    
    declare @type: Status: @Table(name = "status");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "idstatus")
    private Integer Status.idstatus;
    
    public Integer Status.getIdstatus() {
        return this.idstatus;
    }
    
    public void Status.setIdstatus(Integer id) {
        this.idstatus = id;
    }
    
}
