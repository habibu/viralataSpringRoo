// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.roo.viralatas.domain;

import com.roo.viralatas.domain.SolicitacaoAdocoes;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect SolicitacaoAdocoes_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager SolicitacaoAdocoes.entityManager;
    
    public static final EntityManager SolicitacaoAdocoes.entityManager() {
        EntityManager em = new SolicitacaoAdocoes().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long SolicitacaoAdocoes.countSolicitacaoAdocoeses() {
        return entityManager().createQuery("SELECT COUNT(o) FROM SolicitacaoAdocoes o", Long.class).getSingleResult();
    }
    
    public static List<SolicitacaoAdocoes> SolicitacaoAdocoes.findAllSolicitacaoAdocoeses() {
        return entityManager().createQuery("SELECT o FROM SolicitacaoAdocoes o", SolicitacaoAdocoes.class).getResultList();
    }
    
    public static SolicitacaoAdocoes SolicitacaoAdocoes.findSolicitacaoAdocoes(Integer idSolicitacaoAdocao) {
        if (idSolicitacaoAdocao == null) return null;
        return entityManager().find(SolicitacaoAdocoes.class, idSolicitacaoAdocao);
    }
    
    public static List<SolicitacaoAdocoes> SolicitacaoAdocoes.findSolicitacaoAdocoesEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM SolicitacaoAdocoes o", SolicitacaoAdocoes.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void SolicitacaoAdocoes.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void SolicitacaoAdocoes.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            SolicitacaoAdocoes attached = SolicitacaoAdocoes.findSolicitacaoAdocoes(this.idSolicitacaoAdocao);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void SolicitacaoAdocoes.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void SolicitacaoAdocoes.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public SolicitacaoAdocoes SolicitacaoAdocoes.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        SolicitacaoAdocoes merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
