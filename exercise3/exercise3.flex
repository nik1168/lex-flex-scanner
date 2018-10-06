//import java_cup.runtime.*; uncommet if you use CUP

%%// Options of the scanner

%class Lexer3	//Name
%unicode			//Use unicode
%line				//Use line counter (yyline variable)
%column			//Use character counter by line (yycolumn variable)

//you can use either %cup or %standalone
//   %standalone is for a Scanner which works alone and scan a file
//   %cup is to interact with a CUP parser. In this case, you have to return
//        a Symbol object (defined in the CUP library) for each action.
//        Two constructors:
//                          1. Symbol(int id,int line, int column)
//                          2. Symbol(int id,int line, int column,Object value)
%standalone

////////
//CODE//
////////
%init{//code to execute before scanning
	System.out.println("Initialization exercise 3");
%init}

%{//adding Java code (methods, inner classes, ...)
%}

%eof{//code to execute after scanning
   System.out.println("Done scanning");
%eof}

////////////////////////////////
//Extended Regular Expressions//
////////////////////////////////

EndOfLine = "\r"?"\n"
OpenCurly = "{"
CloseCurly = "!}"

//////////
//States//
//////////

%xstate YYINITIAL, PRINT_COMMENT

%%//Identification of tokens and actions

<YYINITIAL>{
   {OpenCurly} {yybegin(PRINT_COMMENT);}
   .           {} //by default, all non matched char are printed on output
                  //we force to not print them
}

<PRINT_COMMENT>{
	{CloseCurly} {yybegin(YYINITIAL);}
	.           {System.out.print(yytext());} //we print them explicitly
}

