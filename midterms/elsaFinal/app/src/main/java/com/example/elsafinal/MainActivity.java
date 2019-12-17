// sources of reference can be found on this course's github:
// https://github.com/CUATLAS/Fall19_MAD_examples/tree/master/week%2012%20Android%20activities%20and%20intents

package com.example.elsafinal;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.ImageView;
import android.widget.RadioGroup;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {
    private Spinner location; // location
    private Button findButton; // button to find location
    private BurritoShop myBurrito = new BurritoShop();
    private Button messageButton; // button to build burrito and stuff
    private RadioGroup type; // either burrito or taco
    private CheckBox salsaBox; // salsa checkbox
    private CheckBox creamBox; // sour cream checkbox
    private CheckBox cheeseBox; // cheese checkbox
    private CheckBox guacBox; // guacamole checkbox


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        // get checkboxes
        salsaBox = findViewById(R.id.checkBox);
        creamBox = findViewById(R.id.checkBox2);
        cheeseBox = findViewById(R.id.checkBox3);
        guacBox = findViewById(R.id.checkBox4);
        // get spinner
        location = findViewById(R.id.spinner);
        // get radio buttons
        type = findViewById(R.id.radioGroup);
        // get button
        findButton = findViewById(R.id.button2);
        // create listener for findFood
        View.OnClickListener onclick = new View.OnClickListener(){
            public void onClick(View view){
                findFood(view);
            }
        };
        // add listener to findButton
        findButton.setOnClickListener(onclick);

        // get other button
        messageButton = findViewById(R.id.button);
        // create listener for makeFood
        View.OnClickListener onclick2 = new View.OnClickListener(){
            public void onClick(View view){
                makeFood(view);
            }
        };
        // add listener to messageButton
        messageButton.setOnClickListener(onclick2);
    }

    public void makeFood(View view){
        TextView mealDetails = findViewById(R.id.message);
        ImageView meal = findViewById(R.id.imageView2);
        // check box booleans
        Boolean salsaYes = salsaBox.isChecked();
        Boolean creamYes = creamBox.isChecked();
        Boolean cheeseYes = cheeseBox.isChecked();
        Boolean guacYes = guacBox.isChecked();

        // if no toppings were picked
        String toppingsList = "Your toppings include: the basic stuff, ";
        if(salsaYes){
            toppingsList = toppingsList +  "salsa, ";
        }
        if(creamYes){
            toppingsList  = toppingsList  + "sour cream, ";
        }
        if(cheeseYes){
            toppingsList = toppingsList + "cheese, ";
        }
        if(guacYes){
            toppingsList = toppingsList + "guacamole, ";
        }


        int type_id = type.getCheckedRadioButtonId();

        // set image and message based on radio buttons
        if(type_id == -1){
            Context context = getApplicationContext();
            CharSequence text = "Please select either burrito or taco";
            int duration = Toast.LENGTH_SHORT;
            Toast toast = Toast.makeText(context, text,  duration);
            toast.show();
        } else if(type_id == R.id.radioButton){ //  burrito
            meal.setImageResource(R.drawable.burrito);
            mealDetails.setText("You want a burrito. " + toppingsList + "and happiness!");
        } else if(type_id == R.id.radioButton2){ // taco
            meal.setImageResource(R.drawable.taco);
            mealDetails.setText("You want a taco. " + toppingsList + "and happiness!");
        }


    }

    public void findFood(View view){
        // get selected spinner item from array
        Integer spot = location.getSelectedItemPosition();
        // SET the location for burritoShop
        myBurrito.setBurritoShop(spot);
        myBurrito.setBurritoWebsite(spot);
        // GET the location for burritoShop
        String suggestedBurritoShop = myBurrito.getBurritoShop();
        String suggestedWebsite = myBurrito.getBurritoWebsite();

        // toast if location is still at "-"
        if(spot == 0){
            Context context = getApplicationContext();
            CharSequence text = "Please select a location";
            int duration = Toast.LENGTH_SHORT;
            Toast toast = Toast.makeText(context, text,  duration);
            toast.show();
        }else{ // otherwise, explicit intent to the other activity
            // create intent
            Intent intent =  new Intent(this, BurritoActivity.class);
            // pass data
            intent.putExtra("burritoShopName", suggestedBurritoShop);
            intent.putExtra("websiteName", suggestedWebsite);
            // start intent
            startActivity(intent);
        }


    }
}
