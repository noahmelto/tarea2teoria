
/* --------------------------Codigo de Usuario----------------------- */
package ejemplocup;

import java_cup.runtime.*;
import java.io.Reader;
      
%% //inicio de opciones
   
/* ------ Seccion de opciones y declaraciones de JFlex -------------- */  
   
/* 
    Cambiamos el nombre de la clase del analizador a Lexer
*/
%class AnalizadorLexico

/*
    Activar el contador de lineas, variable yyline
    Activar el contador de columna, variable yycolumn
*/
%line
%column
    
/* 
   Activamos la compatibilidad con Java CUP para analizadores
   sintacticos(parser)
*/
%cup
   
/*
    Declaraciones

    El codigo entre %{  y %} sera copiado integramente en el 
    analizador generado.
*/
%{
    /*  Generamos un java_cup.Symbol para guardar el tipo de token 
        encontrado */
    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }
    
    /* Generamos un Symbol para el tipo de token encontrado 
       junto con su valor */
    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }
%}
   

/*
    Macro declaraciones
  
    Declaramos expresiones regulares que despues usaremos en las
    reglas lexicas.
*/
   
/*  Un salto de linea es un \n, \r o \r\n dependiendo del SO   */
Salto = \r|\n|\r\n
   
/* Espacio es un espacio en blanco, tabulador \t, salto de linea 
    o avance de pagina \f, normalmente son ignorados */
Espacio     = {Salto} | [ \t\f]
   
/* Una literal entera es un numero 0 oSystem.out.println("\n*** Generado " + archNombre + "***\n"); un digito del 1 al 9 
    seguido de 0 o mas digitos del 0 al 9 */
Entero = 0 | [1-9][0-9]*

Boleano = true | false


%% //fin de opciones
/* -------------------- Seccion de reglas lexicas ------------------ */
   
/*
   Esta seccion contiene expresiones regulares y acciones. 
   Las acciones son código en Java que se ejecutara cuando se
   encuentre una entrada valida para la expresion regular correspondiente */
   
   /* YYINITIAL es el estado inicial del analizador lexico al escanear.
      Las expresiones regulares solo serán comparadas si se encuentra
      en ese estado inicial. Es decir, cada vez que se encuentra una 
      coincidencia el scanner vuelve al estado inicial. Por lo cual se ignoran
      estados intermedios.*/
   
