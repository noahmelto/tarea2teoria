package javaFXsample;


import javafx.application.Application;
import javafx.geometry.Insets;
import javafx.scene.Scene; 
import javafx.scene.layout.GridPane;
import javafx.scene.paint.Color;
import javafx.scene.shape.Rectangle;
import javafx.stage.Stage;

public class Main extends Application {
	
	Stage window;
	

	public static void main(String[] args) {
		launch(args);

	}
	
	
	
	public static GridPane crearGrilla(char[][] tabla){
		
		GridPane grilla = new GridPane();
		grilla.setPadding(new Insets(10,10,10,10));
		
		
		Rectangle[][] r = new Rectangle[50][50];
		for(int i=0;i<50;i++){
			for(int j=0;j<50;j++){
				r[i][j]= Main.elegirColor(tabla[i][j]);
				GridPane.setConstraints(r[i][j], i, j);
				grilla.getChildren().add(r[i][j]);
			}
		}
		return grilla;
	}

	
	private static Rectangle elegirColor(char c) {
		Rectangle rec = new Rectangle(8,8,Color.YELLOW); //Va a pintar amarillo si hay algun error
		if(c=='A')rec.setFill(Color.BLUE);
		else if (c == 'R') {rec.setFill(Color.RED);}
		else if (c == 'V') {rec.setFill(Color.GREEN);}
		else if (c == 'B') {rec.setFill(Color.WHITE);}
		else if (c == 'N') {rec.setFill(Color.BLACK);}
		
		return rec;
	}



	public void start(Stage primaryStage) throws Exception {
		
		window = primaryStage;
		window.setTitle("Tarea 2 CC3102");
		char[][] tablero =null;         //Aqui ingresar la matriz de caracteres
		GridPane grilla = Main.crearGrilla(tablero);
		
		
		Scene scene = new Scene(grilla,450,450);
		window.setScene(scene);
		window.show();
	}
	
	

}
