/*
    vhd2vl v2.3
    VHDL to Verilog RTL translator
    Copyright (C) 2001 Vincenzo Liguori - Ocean Logic Pty Ltd - http://www.ocean-logic.com
    Modifications Copyright (C) 2006 Mark Gonzales - PMC Sierra Inc
    Modifications Copyright (C) 2008-2010 Larry Doolittle - LBNL

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License along
    with this program; if not, write to the Free Software Foundation, Inc.,
    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
*/

%option noinput
%option nounput

%{
#include <stdio.h>
#include <string.h>
#include "def.h"
#include "vhd2vl.tab.h"

extern int lineno;

extern int skipRem;

void getstring(unsigned skip);
void getbasedstring(unsigned skip);

%}
%%

[ \t] {;}

"--".*\n {
  lineno++;
  if (skipRem == 0) {
    /* sometimes comments should be dropped by lex -
     * e.g. in expressions - this makes the grammar much simpler
     */
    size_t l=strlen(yytext);
    yylval.txt=malloc(l+1);
    strcpy(yylval.txt, yytext);
    yylval.txt[0]='/';
    yylval.txt[1]='/';
    if(yylval.txt[l-2]=='\r') {
       yylval.txt[l-2]='\n';
       yylval.txt[l-1]='\0';
    }
    return REM;
  }
}
"library ".*\n {lineno++;}
"use ".*\n {lineno++;}

"\x0d\n" |
\n { lineno++;}

(?i:entity) { return ENTITY; }
(?i:procedure) { return PROCEDURE; }
(?i:function) { return FUNCTION; }
(?i:return) { return RETURN; }
(?i:is) { return IS; }
(?i:port) { return PORT; }
(?i:generic) { return GENERIC; }
(?i:map) { return MAP; }
(?i:in) { return IN; }
(?i:out) { return OUT; }
(?i:inout) { return INOUT; }
(?i:time) |
(?i:natural) |
(?i:positive) |
(?i:integer) { return INTEGER; }
(?i:boolean) |
(?i:std_logic) |
(?i:std_ulogic) { return BIT; }
(?i:signed) |
(?i:unsigned) |
(?i:std_logic_vector) |
(?i:std_ulogic_vector) { return BITVECT; }
(?i:real) { return REAL; }
(?i:downto) { return DOWNTO; }
(?i:to) { return TO; }
(?i:type) {return TYPE; }
(?i:subtype) {return SUBTYPE; }
(?i:end) { return END; }
(?i:for) { return FOR; }
(?i:loop) { return LOOP; }
(?i:generate) { return GENERATE; }
(?i:architecture) { return ARCHITECTURE; }
(?i:component) { return COMPONENT; }
(?i:of) { return OF; }
(?i:array) {return ARRAY; }
(?i:signal) { return SIGNAL; }
(?i:begin) { return BEGN; }
(?i:not) { return NOT; }
(?i:when) { return WHEN; }
(?i:exit) { return EXIT; }
(?i:with) { return WITH; }
(?i:select) { return SELECT; }
(?i:others) { return OTHERS; }
(?i:range) { return RANGE; }
(?i:process) { return PROCESS; }
(?i:variable) { return VARIABLE; }
(?i:constant) { return CONSTANT; }
(?i:null) { return NULLV; }
(?i:open) { return OPEN; }
(?i:if) { return IF; }
(?i:then) { return THEN; }
(?i:elsif) { return ELSIF; }
(?i:else) { return ELSE; }
(?i:while) { return WHILE; }
(?i:case) { return CASE; }
(?i:after) { return AFTER; }
(?i:and) { return AND; }
(?i:or) { return OR; }
(?i:xor) { return XOR; }
(?i:xnor) { return XNOR; }
(?i:mod) { return MOD; }
(?i:event) { return EVENT; }
(?i:rising_edge) { return POSEDGE;}
(?i:falling_edge) { return NEGEDGE;}
(?i:resize) { return CONVFUNC_2;}
(?i:to_unsigned) { return CONVFUNC_2;}
(?i:to_integer) |
(?i:conv_integer) { return CONVFUNC_1;}
(?i:left) { return LEFT;}
(?i:high) { return LEFT;}
(?i:assert) {return ASSERT;}
(?i:report) {return REPORT;}
(?i:severity) {return SEVERITY;}
(?i:failure) {return FAILURE;}
(?i:error) {return ERROR;}
(?i:warning) {return WARNING;}
(?i:note) {return NOTE;}


\"[ \!#-~]*\" |
\'[01xz]\' { getstring(1); return STRING;}

#[0-9a-f]*# {
  getbasedstring(1); /* skip leading # */
  return BASED;
}

[a-zA-Z_$][a-zA-Z0-9_$.]* {
  yylval.txt=malloc(strlen(yytext)+1);
  strcpy(yylval.txt, yytext);
  return NAME;
}

[0-9]+ {
  sscanf(yytext, "%d", &yylval.n);
  return NATURAL;
}

[a-zA-Z0-9_$.]+[ ]?\*\*[ ]?[a-zA-Z0-9_$.]+ {
  getstring(0);
  return EXPONENT;
}

[0-9]+e[0-9]+ |
[0-9]+\.[0-9]+e[0-9]+ {
  yylval.txt=malloc(strlen(yytext)+1);
  strcpy(yylval.txt, yytext);
  return SCIENTIFIC;
}

[0-9]+\.[0-9]+ {
  getstring(0);
  return FLOAT;
}

. { return yytext[0]; }

%%

void getstring(unsigned skip){
/* Gets a string excluding " or ' */
  unsigned i;
  for(i=skip; yytext[i]!='"' && yytext[i]!='\'' && yytext[i]!=0; i++);
  yytext[i]=0;
  yylval.txt=malloc(i+1);
  strcpy(yylval.txt, yytext+skip);
}

void getbasedstring(unsigned skip){
/* Gets a string excluding # */
  unsigned i;
  for(i=skip; yytext[i]!='#' && yytext[i]!=0; i++);
  yytext[i]=0;
  yylval.txt=malloc(i+1);
  strcpy(yylval.txt, yytext+skip);
}

void yyerror(char *s){
  fprintf(stderr,"%s at \"%s\" in line %d.\n\n",s,yytext,lineno);
}
