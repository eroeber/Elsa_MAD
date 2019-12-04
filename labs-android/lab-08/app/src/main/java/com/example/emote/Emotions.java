package com.example.emote;

public class Emotions {
    private String emotion;
    private String emotionURL;

    public void setEmotion(Integer selected){
        setEmotionInfo(selected);
    }
    public String getEmotion(){

        return emotion;
    }

    public void setEmotionURL(Integer selected){

        setEmotionInfo(selected);
    }
    public String getEmotionURL(){

        return emotionURL;
    }

    private void setEmotionInfo(Integer pickedNumber){
        switch(pickedNumber){
            case 0: // deflated
                emotion="Deflated";
                emotionURL="https://www.thesaurus.com/browse/deflated?s=t";
                break;
            case 1:  // dismal
                emotion="Dismal";
                emotionURL="https://www.thesaurus.com/browse/dismal?s=t";
                break;
            case 2: // mediocre
                emotion="Mediocre";
                emotionURL="https://www.thesaurus.com/browse/mediocre?s=t";
                break;
            case 3: // cruising
                emotion="Cruising";
                emotionURL="https://www.thesaurus.com/browse/cruising?s=t";
                break;
            case 4: // elated
                emotion="Elated";
                emotionURL="https://www.thesaurus.com/browse/elated?s=t";
                break;
            default:
                emotion="none";
                emotionURL="https://www.thesaurus.com/browse/emotion?s=t";
        }
    }

}
