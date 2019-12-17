package com.example.elsafinal;

public class BurritoShop {
    private String burritoShop;
    private String burritoWebsite;

    private void setBurritoInfo(Integer location){
        switch(location){
            case 0: // -
                burritoShop = "none";
                burritoWebsite = "none";
                break;
            case 1: // the hil
                burritoShop = "Illegal Pete's";
                burritoWebsite = "http://illegalpetes.com/";
                break;
            case 2: // 29th street
                burritoShop = "Chipotle";
                burritoWebsite = "http://www.chipotle.com/";
                break;
            case 3: // pearl street
                burritoShop = "Bartaco";
                burritoWebsite = "http://bartaco.com/";
                break;
            default:
                burritoShop = "nothing";
                burritoWebsite = "none";
        }
    }
    public void setBurritoShop(Integer location){
        setBurritoInfo(location);
    }
    public String getBurritoShop(){
        return burritoShop;
    }

    public void setBurritoWebsite(Integer location){
        setBurritoInfo(location);
    }

    public String getBurritoWebsite() {
        return burritoWebsite;
    }
}
