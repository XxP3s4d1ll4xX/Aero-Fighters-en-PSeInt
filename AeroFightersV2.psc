funcion mover_obstaculos(matriz Por Referencia)
	definir i,e Como Entero;
	para i<-10 hasta 0 con paso -1 Hacer
		para e<-0 hasta 8 con paso 1 Hacer
			si matriz[i,e]="+" Entonces
				matriz[i,e]=".";
				matriz[i+1,e]="+";
			FinSi
			si matriz[i,e]="P" Entonces
				matriz[i,e]=".";
				matriz[i+1,e]="P";
			FinSi
		FinPara
	FinPara
FinFuncion

funcion mostrar_mapa(matriz,rayo,bomba,potenciador,tiempo)
	definir i,e Como Entero;
	Definir MensajeRayo,MensajeBomba Como Cadena;
	si rayo Entonces
		MensajeRayo<-"Listo";
	SiNo
		MensajeRayo<-"Recargando";
	FinSi
	si bomba Entonces
		MensajeBomba<-"Listo";
	SiNo
		MensajeBomba<-"Recargando";
	FinSi
	Para i<-0 hasta 11 con paso 1 Hacer
		para e<-0 hasta 8 con paso 1 Hacer
			si e=8 Entonces
				si i=0 o i=1 o i=2 Entonces
					si i=0 Entonces
						Escribir matriz[i,e],"  RAYO: ",MensajeRayo;
					FinSi
					si i=1 Entonces
						Escribir matriz[i,e],"  BOMBA: ",MensajeBomba;
					FinSi
					si i=2 Entonces
						Escribir matriz[i,e],"  POTENCIADOR: x",potenciador;
					FinSi
				SiNo
					Escribir matriz[i,e];
				FinSi
			SiNo
				Escribir Sin Saltar matriz[i,e]," ";		
			FinSi
		FinPara
	FinPara
	Esperar tiempo Milisegundos;
FinFuncion

