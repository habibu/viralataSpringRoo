package com.roo.viralatas.domain;
import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooJpaActiveRecord(versionField = "", table = "enderecos")
@RooDbManaged(automaticallyDelete = true)
@RooToString(excludeFields = { "moradiass", "idUsuarioUsuario", "idCidadeCidade" })
public class Enderecos {
}
