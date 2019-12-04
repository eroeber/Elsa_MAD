package com.example.emote;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.Spinner;

public class MainActivity extends AppCompatActivity {
    private Button button;
    private Spinner emoSpinner;
    private Emotions myEmotions = new Emotions();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        // get spinner
        emoSpinner = findViewById(R.id.spinner);
        ArrayAdapter<CharSequence> adapter = ArrayAdapter.createFromResource(this,
                R.array.emotions, android.R.layout.simple_spinner_item);
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        emoSpinner.setAdapter(adapter);

        // get button
        button = findViewById(R.id.button);

        // create listener
        View.OnClickListener onclick = new View.OnClickListener(){
            public void onClick(View view){
                findEmotion(view);
            }
        };
        // connect button and listener
        button.setOnClickListener(onclick);
    }

    private void findEmotion(View view){
        // get which emotion was selected
        Integer type = emoSpinner.getSelectedItemPosition();
        // set the emotion for the second view
        myEmotions.setEmotion(type);
        myEmotions.setEmotionURL(type);
        // get emotion result
        String emoResult = myEmotions.getEmotion();
        // get url of thesaurus
        String emoResultURL = myEmotions.getEmotionURL();
        Log.i("emo result", emoResult);
        Log.i("emo result url", emoResultURL);

        // create intent (explicit)
        Intent intent = new Intent(this, EmoActivity.class);
        // pass data
        intent.putExtra("emotion", emoResult);
        intent.putExtra("emotionURL", emoResultURL);
        // start intent
        startActivity(intent);
    }
}
