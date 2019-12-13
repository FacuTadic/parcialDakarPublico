%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Realizar el parcial integramente en este archivo. Escribir nombre y apellido.
% Nombre y apellido: Facundo Tadic
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ganador(1997,peterhansel,moto(1995, 1)).
ganador(1998,peterhansel,moto(1998, 1)).
ganador(2010,sainz,auto(touareg)).
ganador(2010,depress,moto(2009, 2)).
ganador(2010,karibov,camion([vodka, mate])).
ganador(2010,patronelli,cuatri(yamaha)).
ganador(2011,principeCatar,auto(touareg)).
ganador(2011,coma,moto(2011, 2)).
ganador(2011,chagin,camion([repuestos, mate])).
ganador(2011,patronelli,cuatri(yamaha)).
ganador(2012,peterhansel,auto(countryman)).
ganador(2012,depress,moto(2011, 2)).
ganador(2012,deRooy,camion([vodka, bebidas])).
ganador(2012,patronelli,cuatri(yamaha)).
ganador(2013,peterhansel,auto(countryman)).
ganador(2013,depress,moto(2011, 2)).
ganador(2013,nikolaev,camion([vodka, bebidas])).
ganador(2013,patronelli,cuatri(yamaha)).
ganador(2014,coma,auto(countryman)).
ganador(2014,coma,moto(2013, 3)).
ganador(2014,karibov,camion([tanqueExtra])).
ganador(2014,casale,cuatri(yamaha)).
ganador(2015,principeCatar,auto(countryman)).
ganador(2015,coma,moto(2013, 2)).
ganador(2015,mardeev,camion([])).
ganador(2015,sonic,cuatri(yamaha)).
ganador(2016,peterhansel,auto(2008)).
ganador(2016,prince,moto(2016, 2)).
ganador(2016,deRooy,camion([vodka, mascota])).
ganador(2016,patronelli,cuatri(yamaha)).
ganador(2017,peterhansel,auto(3008)).
ganador(2017,sunderland,moto(2016, 4)).
ganador(2017,nikolaev,camion([ruedaExtra])).
ganador(2017,karyakin,cuatri(yamaha)).
ganador(2018,sainz,auto(3008)).
ganador(2018,walkner,moto(2018, 3)).
ganador(2018,nicolaev,camion([vodka, cama])).
ganador(2018,casale,cuatri(yamaha)).
ganador(2019,principeCatar,auto(hilux)).
ganador(2019,prince,moto(2018, 2)).
ganador(2019,nikolaev,camion([cama, mascota])).
ganador(2019,cavigliasso,cuatri(yamaha)).

pais(peterhansel,francia).
pais(sainz,espania).
pais(depress,francia).
pais(karibov,rusia).
pais(patronelli,argentina).
pais(principeCatar,catar).
pais(coma,espania).
pais(chagin,rusia).
pais(deRooy,holanda).
pais(nikolaev,rusia).
pais(casale,chile).
pais(mardeev,rusia).
pais(sonic,polonia).
pais(prince,australia).
pais(sunderland,reinoUnido).
pais(karyakin,rusia).
pais(walkner,austria).
pais(cavigliasso,argentina).

etapa(marDelPlata,santaRosa,60).
etapa(santaRosa,sanRafael,290).
etapa(sanRafael,sanJuan,208).
etapa(sanJuan,chilecito,326).
etapa(chilecito,fiambala,177).
etapa(fiambala,copiapo,274).
etapa(copiapo,antofagasta,477).
etapa(antofagasta,iquique,557).
etapa(iquique,arica,377).
etapa(arica,arequipa,478).
etapa(arequipa,nazca,246).
etapa(nazca,pisco,276).
etapa(pisco,lima,29).

%%%%%%%% Resolver a partir de aca:
%%%%%%%% Punto 1

marca(peugeot,modeloAuto(2008)).
marca(peugeot,modeloAuto(3008)).
marca(mini,modeloAuto(countryman)).
marca(volkswagen,modeloAuto(touareg)).
marca(toyota,modeloAuto(hilux)).

%Para agregar un modelo mas a la marca mini simplemente bastaria con agregar:
%marca(mini,modeloAuto(buggy)).
%y no hace falta agregar el que no lo es ya que por el principio de Universo Cerrado se agrega solamente lo que es verdadero
%, lo que no esta/existe es falso.

%%%%%%%% Punto 2

ganadorReincidente(Competidor):-
    ganador(Anio,Competidor,_),
    ganador(OtroAnio,Competidor,_),
    Anio\=OtroAnio.


%%%%%%%% Punto 3

ganoAlgunaCompeticion(Competidor):-
    ganador(_,Competidor,_).

ganoUnoDeLosDos(Competidor,OtroCompetidor):-
    ganoAlgunaCompeticion(Competidor),
    not(ganoAlgunaCompeticion(OtroCompetidor)).


inspiraA(CompetidorInsipirado,CompetidorInspirador):-
    sonDelMismoPais(CompetidorInsipirado,CompetidorInspirador),
    ganoUnoDeLosDos(CompetidorInspirador,CompetidorInsipirado).

