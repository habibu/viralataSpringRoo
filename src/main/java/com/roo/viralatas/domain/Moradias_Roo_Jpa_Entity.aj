// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.roo.viralatas.domain;

import com.roo.viralatas.domain.Moradias;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

privileged aspect Moradias_Roo_Jpa_Entity {
    
    declare @type: Moradias: @Entity;
    
    declare @type: Moradias: @Table(name = "moradias");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "idMoradia")
    private Integer Moradias.idMoradia;
    
    public Integer Moradias.getIdMoradia() {
        return this.idMoradia;
    }
    
    public void Moradias.setIdMoradia(Integer id) {
        this.idMoradia = id;
    }
    
}
