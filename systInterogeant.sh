#!/bin/bash
echo "Bienvenu sur mon projet Syst"
echo "Chsir l'option à executer svp"

#================================================
# TRESOR DIMOUYA 15B366FS
#================================================
#------------------------------------------------
# Menu - Affichage d'un menu
#------------------------------------------------
Menu()
{
  local -a menu fonc
  local titre nbchoix
  # Constitution du menu
  if [[ $(( $# % 1 )) -ne 0 ]] ; then
     echo "$0 - Menu invalide" >&2
     return 1
  fi
  titre="$1"
  shift 1
  set "$@" "return 0" "Sortie"
  while [[ $# -gt 0 ]]
  do
     (( nbchoix += 1 ))
     fonc[$nbchoix]="$1"
     menu[$nbchoix]="$2"
     shift 2
  done
  # Affichage menu
  PS3="Votre choix ? "
  while :
  do
     echo
     [[ -n "$titre" ]] && echo -e "$titre\n"
     select choix in "${menu[@]}"
     do
        if [[ -z "$choix" ]]
           then echo -e "\nChoix invalide"
           else eval ${fonc[$REPLY]}
        fi
        break
     done || break
  done
}
#------------------------------------------------
# CHome - Création fichier home.tar.gz
#------------------------------------------------
CHome()
{
   cut /ectc/passwd -d: -f1 > fichier1
   ls /home > fichier2
   find /home - typed -ctime 3 -print

   echo -e "\n***\n*** CHome\n***\n"
	echo "bienvenu chez nous"
}
#------------------------------------------------
# CEtcRoot -la fonction qui peret l'aquisition installation
#------------------------------------------------
CEtcRoot()
{
   echo -e "\n***\n*** CEtcRoot\n***\n"
   sudo dpkg --configure -a 
   sudo apt-get install xamp
   sudo /xamp/xamp start
}
#------------------------------------------------
# fonction qui affiche l'information sur l'utilisateur enregistre
#------------------------------------------------
GHome()
{
   echo -e "\n***\n*** GHome\n***\n"
}
#------------------------------------------------
# GEtcRoot - information sur l'utilisateur du disque de la memoire du process
#------------------------------------------------
GEtcRoot()
{
   echo -e "\n***\n*** information sur user du disque\n***\n"
   df -h
  du --si --max-depth=1 /home
  free
  w
  uptime	
  #  df -h ; top
}
#================================================
# M A I N . . .
#================================================
Menu \
  "+++ Bienvenu sur mon projet Syst +++"                           \
  CHome    "information sur l'utilisateur enregisteré il y a trois jours"          \
  CEtcRoot "Acqusititon installation et lancement de l'environnement xamp" \
  GHome    "Archivage des elements du repertoire personnel qui ont ete modifier pour l'utilisateur sudoer il ya deux jour dans un periferique externe"             \
  GEtcRoot "information sur l'utilisateur du disque de la memoire du processuer et de la swap"
