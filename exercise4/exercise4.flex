//import java_cup.runtime.*; uncommet if you use CUP

%%// Options of the scanner

%class Lexer4	//Name
%unicode			//Use unicode
%column			//Use character counter by line (yycolumn variable)                       2. Symbol(int id,int line, int column,Object value)
%standalone

%{//adding Java code (methods, inner classes, ...)
private int compilerCount = 0;
private String startCharacter = "";

private void replaceCompilerWord(){
    compilerCount++;
    if(startCharacter.equals("a")){
        System.out.print("nope");
    }
    else if(startCharacter.equals("b")){
       System.out.print("???"); 
    }
    else if(startCharacter.equals("c")){
        System.out.print("!!!"); 
    }
}

private void setStartCharacter(String word){
    startCharacter = word.substring(0, 1);
}
%}

//Extended Regular Expressions//

Compiler = "compiler"
EndOfLine = "\r"?"\n"
Line				= .+

%%//Identification of tokens and actions
{Compiler}	{replaceCompilerWord();}
^.           {setStartCharacter(yytext());System.out.print(yytext());}

