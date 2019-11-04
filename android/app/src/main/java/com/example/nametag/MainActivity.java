package com.example.nametag;

import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    public void sayHi(View view) {
        TextView nameText  = findViewById(R.id.message);
//         nameText.setText("Nice to Meet You!");

        EditText name = findViewById(R.id.editText);
        String userName  = name.getText().toString();
        nameText.setText("Nice to meet you " + userName + "!");

        //  here is imageView stuff
        ImageView tag = findViewById(R.id.imageView);
        tag.setImageResource(R.drawable.tag2);

        // name on name tag thing
        TextView bottomName = findViewById(R.id.textView);
        bottomName.setText(userName);
    }
}
