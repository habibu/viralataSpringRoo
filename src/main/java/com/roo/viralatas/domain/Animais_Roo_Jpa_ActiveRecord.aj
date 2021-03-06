// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.roo.viralatas.domain;

import com.roo.viralatas.domain.Animais;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Animais_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Animais.entityManager;
    
    public static final EntityManager Animais.entityManager() {
        EntityManager em = new Animais().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Animais.countAnimaises() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Animais o", Long.class).getSingleResult();
    }
    
    public static List<Animais> Animais.findAllAnimaises() {
        return entityManager().createQuery("SELECT o FROM Animais o", Animais.class).getResultList();
    }
    
    public static Animais Animais.findAnimais(Integer idAnimal) {
        if (idAnimal == null) return null;
        return entityManager().find(Animais.class, idAnimal);
    }
    
    public static List<Animais> Animais.findAnimaisEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Animais o", Animais.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Animais.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Animais.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Animais attached = Animais.findAnimais(this.idAnimal);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Animais.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Animais.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Animais Animais.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Animais merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
