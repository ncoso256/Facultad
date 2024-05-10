program ocho;
type
	t_docente = record
		dni : string;
		nombre: string;
		apellido: string;
		email: string;
	end;
	t_proyecto = record
		codigo: integer;
		titulo: string;
		coordinador: t_docente;
		alumnos: integer;
		escuela: string;
		localidad: string;
	end;
procedure leerdocente(var docente: t_docente);
begin
	readln(docente.dni);
	readln(docente.nombre);
	readln(docente.apellido);
	readln(docente.email);
end;

procedure leerproyecto(var proyecto: t_proyecto);
begin
	readln(proyecto.codigo);
	readln(proyecto.titulo);
	leerdocente(proyecto.coordinador);
	readln(proyecto.alumnos);
	readln(proyecto.escuela);
	readln(proyecto.localidad);
end;

procedure cantdigitosparesimpares(numero: integer; var impar, par: integer);
var
	digito: integer;
begin
	impar:= 0;
	par:= 0;
	while (numero <> 0) do begin
		digito:= numero mod 10;
		if (digito mod 2 = 0) then
			par:= par + 1
		else
			impar:= impar + 1;
		numero:= numero div 10;
	end;
end;

var
	proyecto: t_proyecto;
	localidad,escuela,nombremaxalumnos1,nombremaxalumnos2: string;
	cantescuelasloc,canttotalescuelas,cantalumnosescuela,maxalumnos1,maxalumnos2,cantimpar,cantpar: integer;
begin
	canttotalescuelas:= 0;
	maxalumnos1:= -1;
	maxalumnos2:= -1;
	leerproyecto(proyecto);
	while (proyecto.codigo <> -1) do 
	begin
		localidad:= proyecto.localidad;
		cantescuelasloc:= 0;
		while ((localidad = proyecto.localidad)and (proyecto.codigo <> -1)) do 
		begin
			escuela:= proyecto.escuela;
			cantescuelasloc:= cantescuelasloc +1;
			cantalumnosescuela:= 0;
			while ((escuela = proyecto.escuela)and (localidad = proyecto.localidad) and(proyecto.codigo <> -1)) do 
			begin
				cantalumnosescuela:= cantalumnosescuela + proyecto.alumnos;
				if (proyecto.localidad = 'daireaux') then begin
					cantdigitosparesimpares(proyecto.codigo,cantimpar,cantpar);
					if (cantimpar = cantpar) then begin
						writeln;
						writeln(proyecto.titulo);
						writeln;
					end;
					leerproyecto(proyecto);
				end;
				if (cantalumnosescuela > maxalumnos1) then 
				begin
					maxalumnos2:= maxalumnos1;
					maxalumnos1:= cantalumnosescuela;
					nombremaxalumnos2:= nombremaxalumnos1;
					nombremaxalumnos1:= escuela;
				end
				else if (cantalumnosescuela > maxalumnos2) then 
				begin
					maxalumnos2:= cantalumnosescuela;
					nombremaxalumnos2:= escuela;
				end;
			end;
		end;
		canttotalescuelas:= canttotalescuelas + cantescuelasloc;
		writeln(localidad, cantescuelasloc);
		writeln;
	end;
	writeln(canttotalescuelas);
	writeln(nombremaxalumnos1, nombremaxalumnos2);
end.
