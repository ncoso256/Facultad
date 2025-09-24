program prueba;
var
	c: integer;

procedure calcular(var b,a: integer);
begin
	b:= 10; // b = 10 ---> programa ppal = a = 10
	while (b > 0) do begin
		a:= a+b; 
    // a = 80+10 = 90 -----> programa ppal = b = 90  
    //- a = 90+8 = 98 
    //- a = 98 + 6 = 104 
    //- a = 104+4 = 108 
    // - a= 108+ 2 = 110
		b:= b-2; 
    // b = 10-2 = 8 
    //- b = 8-2 = 6 
    //- b = 6-2 = 4 
    //- b = 4-2 = 2 
    //- b = 2-2 = 0
		c:= c-b; 
    // c = 30-8 = 22 
    //- c= 22-6 = 16 
    //- c= 16- 4 = 12 
    //- c = 12-2 = 10
    //- c= 10- 0 = 10
	end;
	writeln('a = ', a, 'b = ', b, 'c= ', c); // 110, 0 , 10
end;

var
	a,b: integer;
begin
	b:= 80; // b = 80
	c:= 30; // c = 30
	writeln('a = ', a, 'b = ', b, 'c= ', c); // a= basura , b = 80 , c= 30
	calcular(a,b); 
	writeln('a = ', a, 'b = ', b, 'c= ', c);  // 0 , 110 , 10
end.
