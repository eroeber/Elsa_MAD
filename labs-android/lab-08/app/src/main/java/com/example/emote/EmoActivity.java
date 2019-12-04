package com.example.emote;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import org.w3c.dom.Text;

public class EmoActivity extends AppCompatActivity {

    private String emotion;
    private String emotionURL;
    private Button button2;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_emo);

        // get intent
        Intent intent = getIntent();
        emotion = intent.getStringExtra("emotion");
        emotionURL = intent.getStringExtra("emotionURL");

        Log.i("emotion received", emotion);
        Log.i("url received", emotionURL);

        // update text view
        TextView messageView = findViewById(R.id.textView2);
        messageView.setText(emotion);

        // get button
        button2 = findViewById(R.id.button2);

        // create listener
        View.OnClickListener onclick = new View.OnClickListener(){
            public void onClick(View view){
                loadThesaurus(view);
            }
        };
        // connect button and listener
        button2.setOnClickListener(onclick);
    }

    // create implicit intent
    private void loadThesaurus(View view){
        Intent intent = new Intent(Intent.ACTION_VIEW);
        intent.setData(Uri.parse(emotionURL));
        startActivity(intent);
    }


}


