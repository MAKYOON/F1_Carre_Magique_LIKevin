program carremag;

uses crt;

const TMAX = 5; //taille du carre

VAR carre : array[1..TMAX,1..TMAX] of integer; 
	occupe : array[1..TMAX,1..TMAX] of boolean;
	i,j,milieu, nb : integer;

BEGIN
	clrscr;
	nb:=1;  //nb sera le nombre placé dans le tableau, au début 1
	milieu := TMAX DIV 2 + 1; // permet de determiner le milieu du tableau
	//on initialise toutes les cases à FAUX ( pour le tableau de booleen "occupe"))
	for i:=1 to TMAX do
	BEGIN
		for j:=1 to TMAX do
		BEGIN
				occupe[i,j]:=false;
		END;
	END; 
	//i et j prennent la position de 1, c'est à dire à la case au nord du milieu du tableau. on place le chiffre 1 et on met "occupe" en VRAI
	i:= milieu;
	j:= milieu-1;
	carre[i,j]:= nb;
	occupe[i,j]:= true;
	//on continue la boucle tant que nb n'est pas égal au dernier chiffre du tableau (pour un carré de 5x5 par exemple la dernière valeur sera égale à 25)
	while (nb<>TMAX*TMAX) do
	BEGIN
		i:=i+1;
		j:=j-1; //on monte au nord-est à chaque fois, et on incrémente nb 
		nb:=nb+1;
		//on vérifie si i ou j sort du tableau, et si oui on le met à l'opposé
		if (i=TMAX+1) then
			i:=1;
		if (j=0) then
			j:=TMAX;
		//maintenant on vérifie si la cellule est occupée. si elle ne l'est pas, on place nb, et on met "occupe" en VRAI
		if (occupe[i,j]=false) then
		BEGIN
			carre[i,j]:= nb;
			occupe[i,j]:=true;
		END
		ELSE
		// si elle l'est, on effectue le déplacement nord-ouest tout en vérifiant le débordement du tableau, et on place nb et on met "occupe" en VRAI
		BEGIN
			i:=i-1;
			j:=j-1;
			if (j=0) then
				j:=TMAX;
			if (i=0) then
				i:=TMAX;
			carre[i,j]:= nb;
			occupe[i,j]:=true;
		END;
	END;
//le tableau est maintenant fini, on s'occupe de l'afficher
	for i:=1 to TMAX do
	BEGIN
		for j:=1 to TMAX do
		BEGIN
			write('|');  // les pipes permettent de faire les lignes du carré
			write(carre[j,i]:2);
		END;
		write('|');
		writeln(); //permet le saut de ligne au bout du tableau( pour avoir un carré)
	END;
readln();
END.

