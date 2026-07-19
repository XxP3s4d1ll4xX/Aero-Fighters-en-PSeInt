funcion mover_obstaculos(matriz Por Referencia)
	definir i,e Como Entero;
	para i<-10 hasta 0 con paso -1 Hacer
		para e<-0 hasta 8 con paso 1 Hacer
			si matriz[i,e]="+" Entonces
				matriz[i,e]=".";
				matriz[i+1,e]="+";
			FinSi
		FinPara
	FinPara
FinFuncion

funcion mostrar_mapa(matriz,puntos)
	definir i,e Como Entero;
	Escribir "PUNTAJE: ",puntos;
	Para i<-0 hasta 11 con paso 1 Hacer
		para e<-0 hasta 8 con paso 1 Hacer
			si e=8 Entonces
				Escribir matriz[i,e];
			SiNo
				Escribir Sin Saltar matriz[i,e]," ";		
			FinSi
		FinPara
	FinPara
FinFuncion

Algoritmo AeroFighters
	//DEFINIR y ASIGNAR
	definir repetido,gameover,rayo,bomba,ActivarRayo,ActivarBomba Como Logico;
	definir i,e,columna,fila,num,obstaculo,contador,suerte,FR,CR,FB,CB,ContAntes,ContDespues,puntaje como entero;
	definir mapa,movimiento Como Caracter;
	dimension mapa[12,9],obstaculo[2];
	ActivarBomba<-Falso;
	ActivarRayo<-Falso;
	rayo<-falso;
	bomba<-falso;
	columna<-4;
	gameover<-Falso;
	puntaje<-0;
	
	//LOBY XD
	Limpiar Pantalla;
	Escribir "----------------------------------------";
	Escribir "|         AERO FIGHTERS CASERO         |";
	Escribir "|                                      |";
	Escribir "| INSTRUCCIONES:                       |";
	Escribir "|- Acumula 500 puntos                  |";
	Escribir "|- Usa potenciadores                   |";
	Escribir "|                                      |";
	Escribir "|PRESIONA CUALQUIER TECLA PARA INICIAR |";
	Escribir "----------------------------------------";
	Esperar Tecla;
	
	//MAPA BASE
	para i<-0 hasta 11 con paso 1 Hacer
		para e<-0 hasta 8 con paso 1 Hacer
			mapa[i,e]<-".";
		FinPara
	FinPara
	mapa[11,columna]<-"Î";
	Limpiar Pantalla;
	mostrar_mapa(mapa,puntaje);
	
	//DINÁMICO
	contador<-1;
	Repetir
		Limpiar Pantalla;
		si contador<>1 Entonces
			mover_obstaculos(mapa);
		FinSi
		para i<-0 hasta 1 con paso 1 Hacer
			Repetir
				num<-Aleatorio(0,8);
				repetido<-falso;
				para e<-0 Hasta i-1 Con Paso 1 Hacer
					si num=obstaculo[e] Entonces
						repetido<-Verdadero;
					FinSi
				FinPara
			Hasta Que repetido=falso
			obstaculo[i]<-num;
			mapa[0,num]<-"+";
		FinPara
		si contador>5 Entonces
			si contador mod 2 = 0 Entonces
				suerte<-Aleatorio(1,4);
				si suerte=3 Entonces
					FR<-aleatorio(6,9);
					CR<-aleatorio(0,8);
					mapa[FR,CR]<-"R";
				FinSi
			SiNo
				suerte<-Aleatorio(1,3);
				si suerte=3 Entonces
					FB<-aleatorio(6,9);
					CB<-aleatorio(0,8);
					mapa[FB,CB]<-"B";
				FinSi
			FinSi
		FinSi
		contAntes<-0;
		para i<-0 hasta 11 con paso 1 Hacer
			para e<-0 hasta 8 con paso 1 hacer
				si mapa[i,e]="+" Entonces
					contAntes<-contAntes+1;
				FinSi
			FinPara
		FinPara
		mostrar_mapa(mapa,puntaje);
		para i<-0 hasta 8 con paso 1 Hacer
			si mapa[11,i]="+" Entonces
				gameover<-Verdadero;
			FinSi
		FinPara
		si gameover=falso Entonces
			Repetir
				Leer movimiento;
				Limpiar Pantalla;
				Segun movimiento Hacer
					'a':
						si columna<>0 Entonces
							mapa[11,columna]<-".";
							columna<-columna-1;
							mapa[11,columna]<-"Î";
						FinSi
					'd':
						si columna<>8 Entonces
							mapa[11,columna]<-".";
							columna<-columna+1;
							mapa[11,columna]<-"Î";
						FinSi
				FinSegun
				mostrar_mapa(mapa,puntaje);
			Hasta Que movimiento="w";
			si ActivarRayo Entonces
				si columna<>0 y columna<>8 Entonces
					para i<-10 hasta 0 con paso -1 Hacer
						Limpiar Pantalla;
						mapa[i,columna]<-"^";
						mapa[i,columna+1]<-"^";
						mapa[i,columna-1]<-"^";
						mostrar_mapa(mapa,puntaje);
						esperar 50 Milisegundos;
					FinPara
					Limpiar Pantalla;
					para i<-10 hasta 0 con paso -1 Hacer
						Limpiar Pantalla;
						mapa[i,columna]<-".";
						mapa[i,columna+1]<-".";
						mapa[i,columna-1]<-".";
					FinPara
					mostrar_mapa(mapa,puntaje);
				SiNo
					si columna=0 Entonces
						para i<-10 hasta 0 con paso -1 Hacer
							Limpiar Pantalla;
							mapa[i,columna]<-"^";
							mapa[i,columna+1]<-"^";
							mostrar_mapa(mapa,puntaje);
							esperar 50 Milisegundos;
						FinPara
						Limpiar Pantalla;
						para i<-10 hasta 0 con paso -1 Hacer
							Limpiar Pantalla;
							mapa[i,columna]<-".";
							mapa[i,columna+1]<-".";
						FinPara
						mostrar_mapa(mapa,puntaje);
					SiNo
						para i<-10 hasta 0 con paso -1 Hacer
							Limpiar Pantalla;
							mapa[i,columna]<-"^";
							mapa[i,columna-1]<-"^";
							mostrar_mapa(mapa,puntaje);
							esperar 50 Milisegundos;
						FinPara
						Limpiar Pantalla;
						para i<-10 hasta 0 con paso -1 Hacer
							Limpiar Pantalla;
							mapa[i,columna]<-".";
							mapa[i,columna-1]<-".";
						FinPara
						mostrar_mapa(mapa,puntaje);
					FinSi
					
				FinSi
				ActivarRayo<-falso;
				Esperar 200 Milisegundos;
			SiNo
				fila<-11;
				Mientras fila<>0 y (fila>0 y (mapa[fila-1,columna]<>"+" y mapa[fila-1,columna]<>"R" y mapa[fila-1,columna]<>"B")) Hacer
					Limpiar Pantalla;
					si fila<>11 Entonces
						mapa[fila,columna]<-".";
					FinSi
					fila<-fila-1;
					mapa[fila,columna]<-"^";
					mostrar_mapa(mapa,puntaje);
					Esperar 100 Milisegundos;
				FinMientras
				si fila>0 y (mapa[fila-1,columna]="+" o mapa[fila-1,columna]="R" o mapa[fila-1,columna]="B") Entonces
					Limpiar Pantalla;
					si mapa[fila-1,columna]="R" Entonces
						rayo<-Verdadero;
					FinSi
					si mapa[fila-1,columna]="B" Entonces
						bomba<-Verdadero;
					FinSi
					si fila<>11 Entonces
						mapa[fila,columna]<-".";
					FinSi
					si ActivarBomba=verdadero Entonces
						si columna<>0 y columna<>8 y fila<>0 y fila<>11 Entonces
							fila<-fila-1;
							mapa[fila,columna]<-"*";
							mapa[fila,columna+1]<-"*";
							mapa[fila,columna-1]<-"*";
							mapa[fila+1,columna]<-"*";
							mapa[fila+1,columna+1]<-"*";
							mapa[fila+1,columna-1]<-"*";
							mapa[fila-1,columna]<-"*";
							mapa[fila-1,columna+1]<-"*";
							mapa[fila-1,columna-1]<-"*";
							mostrar_mapa(mapa,puntaje);
							Esperar 500 Milisegundos;
							Limpiar Pantalla;
							mapa[fila,columna]<-".";
							mapa[fila,columna+1]<-".";
							mapa[fila,columna-1]<-".";
							mapa[fila+1,columna]<-".";
							mapa[fila+1,columna+1]<-".";
							mapa[fila+1,columna-1]<-".";
							mapa[fila-1,columna]<-".";
							mapa[fila-1,columna+1]<-".";
							mapa[fila-1,columna-1]<-".";
							mostrar_mapa(mapa,puntaje);
							ActivarBomba<-Falso;
						SiNo
							fila<-fila-1;
							mapa[fila,columna]<-"*";
							mostrar_mapa(mapa,puntaje);
							Esperar 500 Milisegundos;
							Limpiar Pantalla;
							mapa[fila,columna]<-".";
							mostrar_mapa(mapa,puntaje);
							bomba<-Verdadero;
						FinSi
					SiNo
						fila<-fila-1;
						mapa[fila,columna]<-"*";
						mostrar_mapa(mapa,puntaje);
						Esperar 500 Milisegundos;
						Limpiar Pantalla;
						mapa[fila,columna]<-".";
						mostrar_mapa(mapa,puntaje);
					FinSi
				SiNo
					Limpiar Pantalla;
					mapa[fila,columna]<-".";
					mostrar_mapa(mapa,puntaje);
				FinSi
			FinSi
			si rayo Entonces
				ActivarRayo<-Verdadero;
				rayo<-falso;
			FinSi
			si bomba Entonces
				ActivarBomba<-Verdadero;
				bomba<-falso;
			FinSi
			contDespues<-0;
			para i<-0 hasta 11 con paso 1 Hacer
				para e<-0 hasta 8 con paso 1 hacer
					si mapa[i,e]="+" Entonces
						contDespues<-contDespues+1;
					FinSi
				FinPara
			FinPara
			puntaje<-puntaje+(contAntes-contDespues)*10;
			contador<-contador+1;
		FinSi
	Hasta Que gameover o puntaje>=500
	Esperar 1.5 Segundos;
	Limpiar Pantalla;
	si gameover Entonces
		Escribir "PERDISTE";
	SiNo
		Escribir "GANASTE";
	FinSi
FinAlgoritmo
