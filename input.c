class Geeks 
{ 
    // Access specifier 
    public: 
  
    // Data Members 
    string geekname; 
  
    // Member Functions() 
    void printname()
    { 
       cout << "Geekname is: " << geekname;
    } 
};

struct Record { 
    int x; 
};

int sum (int a, int b) {
	int c;
	c = a+b;
	return c;
}

char greet() {
	char c;
	c=c+1;
	return c;
}

main() {
	int a,b,i;
	cin>>b;
	if(a<b) {
        a=a+1;
    } else if(a>b) {
        a=a-1;
    } else {
        a=2;
    }

    switch(a) {
        case 1: 
            a=1;
            while(a!=2) {
            	a=a-1;
            }
        case 2:
            a=3;
            for(i=0;i<10; i=i+1) {
                cout<<"Hello\n";
            }
            break;
    }
    g1.printname();
}    
