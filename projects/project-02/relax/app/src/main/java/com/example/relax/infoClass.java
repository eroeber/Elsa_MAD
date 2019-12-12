package com.example.relax;

public class infoClass {
    private String habitat;

    private void colorInfo(Integer choice){
        switch(choice){
            case  -1: // none selected
                habitat =  "nothing";
                break;
            case 0:  // ocean
                habitat = "ocean";
                break;
            case 1: // desert
                habitat = "desert";
                break;
            case 2: // forest
                habitat =  "forest";
                break;
            default:
                habitat = "none";
        }
    }

    public void setHabitat(Integer colorChoice){

       // colorInfo(colorChoice);
        switch(colorChoice){
            case  -1: // none selected
                habitat =  "nothing";
                break;
            case 0:  // ocean
                habitat = "ocean";
                break;
            case 1: // desert
                habitat = "desert";
                break;
            case 2: // forest
                habitat =  "forest";
                break;
            default:
                habitat = "none";
        }
    }
    public String getHabitat(){

        return habitat;
    }
}
