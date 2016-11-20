// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.roo.viralatas.domain;

import com.roo.viralatas.domain.Acompanhamentos;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Acompanhamentos_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Acompanhamentos.entityManager;
    
    public static final EntityManager Acompanhamentos.entityManager() {
        EntityManager em = new Acompanhamentos().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Acompanhamentos.countAcompanhamentoses() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Acompanhamentos o", Long.class).getSingleResult();
    }
    
    public static List<Acompanhamentos> Acompanhamentos.findAllAcompanhamentoses() {
        return entityManager().createQuery("SELECT o FROM Acompanhamentos o", Acompanhamentos.class).getResultList();
    }
    
    public static Acompanhamentos Acompanhamentos.findAcompanhamentos(Integer idAcompanhamento) {
        if (idAcompanhamento == null) return null;
        return entityManager().find(Acompanhamentos.class, idAcompanhamento);
    }
    
    public static List<Acompanhamentos> Acompanhamentos.findAcompanhamentosEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Acompanhamentos o", Acompanhamentos.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Acompanhamentos.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Acompanhamentos.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Acompanhamentos attached = Acompanhamentos.findAcompanhamentos(this.idAcompanhamento);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Acompanhamentos.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Acompanhamentos.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Acompanhamentos Acompanhamentos.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Acompanhamentos merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
