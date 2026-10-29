void setup(){
  size(1250, 650);
  background(149, 169, 207);
}
//Procarionte
PImage procarionte;
void draw(){
  //Fixo - Tela 2
//Imagem 
  procarionte = loadImage("Procarionte4.png");
  image(procarionte, 10, 45, 700, 550);

//Texto principal
  textSize(25);
  fill(0);
  text("Insira o nome da parte da célula:", 820, 105);
  
//Linha de resposta
  fill(71, 120, 207);
  line(830, 230, 1165, 230); 

//Perguntas
  tag_1(400, 320);
}
