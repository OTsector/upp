#!/bin/bash
bold=$(tput bold)
normal=$(tput sgr0)
banner="\n ^>_<^\t\t ${bold}_\n\t0${normal}${bold}7${normal}\t[|] ${bold}0${normal}ffensive ${bold}7${normal}ester\n\n"
clear
echo -e ${banner} && echo -e "

                   ▄ 
                   █▀
user2014
           password
         ▄            pr0f1l3r#@!
         █▀
                ▄▄█
     █
  █  █  █▀█  █▀█
  █     ▄▄█  ▄▄█
  █▄▄█  █    █     ▄█▀


"
if ! [[ $1 ]]; then
	echo -e "\t*select new file location: [/root/Desktop/pass.list]"
	read passlist
else
	passlist=$1
fi
if [[ $passlist = "" ]]; then
	echo -e "\tsorry, but select a file location for save passlist is too important!\n"
	exit 0
fi

setfile=$(echo $passlist | sed 's/\// /g') && setfilearray=($setfile) && file=${setfilearray[-1]} && echo $file
setdirectory=$(echo $passlist |  sed 's/.pass.list//') && directory=$setdirectory

if [ ! -d $directory ]; then
	echo -e "\terror: can't create file on this directory!\n"
	exit 0
fi
if [ ! -f $passlist ]; then
	echo -e "" > $passlist