<YYINITIAL> {
   
    /* Regresa que el token SEMI declarado en la clase sym fue encontrado. */
    ";"                { return symbol(sym.SEMI); }
    /* Regresa que el token OP_SUMA declarado en la clase sym fue encontrado. */
    "+"                {  System.out.print(" + ");
                          return symbol(sym.OP_SUMA); }
    /* Regresa que el token OP_SUMA declarado en la clase sym fue encontrado. */
    "-"                {  System.out.print(" - ");
                          return symbol(sym.OP_RESTA); }
    /* Regresa que el token OP_SUMA declarado en la clase sym fue encontrado. */
    "*"                {  System.out.print(" * ");
                          return symbol(sym.OP_MULT); }
    /* Regresa que el token PARENIZQ declarado en la clase sym fue encontrado. */
    "("                {  System.out.print(" ( ");
                          return symbol(sym.PARENIZQ); }
                          /* Regresa que el token PARENIZQ declarado en la clase sym fue encontrado. */
    ")"                {  System.out.print(" ) ");
                          return symbol(sym.PARENDER); }

     /* Regresa que el token DOWNDPEN declarado en la clase sym fue encontrado. */
    "bajar-pluma"                {  System.out.print(" bajar-pluma ");
                          return symbol(sym.DOWNDPEN); }
    /* Regresa que el token UPDPEN declarado en la clase sym fue encontrado. */
    "levantar-pluma"                {  System.out.print(" levantar-pluma ");
                          return symbol(sym.UPDPEN); }
    /* Regresa que el token COLORDPEN declarado en la clase sym fue encontrado. */
    "color-pluma"                {  System.out.print(" color-pluma ");
                          return symbol(sym.COLORDPEN); }
    /* Regresa que el token DIRDPEN declarado en la clase sym fue encontrado. */
    "direccion-pluma"                {  System.out.print(" direccion-pluma ");
                          return symbol(sym.DIRDPEN); }
    /* Regresa que el token GOFWD declarado en la clase sym fue encontrado. */
    "avanzar"                {  System.out.print(" avanzar ");
                          return symbol(sym.GOFWD); }
    /* Regresa que el token IF declarado en la clase sym fue encontrado. */
    "if"                {  System.out.print(" if ");
                          return symbol(sym.IF); }
    /* Regresa que el token THEN declarado en la clase sym fue encontrado. */
    "then"                {  System.out.print(" then ");
                          return symbol(sym.THEN); }
    /* Regresa que el token ELSE declarado en la clase sym fue encontrado. */
    "else"                {  System.out.print(" else ");
                          return symbol(sym.ELSE); }
    /* Regresa que el token WHILE declarado en la clase sym fue encontrado. */
    "while"                {  System.out.print(" while ");
                          return symbol(sym.WHILE); }
    /* Regresa que el token DO declarado en la clase sym fue encontrado. */
    "do"                {  System.out.print(" do ");
                          return symbol(sym.DO); }
    /* Regresa que el token TABLECOL declarado en la clase sym fue encontrado. */
    "tablero-color"                {  System.out.print(" tablero-color ");
                          return symbol(sym.TABLECOL); }
    /* Regresa que el token BOUND declarado en la clase sym fue encontrado. */
    "borde"                {  System.out.print(" borde ");
                          return symbol(sym.BOUND); }
    /* Regresa que el token PENDIR declarado en la clase sym fue encontrado. */
    "pluma-dir"                {  System.out.print(" pluma-direccion ");
                          return symbol(sym.PENDIR); }
    /* Regresa que el token PENCOL declarado en la clase sym fue encontrado. */
    "pluma-col"                {  System.out.print(" pluma-color ");
                          return symbol(sym.PENCOL); }
    /* Regresa que el token PENUP declarado en la clase sym fue encontrado. */
    "pluma-arriba"                {  System.out.print(" pluma-arriba ");
                          return symbol(sym.PENUP); }
    /* Regresa que el token PENDOWN declarado en la clase sym fue encontrado. */
    "pluma-abajo"                {  System.out.print(" pluma-abajo ");
                          return symbol(sym.PENDOWN); }
    /* Regresa que el token AND declarado en la clase sym fue encontrado. */
    "and"                {  System.out.print(" and ");
                          return symbol(sym.AND); }
    /* Regresa que el token OR declarado en la clase sym fue encontrado. */
    "or"                {  System.out.print(" or ");
                          return symbol(sym.OR); }
    /* Regresa que el token NOT declarado en la clase sym fue encontrado. */
    "not"                {  System.out.print(" not ");
                          return symbol(sym.NOT); }
    /* Regresa que el token PARENIZQ declarado en la clase sym fue encontrado. */
    "{"                {  System.out.print(" PARENIZQ ");
                          return symbol(sym.OR); }
    /* Regresa que el token PARENDER declarado en la clase sym fue encontrado. */
    "}"                {  System.out.print(" PARENDER ");
                          return symbol(sym.NOT); }
   
   {Boleano}      {   System.out.print(yytext()); 
                      return symbol(sym.BOOLEANO, new Boolean(yytext())); }
    /* Si se encuentra un entero, se imprime, se regresa un token numero
        que representa un entero y el valor que se obtuvo de la cadena yytext
        al convertirla a entero. yytext es el token encontrado. */
    {Entero}      {   System.out.print(yytext()); 
                      return symbol(sym.ENTERO, new Integer(yytext())); }

    /* No hace nada si encuentra el espacio en blanco */
    {Espacio}       { /* ignora el espacio */ } 
}


/* Si el token contenido en la entrada no coincide con ninguna regla
    entonces se marca un token ilegal */
[^]                    { throw new Error("Caracter ilegal <"+yytext()+">"); }