Algoritmo AeroFighters
	Definir  gameover,win,rayo,bomba,repetido,Cb2,Cb3,Cb1,agarroP como logico;
	Definir i,e,columna,potenciador,num,obstaculo,contador,fb1,fb2,fb3,colb2,colb3,fila,suerte,FR,CR,contP,contR,contB como entero;
	Definir mapa,movimiento Como Caracter;
	dimension mapa[12,9],obstaculo[2];
	rayo<-verdadero;
	bomba<-verdadero;
	columna<-4;
	gameover<-falso;
	win<-falso;
	potenciador<-1;
	contador<-1;
	agarroP<-falso;
	contP<-0;
	contR<-0;
	contB<-0;
	
	Limpiar Pantalla;
	
	//MAPA BASE
	para i<-0 hasta 11 con paso 1 Hacer
		para e<-0 hasta 8 con paso 1 Hacer
			mapa[i,e]<-".";
		FinPara
	FinPara
	mapa[11,columna]<-"Î";
	
	//DINAMICO
	Repetir
		Limpiar Pantalla;
		si agarroP Entonces
			si potenciador<3 Entonces
				potenciador<-potenciador+1;
				contP<-3;
			SiNo
				contP<-3;
			FinSi
			agarroP<-falso;
		SiNo
			si contP>=1 Entonces
				contP<-contP-1;
			FinSi
			si contP=0 y potenciador>1 Entonces
				potenciador<-potenciador-1;
				contp<-3;
			FinSi
		FinSi
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
		si contador>3 Entonces
			suerte<-Aleatorio(1,2);
			si suerte=1 Entonces
				FR<-aleatorio(6,9);
				CR<-aleatorio(0,8);
				mapa[FR,CR]<-"P";
			FinSi
		FinSi
		mostrar_mapa(mapa,rayo,bomba,potenciador,150);
		Limpiar Pantalla;
		mostrar_mapa(mapa,rayo,bomba,potenciador,150);
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
			mostrar_mapa(mapa,rayo,bomba,potenciador,150);
		Hasta Que movimiento="w" o movimiento="r" o movimiento="b";
		Segun movimiento Hacer
			'w':
				segun potenciador Hacer
					1:
						fb1<-11;
						Mientras fb1<>0 y (fb1=0  o mapa[fb1-1,columna]<>"+") y (fb1=0 o mapa[fb1-1,columna]<>"P") Hacer
							Limpiar Pantalla;
							si fb1<>11 Entonces
								mapa[fb1,columna]<-".";
							FinSi
							fb1<-fb1-1;
							mapa[fb1,columna]<-"^";
							mostrar_mapa(mapa,rayo,bomba,potenciador,150);
						FinMientras
						Limpiar Pantalla;
						si fb1<>0 y mapa[fb1-1,columna]="+" Entonces
							si fb1<>11 Entonces
								mapa[fb1,columna]<-".";
							FinSi
							fb1<-fb1-1;
							mapa[fb1,columna]<-".";
							mostrar_mapa(mapa,rayo,bomba,potenciador,150);
						SiNo
							si (fb1<>0 y mapa[fb1-1,columna]="P" ) Entonces
								agarroP<-Verdadero;
								mapa[fb1,columna]<-".";
								fb1<-fb1-1;
								mapa[fb1,columna]<-".";
								mostrar_mapa(mapa,rayo,bomba,potenciador,150);
							SiNo
								mapa[fb1,columna]<-".";
								mostrar_mapa(mapa,rayo,bomba,potenciador,150);
							FinSi
						FinSi
					3:
						fb1<-11;
						Repetir
							Limpiar Pantalla;
							si fb1<>11 Entonces
								mapa[fb1,columna]<-".";
							FinSi
							fb1<-fb1-1;
							mapa[fb1,columna]<-"^";
							mostrar_mapa(mapa,rayo,bomba,potenciador,150);
						Hasta Que fb1=0 o (fb1<>0 y mapa[fb1-1,columna]="P")
						si fb1=0 Entonces
							Limpiar Pantalla;
							mapa[fb1,columna]<-".";
							mostrar_mapa(mapa,rayo,bomba,potenciador,150);
						SiNo
							Limpiar Pantalla;
							mapa[fb1,columna]<-".";
							mapa[fb1-1,columna]<-".";
							mostrar_mapa(mapa,rayo,bomba,potenciador,150);
							agarroP<-verdadero;
						FinSi
					2:
						fb1<-11;
						fb2<-11;
						fb3<-11;
						Cb1<-falso;
						Cb2<-falso;
						Cb3<-falso;
						si columna=0 o columna=8 Entonces
							si columna=0 Entonces
								colb3<-columna+1;
								Repetir
									Limpiar Pantalla;
									si Cb1=Falso Entonces
										si fb1=0 o (fb1<>0 y mapa[fb1-1,columna]="+") o (fb1<>0 y mapa[fb1-1,columna]="P")  Entonces
											Cb1<-Verdadero;
										FinSi
										si (fb1<>0 y mapa[fb1-1,columna]="P") Entonces
											agarroP<-Verdadero;
										FinSi
										si fb1<>11 Entonces
											mapa[fb1,columna]<-".";
										FinSi
										si fb1<>0 Entonces
											fb1<-fb1-1;
											mapa[fb1,columna]<-"^";
										FinSi
										si Cb1=Verdadero Entonces
											mapa[fb1,columna]<-".";
										FinSi
									FinSi
									si Cb3=falso Entonces
										si fb3=0 o (fb3<>0 y mapa[fb3-1,colb3]="+") o (fb3<>0 y mapa[fb3-1,colb3]="P") Entonces
											Cb3<-Verdadero;
										FinSi
										si (fb3<>0 y mapa[fb3-1,colb3]="P") Entonces
											agarroP<-Verdadero;
										FinSi
										mapa[fb3,colb3]<-".";
										si fb3<>0 Entonces
											fb3<-fb3-1;
											mapa[fb3,colb3]<-"^";
										FinSi
										si Cb3=Verdadero Entonces
											mapa[fb3,colb3]<-".";
										FinSi
									FinSi
									mostrar_mapa(mapa,rayo,bomba,potenciador,200);
								Hasta Que Cb1 y Cb3;
							FinSi
							si columna=8 Entonces
								colb2<-columna-1;
								Repetir
									Limpiar Pantalla;
									si Cb1=Falso Entonces
										si fb1=0 o (fb1<>0 y mapa[fb1-1,columna]="+") o (fb1<>0 y mapa[fb1-1,columna]="P") Entonces
											Cb1<-Verdadero;
										FinSi
										si (fb1<>0 y mapa[fb1-1,columna]="P") Entonces
											agarroP<-Verdadero;
										FinSi
										si fb1<>11 Entonces
											mapa[fb1,columna]<-".";
										FinSi
										si fb1<>0 Entonces
											fb1<-fb1-1;
											mapa[fb1,columna]<-"^";
										FinSi
										si Cb1=Verdadero Entonces
											mapa[fb1,columna]<-".";
										FinSi
									FinSi
									si Cb2=falso Entonces
										si fb2=0 o (fb2<>0 y mapa[fb2-1,colb2]="+") o (fb2<>0 y mapa[fb2-1,colb2]="P") Entonces
											Cb2<-Verdadero;
										FinSi
										si (fb2<>0 y mapa[fb2-1,colb2]="P") Entonces
											agarroP<-Verdadero;
										FinSi
										mapa[fb2,colb2]<-".";
										si fb2<>0 Entonces
											fb2<-fb2-1;
											mapa[fb2,colb2]<-"^";
										FinSi
										si Cb2=Verdadero Entonces
											mapa[fb2,colb2]<-".";
										FinSi
									FinSi
									mostrar_mapa(mapa,rayo,bomba,potenciador,200);
								Hasta Que Cb1 y Cb2;
							FinSi
						SiNo
							colb2<-columna-1;
							colb3<-columna+1;
							Repetir
								Limpiar Pantalla;
								si Cb1=Falso Entonces
									si fb1=0 o (fb1<>0 y mapa[fb1-1,columna]="+") o (fb1<>0 y mapa[fb1-1,columna]="P") Entonces
										Cb1<-Verdadero;
									FinSi
									Si (fb1<>0 y mapa[fb1-1,columna]="P") Entonces
										agarroP<-Verdadero;
									FinSi
									si fb1<>11 Entonces
										mapa[fb1,columna]<-".";
									FinSi
									si fb1<>0 Entonces
										fb1<-fb1-1;
										mapa[fb1,columna]<-"^";
									FinSi
									si Cb1=Verdadero Entonces
										mapa[fb1,columna]<-".";
									FinSi
								FinSi
								si Cb2=falso Entonces
									si fb2=0 o (fb2<>0 y mapa[fb2-1,colb2]="+") o  (fb2<>0 y mapa[fb2-1,colb2]="P")Entonces
										Cb2<-Verdadero;
									FinSi
									si (fb2<>0 y mapa[fb2-1,colb2]="P") Entonces
										agarroP<-verdadero;
									FinSi
									mapa[fb2,colb2]<-".";
									si fb2<>0 Entonces
										fb2<-fb2-1;
										mapa[fb2,colb2]<-"^";
									FinSi
									si Cb2=Verdadero Entonces
										mapa[fb2,colb2]<-".";
									FinSi
								FinSi
								si Cb3=falso Entonces
									si fb3=0 o (fb3<>0 y mapa[fb3-1,colb3]="+") o (fb3<>0 y mapa[fb3-1,colb3]="P") Entonces
										Cb3<-Verdadero;
									FinSi
									si (fb3<>0 y mapa[fb3-1,colb3]="P") Entonces
										agarroP<-Verdadero;
									FinSi
									mapa[fb3,colb3]<-".";
									si fb3<>0 Entonces
										fb3<-fb3-1;
										mapa[fb3,colb3]<-"^";
									FinSi
									si Cb3=Verdadero Entonces
										mapa[fb3,colb3]<-".";
									FinSi
								FinSi
								mostrar_mapa(mapa,rayo,bomba,potenciador,200);
							Hasta Que Cb1 y Cb2 y Cb3;
						FinSi
				FinSegun
			'r':
				si contR=0 Entonces
					si columna<>0 y columna<>8 Entonces
						para i<-10 hasta 0 con paso -1 Hacer
							Limpiar Pantalla;
							mapa[i,columna]<-"^";
							mapa[i,columna+1]<-"^";
							mapa[i,columna-1]<-"^";
							mostrar_mapa(mapa,rayo,bomba,potenciador,50);
						FinPara
						Limpiar Pantalla;
						para i<-10 hasta 0 con paso -1 Hacer
							Limpiar Pantalla;
							mapa[i,columna]<-".";
							mapa[i,columna+1]<-".";
							mapa[i,columna-1]<-".";
						FinPara
						mostrar_mapa(mapa,rayo,bomba,potenciador,50);
					SiNo
						si columna=0 Entonces
							para i<-10 hasta 0 con paso -1 Hacer
								Limpiar Pantalla;
								mapa[i,columna]<-"^";
								mapa[i,columna+1]<-"^";
								mostrar_mapa(mapa,rayo,bomba,potenciador,50);
							FinPara
							Limpiar Pantalla;
							para i<-10 hasta 0 con paso -1 Hacer
								Limpiar Pantalla;
								mapa[i,columna]<-".";
								mapa[i,columna+1]<-".";
							FinPara
							mostrar_mapa(mapa,rayo,bomba,potenciador,50);
						SiNo
							para i<-10 hasta 0 con paso -1 Hacer
								Limpiar Pantalla;
								mapa[i,columna]<-"^";
								mapa[i,columna-1]<-"^";
								mostrar_mapa(mapa,rayo,bomba,potenciador,50);
							FinPara
							Limpiar Pantalla;
							para i<-10 hasta 0 con paso -1 Hacer
								Limpiar Pantalla;
								mapa[i,columna]<-".";
								mapa[i,columna-1]<-".";
							FinPara
							mostrar_mapa(mapa,rayo,bomba,potenciador,50);
						FinSi
					finsi
					contR<-6;
					rayo<-falso;
				FinSi
			'b':
				si contB=0 Entonces
					fb1<-11;
					Repetir
						Limpiar Pantalla;
						si fb1<>11 Entonces
							mapa[fb1,columna]<-".";
						FinSi
						fb1<-fb1-1;
						mapa[fb1,columna]<-"^";
						mostrar_mapa(mapa,rayo,bomba,potenciador,150);
					Hasta Que fb1=0 o (fb1<>0 y mapa[fb1-1,columna]="+");
					Limpiar Pantalla;
					si fb1<>0 y mapa[fb1-1,columna]="+" Entonces
						mapa[fb1,columna]<-".";
						fb1<-fb1-1;
						mapa[fb1,columna]<-".";
						mostrar_mapa(mapa,rayo,bomba,potenciador,150);
					SiNo
						mapa[fb1,columna]<-".";
						mostrar_mapa(mapa,rayo,bomba,potenciador,150);
					FinSi
					Limpiar Pantalla;
					fila=fb1;
					si columna<>0 y columna<>8 y fila<>0 y fila<>11 Entonces
						mapa[fila,columna]<-"*";
						mapa[fila,columna+1]<-"*";
						mapa[fila,columna-1]<-"*";
						mapa[fila+1,columna]<-"*";
						mapa[fila+1,columna+1]<-"*";
						mapa[fila+1,columna-1]<-"*";
						mapa[fila-1,columna]<-"*";
						mapa[fila-1,columna+1]<-"*";
						mapa[fila-1,columna-1]<-"*";
						mostrar_mapa(mapa,rayo,bomba,potenciador,500);
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
						mostrar_mapa(mapa,rayo,bomba,potenciador,150);
					finsi
					contB<-4;
					bomba<-falso;
				FinSi
		finsegun
		contador<-contador+1;
		si contB>=1 Entonces
			contB<-contB-1;
		FinSi
		si contR>=1 Entonces
			contR<-contR-1;
		FinSi
		si contR=0 Entonces
			rayo<-Verdadero;
		FinSi
		si contB=0 Entonces
			bomba=Verdadero;
		FinSi
		para i<-0 hasta 8 con paso 1 hacer
			si mapa[11,i]="+" Entonces
				gameover<-Verdadero;
			FinSi
			si mapa[11,i]="P" Entonces
				mapa[11,i]<-".";
			FinSi
		FinPara
	Hasta Que gameover o win

FinAlgoritmo
