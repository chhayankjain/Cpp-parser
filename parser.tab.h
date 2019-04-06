/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     STRUCT = 258,
     ID = 259,
     CLASS = 260,
     SPECIFIER = 261,
     MAIN = 262,
     DTYPE = 263,
     RETURN = 264,
     CIN = 265,
     COUT = 266,
     NUMBER = 267,
     IF = 268,
     ELIF = 269,
     ELSE = 270,
     WHILE = 271,
     FOR = 272,
     LITERAL = 273,
     BREAK = 274,
     DEFAULT = 275,
     COMMA = 276,
     SWITCH = 277,
     CASE = 278,
     CLASSNAME = 279,
     STRUCTNAME = 280
   };
#endif
/* Tokens.  */
#define STRUCT 258
#define ID 259
#define CLASS 260
#define SPECIFIER 261
#define MAIN 262
#define DTYPE 263
#define RETURN 264
#define CIN 265
#define COUT 266
#define NUMBER 267
#define IF 268
#define ELIF 269
#define ELSE 270
#define WHILE 271
#define FOR 272
#define LITERAL 273
#define BREAK 274
#define DEFAULT 275
#define COMMA 276
#define SWITCH 277
#define CASE 278
#define CLASSNAME 279
#define STRUCTNAME 280




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

