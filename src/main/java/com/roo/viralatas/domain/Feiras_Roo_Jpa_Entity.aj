// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.roo.viralatas.domain;

import com.roo.viralatas.domain.Feiras;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

privileged aspect Feiras_Roo_Jpa_Entity {
    
    declare @type: Feiras: @Entity;
    
    declare @type: Feiras: @Table(name = "feiras");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "idFeira")
    private Integer Feiras.idFeira;
    
    public Integer Feiras.getIdFeira() {
        return this.idFeira;
    }
    
    public void Feiras.setIdFeira(Integer id) {
        this.idFeira = id;
    }
    
}
