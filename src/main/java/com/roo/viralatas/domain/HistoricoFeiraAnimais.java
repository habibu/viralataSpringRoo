package com.roo.viralatas.domain;
import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooJpaActiveRecord(versionField = "", table = "historico_feira_animais")
@RooDbManaged(automaticallyDelete = true)
@RooToString(excludeFields = { "idFeiraFeira", "idAnimalAnimal" })
public class HistoricoFeiraAnimais {
}
