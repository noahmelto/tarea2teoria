import java.util.Arrays;

public class Tablero {
	private char[][] tabla;
	
	public Tablero()
	{
		tabla= new char[50][50];
		for(int i=0;i<50;i++){
		Arrays.fill(tabla[i], 'b');
		}
	}
	
	public char[][] getTabla()
	{
		return tabla;
	}
	
	public void colorear(int x, int y, char color)
	{
		tabla[x][y] = color;
	}
	

}

