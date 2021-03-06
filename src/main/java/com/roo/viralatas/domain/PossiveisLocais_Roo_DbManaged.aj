// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.roo.viralatas.domain;

import com.roo.viralatas.domain.Cidades;
import com.roo.viralatas.domain.PossiveisLocais;
import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

privileged aspect PossiveisLocais_Roo_DbManaged {
    
    @ManyToOne
    @JoinColumn(name = "idCidade_Cidade", referencedColumnName = "idCidade")
    private Cidades PossiveisLocais.idCidadeCidade;
    
    @Column(name = "nome", length = 45)
    private String PossiveisLocais.nome;
    
    @Column(name = "longitude")
    private Double PossiveisLocais.longitude;
    
    @Column(name = "latitude")
    private Double PossiveisLocais.latitude;
    
    public Cidades PossiveisLocais.getIdCidadeCidade() {
        return idCidadeCidade;
    }
    
    public void PossiveisLocais.setIdCidadeCidade(Cidades idCidadeCidade) {
        this.idCidadeCidade = idCidadeCidade;
    }
    
    public String PossiveisLocais.getNome() {
        return nome;
    }
    
    public void PossiveisLocais.setNome(String nome) {
        this.nome = nome;
    }
    
    public Double PossiveisLocais.getLongitude() {
        return longitude;
    }
    
    public void PossiveisLocais.setLongitude(Double longitude) {
        this.longitude = longitude;
    }
    
    public Double PossiveisLocais.getLatitude() {
        return latitude;
    }
    
    public void PossiveisLocais.setLatitude(Double latitude) {
        this.latitude = latitude;
    }
    
}
