package com.example.elsafinal;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

public class BurritoActivity extends AppCompatActivity {

    private String burritoShop;
    private String burritoSite;
    private Button urlButton;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_burrito);

        // get intent
        Intent intent = getIntent();
        burritoShop = intent.getStringExtra("burritoShopName");
        burritoSite = intent.getStringExtra("websiteName");

        // update text view
        TextView locationMessage  =   findViewById(R.id.textView6);
        locationMessage.setText("You should head to "   + burritoShop);

        // get button
        urlButton = findViewById(R.id.button3);
        // create listener
        View.OnClickListener onclick = new View.OnClickListener(){
          public void onClick(View view){
              LoadBurritoSite(view);
          }
        };
        // attach listener to button
        urlButton.setOnClickListener(onclick);
    }

    private void LoadBurritoSite(View view){
        Intent intent = new Intent(Intent.ACTION_VIEW);
        intent.setData(Uri.parse(burritoSite));
        startActivity(intent);
    }
}
