// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.roo.viralatas.domain;

import com.roo.viralatas.domain.Usuarios;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

privileged aspect Usuarios_Roo_Jpa_Entity {
    
    declare @type: Usuarios: @Entity;
    
    declare @type: Usuarios: @Table(name = "usuarios");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "idUsuario")
    private Integer Usuarios.idUsuario;
    
    public Integer Usuarios.getIdUsuario() {
        return this.idUsuario;
    }
    
    public void Usuarios.setIdUsuario(Integer id) {
        this.idUsuario = id;
    }
    
}
