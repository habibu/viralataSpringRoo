// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.roo.viralatas.domain;

import com.roo.viralatas.domain.Enderecos;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

privileged aspect Enderecos_Roo_Jpa_Entity {
    
    declare @type: Enderecos: @Entity;
    
    declare @type: Enderecos: @Table(name = "enderecos");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "idEndereco")
    private Integer Enderecos.idEndereco;
    
    public Integer Enderecos.getIdEndereco() {
        return this.idEndereco;
    }
    
    public void Enderecos.setIdEndereco(Integer id) {
        this.idEndereco = id;
    }
    
}