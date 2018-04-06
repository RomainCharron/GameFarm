package com.m2i.charron.web.gamefarm.Hibernate;
// Generated 6 avr. 2018 14:38:30 by Hibernate Tools 4.3.1



/**
 * RefjoueurId generated by hbm2java
 */
public class RefjoueurId  implements java.io.Serializable {


     private int idjoueur;
     private int idpartie;

    public RefjoueurId() {
    }

    public RefjoueurId(int idjoueur, int idpartie) {
       this.idjoueur = idjoueur;
       this.idpartie = idpartie;
    }
   
    public int getIdjoueur() {
        return this.idjoueur;
    }
    
    public void setIdjoueur(int idjoueur) {
        this.idjoueur = idjoueur;
    }
    public int getIdpartie() {
        return this.idpartie;
    }
    
    public void setIdpartie(int idpartie) {
        this.idpartie = idpartie;
    }


   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof RefjoueurId) ) return false;
		 RefjoueurId castOther = ( RefjoueurId ) other; 
         
		 return (this.getIdjoueur()==castOther.getIdjoueur())
 && (this.getIdpartie()==castOther.getIdpartie());
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + this.getIdjoueur();
         result = 37 * result + this.getIdpartie();
         return result;
   }   


}


