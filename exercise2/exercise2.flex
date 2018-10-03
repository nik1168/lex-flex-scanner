%%// Options of the scanner

%class Lexer2	//Name
%unicode			//Use unicode
%line         //Use line counter (yyline variable)
%standalone		//Tell that Jflex don't use a parser

%{//adding Java code (methods, inner classes, ...)
 private void test(String word){
            System.out.print(word);
 		}
%}

//Extended Regular Expressions

Alpha          = [A-Z]|[a-z]
Numeric        = [0-9]
AlphaNumChar	 = {Alpha}|{Numeric}

%% //Identification of tokens

{Alpha}	{test(yytext());}