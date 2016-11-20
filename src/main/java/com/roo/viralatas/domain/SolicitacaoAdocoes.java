package com.roo.viralatas.domain;
import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooJpaActiveRecord(versionField = "", table = "solicitacao_adocoes")
@RooDbManaged(automaticallyDelete = true)
@RooToString(excludeFields = { "idUsuarioUsuario", "idFeiraFeira", "idAnimalAnimal", "idstatusStatus" })
public class SolicitacaoAdocoes {
}
