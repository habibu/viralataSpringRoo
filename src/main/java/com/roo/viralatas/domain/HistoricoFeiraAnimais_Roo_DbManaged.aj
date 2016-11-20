// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.roo.viralatas.domain;

import com.roo.viralatas.domain.Animais;
import com.roo.viralatas.domain.Feiras;
import com.roo.viralatas.domain.HistoricoFeiraAnimais;
import java.util.Calendar;
import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import org.springframework.format.annotation.DateTimeFormat;

privileged aspect HistoricoFeiraAnimais_Roo_DbManaged {
    
    @ManyToOne
    @JoinColumn(name = "idFeira_Feira", referencedColumnName = "idFeira")
    private Feiras HistoricoFeiraAnimais.idFeiraFeira;
    
    @ManyToOne
    @JoinColumn(name = "idAnimal_Animal", referencedColumnName = "idAnimal")
    private Animais HistoricoFeiraAnimais.idAnimalAnimal;
    
    @Column(name = "dataRegistro")
    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "MM")
    private Calendar HistoricoFeiraAnimais.dataRegistro;
    
    public Feiras HistoricoFeiraAnimais.getIdFeiraFeira() {
        return idFeiraFeira;
    }
    
    public void HistoricoFeiraAnimais.setIdFeiraFeira(Feiras idFeiraFeira) {
        this.idFeiraFeira = idFeiraFeira;
    }
    
    public Animais HistoricoFeiraAnimais.getIdAnimalAnimal() {
        return idAnimalAnimal;
    }
    
    public void HistoricoFeiraAnimais.setIdAnimalAnimal(Animais idAnimalAnimal) {
        this.idAnimalAnimal = idAnimalAnimal;
    }
    
    public Calendar HistoricoFeiraAnimais.getDataRegistro() {
        return dataRegistro;
    }
    
    public void HistoricoFeiraAnimais.setDataRegistro(Calendar dataRegistro) {
        this.dataRegistro = dataRegistro;
    }
    
}