%{
#include <stdio.h>
#include<stdbool.h>
struct stack
{
int top;
bool result;
char value[100];
char val[100];
int flag;
int ob;
int cb;
int ar[100];
int var;
int flag1;
int flag2;
};
struct stack st={.top= -1, .flag1 = 0};

/*void display()
{
int i;
//operation();
        for(i=0;i<4;i++)
                {

                printf("%c\n",st.value[i]);
                }
}*/


void push(char in)
{
        if(st.top<100)
                {
      //   printf("\nPUSH Value");
                 st.value[++st.top] = in;
//              operation();
//              display();
                }
        else
           {
                printf("\nOVERFLOW");
           }

}
char pop()
{
        if(st.top>=0)
                {
 char  val= st.value[st.top--];
       //          printf("\nPOP Value:", val);

                  return val;
                }

        else
                {
//                printf("\nNothing in Stack");
                }
}
void display()
{

if (st.flag1==0)
	{
               // printf("\nResult=%d",st.result);

		printf("\nResult: %s \n", st.result?"True":"False");
		st.flag1++;
		
	}


}

void operation()
{
bool val1 = false;
bool val2 = false;
bool result;
char op1 = '\0';
char value = '\0';
char ar[3] = {};
char sVal1 ='\0';
char sVal2 = '\0';
char opr;
int i=0;
while((op1 = pop())!= '('){
    if(op1 == '&' || op1 == '|' || op1 == 'I' || op1 == '!' || op1 =='T'
|| op1=='F')

                st.ar[i] = op1;
		i++;
                if(st.top == -1) break;

 }

	st.var = i;
	
        sVal1 = st.ar[2];

        opr = st.ar[1];

        sVal2 = st.ar[0];

        if(sVal1=='F')
                {
                val1 = false;

                }
        else if(sVal1=='T')
                {
                val1 = true;

                }
          if(sVal2=='F')
               {
       val2 = false;

               }
        else if(sVal2=='T')
               {
                val2 = true;
         }

         if((opr=='&')&& (st.flag!= 1))
                {
		if (st.flag1 != 0){
			st.flag1 =0;
		}
               st.result = val1 & val2;	
          //    printf("\nResult: %s \n", result?"True":"False");
                if(st.result== true)
                        {
                        push('T');
                        }
                else
                        {
                        push('F');
                        }

            }
        else if((opr=='|')&& (st.flag != 1))
        {
	if(st.flag1 !=0 ) {
	st.flag1 = 0;
	}
        st.result = val1 | val2;
     //	printf("\nResult: %s \n", result?"True":"False");
                if(st.result== true)
                        {
                        push('T');
                        }
                else
                        {
                        push('F');
                        }
        }
        else if((opr=='I') && (st.flag !=1))
        {
	if(st.flag1 != 0) {
		st.flag1 = 0;
	}
        st.result = !(val1) | val2;
    //  printf("\nResult: %s\n", result?"True":"False");
                if(st.result== true)
                        {
                        push('T');
                        }
                else
                        {
                        push('F');
                        }
        }
        else if((opr == '!')&& (st.flag != 1 ))
     {
		if (st.flag1 != 0) {
			st.flag1 = 0;
		}
        st.result = !(val2);
               //  printf("\nResult: %s\n",result?"True":"False");

                if(st.result== true)
                        {
                        push('T');
                        }
                else
                        {
                        push('F');
                        }  
	}
		st.ar[1] = '\0';

		opr = '\0';
}              
       
void check(char b)
{
int ob;
int cb;
char d;
int flag2=0;

        if (b == '(')
                {
               flag2=1;
                st.ob++;
                }
         if( b == ')')
        {
             
              st.flag =0;
                st.cb++;

        }

        if (st.ob == st.cb)
                {

                st.flag = 0 ;
                operation();
//		flag2=0;
        }

}
void check2() {

        if (st.ob != st.cb)
{	

	printf( "\nBracket Error!!\n");
        exit(1);
        
}
}

%}

bool           [True-False]

%%


"\/\\"      {/*printf("\nAND");*/
                        push('&');}
"\\\/"      {/*printf("\nOR");*/
                        push('|');}
"not"       {/*printf("\nNOT");*/
                        push('!');}
"->"        {/*printf("\nImplies");*/
                        push('I');}
"("         {/*printf("\nOpen Para");*/
                     check('(');  push('(');}

")"         {/*printf("\nClose Para");*/
                    check(')');}
"True"      {/*printf("\nTrue");*/
                        push('T');}
"False"     {/*printf("\nFalse");*/
                        push('F');}
\n              { check2(); operation(); display(); "\n"; "\n";}

\t           {  }

" "          { }

.		{fprintf(stderr,"Invalid Character '%c'\n", yytext[0]); exit(1);}


%%



void main()
{
yylex();
}





