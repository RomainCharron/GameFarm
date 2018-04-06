/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.m2i.charron.web.gamefarm.Service;

import com.m2i.charron.web.gamefarm.Hibernate.*;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Formation
 */
public class Joueur_Service {

    static public boolean add(Joueur joueur) {

        try {
            Session session = GaiaHibernateUtil.getSessionFactory().openSession();
            Transaction transaction = session.beginTransaction();
            session.save(joueur);
            transaction.commit();
            session.close();
        } catch (Exception e) {
            System.out.println("Erreur inconue");
            System.out.println(e.getMessage());
            e.printStackTrace();
            return false;
        }
        return true;
    }

    static public Joueur showById(int id) {
        Session session = GaiaHibernateUtil.getSessionFactory().openSession();
        Joueur oj = (Joueur) session.get(Joueur.class, (Integer)id);
        session.close();
        return oj;
    }

    static public List<Joueur> showAll() {
        List<Joueur> joueurList = new ArrayList<Joueur>();
        Session session = GaiaHibernateUtil.getSessionFactory().openSession();
        Query query = session.createQuery("from Employer");
        System.out.println("nb :" + query.list().size());
        joueurList = query.list();
        session.close();

        return joueurList;
    }

    static public void update(int id ,String joueurPseudo) {

        Joueur joueur = new Joueur(joueurPseudo);
        joueur.setId(id);
        Session session = GaiaHibernateUtil.getSessionFactory().openSession();
        session.update(joueur);

        Transaction transaction = session.beginTransaction();

        transaction.commit();

        session.close();
    }
    
    static public void delete(int id) {

        Joueur employee = showById(id);
        Session session = GaiaHibernateUtil.getSessionFactory().openSession();
        session.delete(employee);

        Transaction transaction = session.beginTransaction();

        transaction.commit();

        session.close();
    }
}