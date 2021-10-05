#!/bin/bash
case $1 in 
    help|?|--help|-h)
        echo "sudo dwservice"
        echo "  Le programme va récupérer un identifiant et un mot de passe à fournir"
        echo "  à la personne voulant prendre le controle de votre serveur à distance."
        echo "  Vous pouvez stopper le programme à tout moment en utilisant le raccourcie"
        echo "  clavier CTRL+C. La prise en main à distance sera coupé."
        echo ""
        echo "  Quelques options :"
        echo "      -s  --stop   =   Coupe le/les dwservice en cour d'execution"
        echo "      -h  --help   =   Aide"
        exit 0
    ;;
    stop|-s|--stop)
        if (whoami != root) ; then echo "Please run as root. Ex: sudo dwservice" ; echo 1 ; fi
        echo "Procédure d'arret de DWSercice"
        killall dwagent
        echo "Fin de transmission"
        exit 0
    ;;
    *)
        if (whoami != root) ; then echo "Please run as root. Ex: sudo dwservice" ; echo 1 ; fi
        echo "Procédure de lancement DWService"
    ;;
esac

#install et mise à jour de agent dwservice
if [ -d /usr/share/sav ]; then echo "Répertoire SAV présent" 
else mkdir /usr/share/sav ; fi
cd /usr/share/sav
wget https://www.dwservice.net/download/dwagent_x86.sh
chmod +x dwagent_x86.sh

#execution de dwservice
echo "2" | /usr/share/sav/dwagent_x86.sh
clear
echo "Fin de transmission."
exit 0