inspiraA(CompetidorInsipirado,CompetidorInspirador):-
    sonDelMismoPais(CompetidorInsipirado,CompetidorInspirador),
    ganoAntes(CompetidorInspirador,CompetidorInsipirado).
    

sonDelMismoPais(Competidor,OtroCompetidor):-
    pais(Competidor,Pais),
    pais(OtroCompetidor,Pais).

ganoAntes(Competidor,OtroCompetidor):-
    ganador(Anio,Competidor,_),
    ganador(OtroAnio,OtroCompetidor,_),
    Anio<OtroAnio,
    Competidor\=OtroCompetidor.

%%%%%%%% Punto 4

esVehiculo(Vehiculo):-
    ganador(_,_,Vehiculo).

marcaVehiculo(auto(Modelo),Marca):-
    marca(Marca,modeloAuto(Modelo)).

marcaVehiculo(moto(Anio,_),Marca):-
    marcaMoto(Anio,Marca).

marcaVehiculo(cuatri(Marca),Marca).

marcaVehiculo(camion(Items),Marca):-
    marcaCamion(Items,Marca).



marcaMoto(Anio,ktm):-
    Anio>=2000.

marcaMoto(Anio,yamaha):-
    Anio<2000.

marcaCamion(Items,kamaz):-
    member(vodka,Items).

marcaCamion(Items,iveco):-
    not(member(vodka,Items)).



marcaDeLaFortuna(Competidor,MarcaFavorita):-
    ganoAlgunaCompeticion(Competidor),
    ganoCon(_,MarcaFavorita),
    forall(ganador(_,Competidor,Vehiculo),ganoCon(Vehiculo,MarcaFavorita)).


ganoCon(Vehiculo,MarcaFavorita):-
    esVehiculo(Vehiculo),
    marcaVehiculo(Vehiculo,MarcaFavorita).


%%%%%%%% Punto 5


marcaCara(mini).
marcaCara(iveco).
marcaCara(toyota).

cantSuspeciones(moto(_,CantSuspenciones),CantSuspenciones).
cantSuspeciones(cuatri(_),4).

vehiculoCaro(Vehiculo):-
    marcaVehiculo(Vehiculo,Marca),
    marcaCara(Marca).

vehiculoCaro(Vehiculo):-
    cantSuspeciones(Vehiculo,CantSuspenciones),
    CantSuspenciones>=3.

noEsCorredorCheto(Competidor):-
    ganador(Anio,Competidor,Vehiculo),
    not(vehiculoCaro(Vehiculo)),
    forall((ganador(Anio,Competidores,Vehiculos),Competidor\=Competidores),vehiculoCaro(Vehiculos)).

heroePopular(Competidor):-
    inspiraA(_,Competidor),
    noEsCorredorCheto(Competidor).

%%%%%%%% Punto 6

%A)

distanciaEntreCiudades(CiudadDeInicio,CiudadDeFin,Distancia):-
    etapa(CiudadDeInicio,CiudadDeFin,Distancia).

distanciaEntreCiudades(CiudadDeInicio,CiudadDeFin,Distancia):-
    etapa(CiudadDeInicio,CiudadIntermedia,Tramo),
    distanciaEntreCiudades(CiudadIntermedia,CiudadDeFin,OtroTramo),
    Distancia is OtroTramo + Tramo.

%B)
recorridoSegunVehiculo(Vehiculo,2000):-
    vehiculoCaro(Vehiculo).

recorridoSegunVehiculo(Vehiculo,1800):-
    marcaVehiculo(Vehiculo,_),
    not(vehiculoCaro(Vehiculo)).

recorridoSegunVehiculo(camion(Items),Distancia):-
    length(Items,CantItems),
    Distancia is CantItems*1000.
    

puedeRecorrer(Vehiculo,Distancia):-
    recorridoSegunVehiculo(Vehiculo,DistanciaTotalPosible),
    DistanciaTotalPosible>=Distancia.

%%%%%%%% Punto 7 Tomo el 6c como PUNTO 7
/*
destinoMasLejano(Vehiculo,CiudadDeInicio,CiudadDeFin):-
    puedeRecorrer(Vehiculo,Distancia),
    findall(CiudadTransitada,(distanciaEntreCiudades(CiudadDeInicio,CiudadTransitada,OtraDistancia),Distancia>OtraDistancia),Ciudades),
    last(Ciudades,CiudadDeFin).
*/

destinoMasLejano(Vehiculo,CiudadDeInicio,CiudadDeFin):-
    puedeRecorrer(Vehiculo,Distancia),
    ciudadPorDistancia(CiudadDeInicio,Distancia,CiudadDeFin).
  
ciudadPorDistancia(CiudadDeInicio,Distancia,CiudadDeFin):-  
    findall(CiudadTransitada,(distanciaEntreCiudades(CiudadDeInicio,CiudadTransitada,OtraDistancia),Distancia>OtraDistancia),Ciudades),
    last(Ciudades,CiudadDeFin).