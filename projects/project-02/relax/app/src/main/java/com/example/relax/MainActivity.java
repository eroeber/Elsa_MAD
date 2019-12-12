package com.example.relax;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

    private Button button;
    private RadioGroup colorButton;
    private RadioButton rb1;
    private RadioButton rb2;
    private RadioButton rb3;
    private infoClass myInfo = new infoClass();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        // get button
        button = findViewById(R.id.button);
        // get radio buttons
        colorButton = findViewById(R.id.radioGroup);
        rb1 = findViewById(R.id.radioButton);
        rb2 = findViewById(R.id.radioButton2);
        rb3 = findViewById(R.id.radioButton3);


        // create listener
        View.OnClickListener onclick = new View.OnClickListener(){
            public void onClick(View view){
                findSpiral(view);
            }
        };
        // add listener to button
        button.setOnClickListener(onclick);
    }

    private void findSpiral(View view) {
        // get selected choice of radio buttons
        int colorButton_id = colorButton.getCheckedRadioButtonId();

        // set up toast
        if (colorButton_id == -1) {
            Context context = getApplicationContext();
            CharSequence text = "Please select both a color and a length";
            int duration = Toast.LENGTH_SHORT;
            Toast toast = Toast.makeText(context, text, duration);
            toast.show();
        } // if any one of the radio buttons is checked, set habitat and get it to send in intent
        else if (colorButton_id == R.id.radioButton) { // ocean
            myInfo.setHabitat(0);
            String resultHabitat = myInfo.getHabitat();
            // create intent
            Intent intent = new Intent(this, relax2Activity.class);
            // pass data
            intent.putExtra("habitatName", resultHabitat);
            // start intent
            startActivity(intent);
        } else if (colorButton_id == R.id.radioButton2) { // desert
            myInfo.setHabitat(1);
            String resultHabitat = myInfo.getHabitat();
            // create intent
            Intent intent = new Intent(this, relax2Activity.class);
            // pass data
            intent.putExtra("habitatName", resultHabitat);
            // start intent
            startActivity(intent);
        } else if (colorButton_id == R.id.radioButton3) { // forest
            myInfo.setHabitat(2);
            String resultHabitat = myInfo.getHabitat();
            // create intent
            Intent intent = new Intent(this, relax2Activity.class);
            // pass data
            intent.putExtra("habitatName", resultHabitat);
            // start intent
            startActivity(intent);
        }
    }
}
