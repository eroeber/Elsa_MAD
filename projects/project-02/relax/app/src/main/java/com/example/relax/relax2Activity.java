package com.example.relax;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.widget.ImageView;

import com.bumptech.glide.Glide;


public class relax2Activity extends AppCompatActivity {
    private String habitat;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_relax2);

        ImageView imageView = findViewById(R.id.imageView);
       // receive intent data
        Intent intent = getIntent();
        habitat = intent.getStringExtra("habitatName");



        // show gif image using glide (depending on radio button!!!)
        // my source of youtube tutorial:
        // https://www.youtube.com/watch?v=CKsRo6ksvio
        // the github used in the youtube tutorial:
        // https://github.com/bumptech/glide

        if(habitat.equals("ocean")){
            Glide.with(this).load(R.raw.ocean).into(imageView);
        }else if(habitat.equals("desert")){
            Glide.with(this).load(R.raw.desert).into(imageView);
        }else if(habitat.equals("forest")){
            Glide.with(this).load(R.raw.forest).into(imageView);
        }



    }

}
