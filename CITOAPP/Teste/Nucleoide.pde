void tag_1(float x, float y){
  //Nucleoide
//Linha indicadora
  fill(0);
  line(400, 320, 800, 200); 
}

String texto = "";
void keyTyped(){
  frameRate(120);
  fill(0);
  textSize(25);
  text(texto, 835, 225);
  if(key == BACKSPACE && texto.length() >= 0 ){
    texto = texto.substring(0, texto.length()-1);
  } else if(key != ENTER && key != RETURN) {
  texto +=  key;
  }
}