fi
echo -e "\ttype words: [sweet macaron music 1996]"
read words
echo  $words | sed 's/ /\n/g' >> $passlist
while true; do
	echo -e "\tselect your option:\n\n\t[0] exit / done\n\t[1] l337 mode\n\t[2] add years\n\t[3] add special characters\n\t[4] add some word for all\n\t[5] remove equal words"
	read opinion
	if [[ $opinion = "0" ]]; then
		exit 0
	elif [[ $opinion = "1" ]]; then
		leet=$(echo $words | sed 's/a/4/g' | sed 's/A/4/g' | sed 's/e/3/g' | sed 's/E/3/g' | sed 's/i/1/g' | sed 's/I/1/g' | sed 's/m/w/g' | sed 's/M/w/g' | sed 's/o/0/g' | sed 's/O/0/g' | sed 's/s/5/g' | sed 's/S/5/g' | sed 's/t/7/g' | sed 's/T/7/g' | sed 's/g/9/g' | sed 's/G/9/g' | sed 's/w/m/g' | sed 's/W/m/g'| sed 's/z/2/g'| sed 's/Z/2/g')
		echo  $leet | sed 's/ /\n/g' >> $passlist
	elif [[ $opinion = "2" ]]; then
		wordarray=($words)
		year=(1985 1986 1987 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019 2020)
		echo -e "\tyears:"
		echo -e "\tset for:\n\t[0] exit / done\n\t[1] beginning\n\t[2] end\n\t[3] beginning & end"
		read how
		if [[ $how = "1" ]]; then
			echo -e "\tbeginning:"
			numbword="0"
			numbyear="0"
			while [[ true ]]; do
				currentword=${wordarray[$numbword]}
				while [[ true ]]; do
					if [[ $currentword = "" ]]; then
						break
					fi
				years=${year[$numbyear]}
				echo "$currentword$years" | sed 's/ /\n/g' >> $passlist
					if [[ $years = "" ]]; then
						let numbyear=$numbyear+1
						numbyear="0"
						break
					fi
				if ! [[ $(let lastnumbyear=${#year[@]}-1 && echo $lastnumbyear) = $numbyear ]];then
					let numbyear=$numbyear+1
				else
					break
				fi
				done
				numbyear="0"
				if [[ $currentword = "" ]]; then
					break
				fi
				if ! [[ $numbyear = "1" ]]; then
					let numbword=$numbword+1
				fi
			done
		elif [[ $how = "2" ]]; then
			echo -e "\tend:"
			numbword="0"
			numbyear="0"
			while [[ true ]]; do
				currentword=${wordarray[$numbword]}
				while [[ true ]]; do
					if [[ $currentword = "" ]]; then
						break
					fi
				years=${year[$numbyear]}
				echo "$years$currentword" | sed 's/ /\n/g' >> $passlist
					if [[ $years = "" ]]; then
						let numbyear=$numbyear+1
						numbyear="0"
						break
					fi
				if ! [[ $(let lastnumbyear=${#year[@]}-1 && echo $lastnumbyear) = $numbyear ]];then
					let numbyear=$numbyear+1
				else
					break
				fi
				done
				numbyear="0"
				if [[ $currentword = "" ]]; then
					break
				fi
				if ! [[ $numbyear = "1" ]]; then
					let numbword=$numbword+1
				fi
			done
		elif [[ $how = "3" ]]; then
			echo -e "\tbeginning & end:"
			numbword="0"
			numbyear="0"
			while [[ true ]]; do
				currentword=${wordarray[$numbword]}
				while [[ true ]]; do
					if [[ $currentword = "" ]]; then
						break
					fi
				years=${year[$numbyear]}
				echo "$currentword$years" | sed 's/ /\n/g' >> $passlist
				echo "$years$currentword" | sed 's/ /\n/g' >> $passlist
					if [[ $years = "" ]]; then
						let numbyear=$numbyear+1
						numbyear="0"
						break
					fi
				if ! [[ $(let lastnumbyear=${#year[@]}-1 && echo $lastnumbyear) = $numbyear ]];then
					let numbyear=$numbyear+1
				else
					break
				fi
				done
				numbyear="0"
				if [[ $currentword = "" ]]; then
					break
				fi
				if ! [[ $numbyear = "1" ]]; then
					let numbword=$numbword+1
				fi
			done
		elif [[ $how = "3" ]]; then
			false
		fi
	elif [[ $opinion = "3" ]]; then
		special=("~" "~~" "~~~" "!" "!!" "!!!" "@" "@@" "@@@" "#" "##" "###" "$" "$$" "$$$" "%" "%%" "%%%" "^" "^^" "^^^" "&" "&&" "&&&" "*" "**" "***" "~!@" "#$%" "^&*" "*&^" "%$#" "@!~" "@#" "#$" "$%" "%^" "^&" "&*" "*&" "&^" "^%" "%$" "$#" "#@" "@!" "!~" "~!@" "!@#" "@#$" "#$%" "#$%" "$%^" "^%$" "%$#" "$#@" "#@!" "@!~" )
		echo -e "\tspecial:"
		echo -e "\tset for:\n\t[0] exit / done\n\t[1] beginning\n\t[2] end\n\t[3] beginning & end"
		read how
		if [[ $how = "1" ]]; then
			echo -e "\tbeginning:"
			numbword="0"
			numbspecial="0"
			while [[ true ]]; do
				currentword=${wordarray[$numbword]}
				while [[ true ]]; do
					if [[ $currentword = "" ]]; then
						break
					fi
				specials=${special[$numbspecial]}
				echo "$currentword$specials" | sed 's/ /\n/g' >> $passlist
					if [[ $specials = "" ]]; then
						let numbspecial=$numbspecial+1
						numbspecial="0"
						break
					fi
				if ! [[ $(let lastnumbspecial=${#special[@]}-1 && echo $lastnumbspecial) = $numbspecial ]];then
					let numbspecial=$numbspecial+1
				else
					break
				fi
				done
				numbspecial="0"
				if [[ $currentword = "" ]]; then
					break
				fi
				if ! [[ $numbspecial = "1" ]]; then
					let numbword=$numbword+1
				fi
			done
		elif [[ $how = "2" ]]; then
			echo -e "\tend:"
			numbword="0"
			numbspecial="0"
			while [[ true ]]; do
				currentword=${wordarray[$numbword]}
				while [[ true ]]; do
					if [[ $currentword = "" ]]; then
						break
					fi
				specials=${special[$numbspecial]}
				echo "$specials$currentword" | sed 's/ /\n/g' >> $passlist
					if [[ $specials = "" ]]; then
						let numbspecial=$numbspecial+1
						numbspecial="0"
						break
					fi
				if ! [[ $(let lastnumbspecial=${#special[@]}-1 && echo $lastnumbspecial) = $numbspecial ]];then
					let numbspecial=$numbspecial+1
				else
					break
				fi
				done
				numbspecial="0"
				if [[ $currentword = "" ]]; then
					break
				fi
				if ! [[ $numbspecial = "1" ]]; then
					let numbword=$numbword+1
				fi
			done
		elif [[ $how = "3" ]]; then
			echo -e "\tbeginning & end:"
			numbword="0"
			numbspecial="0"
			while [[ true ]]; do
				currentword=${wordarray[$numbword]}
				while [[ true ]]; do
					if [[ $currentword = "" ]]; then
						break
					fi
				specials=${special[$numbspecial]}
				echo "$currentword$specials" | sed 's/ /\n/g' >> $passlist
				echo "$specials$currentword" | sed 's/ /\n/g' >> $passlist
					if [[ $specials = "" ]]; then
						let numbspecial=$numbspecial+1
						numbspecial="0"
						break
					fi
				if ! [[ $(let lastnumbspecial=${#special[@]}-1 && echo $lastnumbspecial) = $numbspecial ]];then
					let numbspecial=$numbspecial+1
				else
					break
				fi
				done
				numbspecial="0"
				if [[ $currentword = "" ]]; then
					break
				fi
				if ! [[ $numbspecial = "1" ]]; then
					let numbword=$numbword+1
				fi
			done
		elif [[ $how = "3" ]]; then
			false
		fi
	elif [[ $opinion = "4" ]]; then
		echo -e "\tadd some word for all:"
		read some
		if [[ $some = "" ]] && [[ $(echo $some | grep " ") = "" ]]; then
			echo -e "\terror: need to set one word only!\n"
		else
			echo -e "\tsome:"
			echo -e "\tset for:\n\t[0] exit / done\n\t[1] beginning\n\t[2] end\n\t[3] beginning & end"
			read how
			if [[ $how = "1" ]]; then
				echo -e "\tbeginning:"
				#aq some
				numbword="0"
				while [[ true ]]; do
					currentword=${wordarray[$numbword]}
					echo "$currentword$some" | sed 's/ /\n/g' >> $passlist
					if [[ $currentword = "" ]]; then
						break
					fi
					if ! [[ $numbsome = "1" ]]; then
						sleep 0.3 && let numbword=$numbword+1
					fi
				done
			elif [[ $how = "2" ]]; then
			echo -e "\tend:"
				numbword="0"
				while [[ true ]]; do
					currentword=${wordarray[$numbword]}
					echo "$some$currentword" | sed 's/ /\n/g' >> $passlist
					if [[ $currentword = "" ]]; then
						break
					fi
					if ! [[ $numbsome = "1" ]]; then
						sleep 0.3 && let numbword=$numbword+1
					fi
				done
			elif [[ $how = "3" ]]; then
			echo -e "\tbeginning & end:"
				numbword="0"
				while [[ true ]]; do
					currentword=${wordarray[$numbword]}
					echo "$currentword$some" | sed 's/ /\n/g' >> $passlist
					echo "$some$currentword" | sed 's/ /\n/g' >> $passlist
					if [[ $currentword = "" ]]; then
						break
					fi
					if ! [[ $numbsome = "1" ]]; then
						sleep 0.3 && let numbword=$numbword+1
					fi
				done
			fi

		fi
	elif [[ $opinion = "5" ]]; then
		echo -e "\tremove equal words:"
		echo $(sort $passlist | uniq) > $passlist
		foo=$(cat $passlist); echo -e ${foo// /\\n} > $passlist
	else
		echo -e "\twrong choice"
	fi
done
exit 0