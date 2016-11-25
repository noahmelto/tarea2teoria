/*Metodos: cambiarColor(char color)
 * cambiarDireccion(char Direccion)
 * bajarPluma()
 * levantarPluma()
 * colorTablero()
 * avanzar(int n)
 * inTabla()
 * 
 * isLevantada()
 * getX()
 * getY()
 * getColor()
 * getDir() */
public class Pluma {
	private boolean levantada; //levanatada o apoyada
	private int x,y; //coordenadas
	private char c;
	private char direc;
	Tablero T;
	
	public Pluma()
	{
		levantada = true;
		x=0;
		y=0;
		c='b'; //blanco
		direc='E'; 
		T=new Tablero();
				
	}
	
	public void cambiarColor(char color)
	{
		c=color;
	}
	
	public void cambiarDireccion(char Direccion)
	{
		direc=Direccion;
	}
	
	public void bajarPluma()
	{
		levantada= false;
	}
	
	public void levantarPluma()
	{
		levantada= true;
	}
	
	//Retorna el color del tablero en la pos actual.
	public char colorTablero()
	{
		return T.getTabla()[x][y];
	}
	
	//Se mueve n casillas en la direccion que esta la pluma cambiando el color de las casillas por
	//las que pasa en caso de estar apollada y al final comprueba si se salio de la tabla.
	public void avanzar(int n)
	{
		if (levantada)
		{
			if (direc=='N') y+=n;
			else if (direc=='S') y-=n;
			else if (direc=='E') x+=n;
			else if (direc =='O')x-=n;
			else System.out.println("Direccion no existente");
		}
		
		else
		{
			if (direc == 'N')
			{
			    for(int i=0; i<n && inTabla() ;i++)
			    {
			    	T.colorear(x,y,c);
			    	y++;
			    }
			}
			
			else if (direc == 'S')
			{
			    for(int i=0; i<n && inTabla() ;i++)
			    {
			    	T.colorear(x,y,c);
			    	y--;
			    }
			}
			
			else if (direc == 'E')
			{
			    for(int i=0; i<n && inTabla() ;i++)
			    {
			    	T.colorear(x,y,c);
			    	x++;
			    }
			}
			
			else if (direc == 'O')
			{
			    for(int i=0; i<n && inTabla() ;i++)
			    {
			    	T.colorear(x,y,c);
			    	x--;
			    }
			}
			
			else System.out.println("Direccion no existente");
			if(!inTabla()) System.out.println("La pluma se salio de la tabla");
		}
	}
	
	public boolean inTabla()
	{
		if (x>49 || y>49 || x<0 || y<0) return false;
		else return true;
	}
	
	public boolean isLevantada()
	{
		return levantada;
	}
	
	public int getX()
	{
		return x;
	}
	
	public int getY()
	{
		return y;
	}
	
	public char getColor()
	{
		return c;
	}
	
	public char getDir()
	{
		return direc;
	}
	
	

}
