package com.example.ab_07;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Context;
import android.os.Bundle;
import android.view.View;
import android.widget.RadioGroup;
import android.widget.Spinner;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;
import android.widget.ToggleButton;

import org.w3c.dom.Text;

import java.util.Random;

public class MainActivity extends AppCompatActivity {
    private ToggleButton toggle;
    private Spinner numChoices;
    private RadioGroup care;
    // private Switch s;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // get stuff upon creation
        toggle = findViewById(R.id.toggleButton);
        numChoices = findViewById(R.id.spinner);
        care = findViewById(R.id.radioGroup);
    }

    public void makeChoice(View view){
        TextView choiceText = findViewById(R.id.textView2);
        Switch mySwitch = findViewById(R.id.switch1);
        TextView importance = findViewById(R.id.textView6);

        boolean goodBad = toggle.isChecked();
        boolean organized  = mySwitch.isChecked();

        String stringNum = String.valueOf(numChoices.getSelectedItem());
        int numChoice = Integer.parseInt(stringNum);
        int min = 1;
        int max = numChoice;
        int newChoice = new Random().nextInt((max - min) + 1) + min;

        int care_id = care.getCheckedRadioButtonId();

        if(!organized){
            // make toast
            Context context = getApplicationContext();
            CharSequence text = "Please number the different options for yourself";
            int duration = Toast.LENGTH_SHORT;
            Toast toast =  Toast.makeText(context, text, duration);
            toast.show();
        }else{
            if(goodBad){
                choiceText.setText("Bad decision made! Choice number: " + newChoice +" out of " + numChoice);
            }
            else{
                choiceText.setText("Good decision made! Choice number: " + newChoice +" out of " + numChoice);
            }
        }

        if(care_id == R.id.radioButton){
            importance.setText("But if you do not care, do what you want!");
        } else if(care_id == R.id.radioButton2){
            importance.setText("It will either be good or it will be bad");
        }else if(care_id == R.id.radioButton3){
            importance.setText("Hopefully this goes well for you! Stakes are high!");
        }else{
            importance.setText("Best of luck!");
        }

    }
}
