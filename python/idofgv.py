def idoatalakito(t): #ez a függvény csak is a meglévő adatokra aktuális, ugyanis csak 1 olyan rekord van, ahol nem 5 és nem 7
    if len(t) == 7:      #az idő string hossza, és ott 5 mp az eltelt idő nagysága.
        ora = int(t[0])
        perc = int(t[2:4])
        mp = int(t[5:])
        ido = 3600*ora + 60*perc + mp
    elif len(t) == 5:
        perc = int(t[0:2])
        mp = int(t[3:])
        ido = 60*perc + mp
    else:
        ido = 5
    return ido