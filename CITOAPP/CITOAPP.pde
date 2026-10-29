PImage fundo;
PImage celula;
PImage nucleo;
PImage nucleolo;
PImage mitocondria;
PImage golgi;
PImage rugoso;
PImage liso;
PImage lisossomo;
PImage centriolo; 
PImage bicamada;
PImage citoplasma;
PImage citoesqueleto;

String texto = "";
String resultado = "";
String respostaCorreta = "";

int tela = 0;
int pontos = 0;
int tentativas = 0;

boolean esperando = false;
boolean fimQuiz = false;
boolean caixativa = false;

int tempoResposta = 0;

// respostas aceitas
String[][] respostas = {

  {"nucleo", "núcleo", "six seven"},
  {"nucleolo", "nucléolo"},
  {"mitocondria", "mitocondrias"},
  {"complexo de golgi", "complexo golgiense", "golgi"},
  {"reticulo endoplasmatico rugoso", "rer"},
  {"reticulo endoplasmatico liso", "rel"},
  {"lisossomo", "lisossomos"},
  {"centriolo", "centríolo"},
  {"membrana plasmatica", "bicamada fosfolipidica"},
  {"citoplasma"},
  {"citoesqueleto", "citoesqueletos"}
};

void setup(){

  size(1250, 650);

  fundo = loadImage("Background_citoapp.png");

  celula = loadImage("Eucarionte Animal1.png");
  
  nucleo = loadImage("nucleoA.png");
  
  nucleolo = loadImage("nucleoloA.png");
  
  mitocondria = loadImage("mitocondria.png");
  
  golgi = loadImage("golgi.png");
  
  rugoso = loadImage("rugoso.png");
  
  liso = loadImage("liso.png");
  
  lisossomo = loadImage("lisossomo.png");
  
  centriolo = loadImage("centriolo.png");
  
  bicamada = loadImage("bicamada.png");
  
  citoplasma = loadImage("citoplasma.png");
  
  citoesqueleto = loadImage("citoesqueleto.png");

  textFont(createFont("Impact", 20));
}
void draw(){

  background(255);

  // fundo
  image(fundo, 0, 0, width, height);

  // célula
  image(celula, 170, 140, 380, 380);
  
  //núcleo
  if (tela == 0){
    image(nucleo, 170, 140, 380, 380);
  }
  
  //nucléolo
  else if (tela == 1){
    image(nucleolo, 170, 140, 380, 380);
  }

  // mitocondria
  else if (tela == 2){
    image(mitocondria, 170, 140, 380, 380);
  }
  
  //golgi
  else if (tela == 3){
    image(golgi, 170, 140, 380, 380);
  }
  
  //rugososo
  else if (tela == 4){
    image(rugoso, 170, 140, 380, 380);
  }
  
  //liso
  else if (tela == 5){
    image(liso, 170, 140, 380, 380);
  }
  
  //lisossomo
  else if (tela == 6){
    image(lisossomo, 170, 140, 380, 380);
  }
  
  else if (tela == 7){
    image(centriolo, 170, 140, 380, 380);
  }
  
  else if (tela == 8){
    image(bicamada, 170, 140, 380, 380);
  }
  else if (tela == 9){
    image(citoplasma, 170, 140, 380, 380);
  }
  else if (tela == 10){
    image(citoesqueleto, 170, 140, 380, 380);
  }
  
  
  // texto digitado
  fill(0);

  textSize(34);

  text(texto, 650, 340);

  // pontos
  fill(30,120,255);

  textSize(20);

  text("Pontos: " + pontos, 160, 105);

  //cursor de texto
  textSize(34);
  fill(0);
  if(caixativa){
    if(frameCount % 6 < 3){
      text("|", 650 + textWidth(texto), 340);
    }
  }
  
  // tentativas
  text("Tentativa: " + (tentativas + 1) + "/3", 160, 135);

  // linha indicando organela
  if(!fimQuiz){
    desenharTag();
  }

  // resultado correto
  if(resultado.equals("Correto!")){

    fill(90, 210, 120);

    textSize(28);

    text(resultado, 680, 485);
  }

  // resultado incorreto
  else if(resultado.equals("Incorreto!")){

    fill(220, 70, 70);

    textSize(28);

    text(resultado, 680, 485);

    fill(0);

    textSize(18);

    text(respostaCorreta, 680, 510);
  }

  // tela final
  if(fimQuiz){

    fill(30,120,255);

    textSize(32);

    text("Próxima Célula", 680, 485);

    textSize(22);

    text("Total de pontos: " + pontos, 680, 510);
  }

  // troca automática
  if(esperando){

    if(millis() - tempoResposta > 800){

      tela++;

      texto = "";
      resultado = "";
      respostaCorreta = "";

      tentativas = 0;

      esperando = false;

      if(tela >= respostas.length){

        fimQuiz = true;
      }
    }
  }
}

void mousePressed(){

  if(fimQuiz) return;

  // botão confirmar
  if(mouseX > 610 &&
     mouseX < 1115 &&
     mouseY > 370 &&
     mouseY < 445){

    validarResposta();
  }
    if((mouseX > 626 && mouseX < 1098) && (mouseY > 279 && mouseY < 376)){
    caixativa = true;
  }
  else{
    caixativa = false;
  }
  
}

void validarResposta(){

  if(esperando) return;

  String digitado =
  texto.toLowerCase().trim();

  boolean acertou = false;

  for(int i = 0;
      i < respostas[tela].length;
      i++){

    if(digitado.equals(
       respostas[tela][i])){

      acertou = true;
    }
  }

  // acertou
  if(acertou){

    resultado = "Correto!";

    if(tentativas == 0){

      pontos += 30;

    } else if(tentativas == 1){

      pontos += 20;

    } else {

      pontos += 10;
    }

    respostaCorreta = "";

    tempoResposta = millis();

    esperando = true;
  }

  // errou
  else {

    tentativas++;

    if(tentativas < 3){

      resultado = "Incorreto!";

      respostaCorreta =
      "Tentativa " + tentativas + " de 3";

      texto = "";
    }

    else {

      resultado = "Incorreto!";

      respostaCorreta =
      "Resposta correta: " +
      respostas[tela][0];

      tempoResposta = millis();

      esperando = true;
    }
  }
}    


void keyPressed(){

  if(esperando || fimQuiz) return;

  // apagar
  if(key == BACKSPACE){

    if(texto.length() > 0){

      texto =
      texto.substring(
      0,
      texto.length()-1);
    }
  }

  // ignorar teclas especiais
  else if(key != ENTER &&
          key != RETURN &&
          key != CODED){

    texto += key;
  }
}

void desenharTag(){
}
