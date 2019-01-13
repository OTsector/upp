#!/bin/bash
bold=$(tput bold)
normal=$(tput sgr0)
banner="# ./07.dat\n\t\t ${bold}_\n\t0${normal}${bold}7${normal}\t[|] ${bold}0${normal}ffensive ${bold}7${normal}ester\n\n"
clear
echo -en "#\r"; sleep 0.1
echo -en "# .\r"; sleep 0.1
echo -en "# ./\r"; sleep 0.1
echo -en "# ./0\r"; sleep 0.1
echo -en "# ./07\r"; sleep 0.1
echo -en "# ./07.\r"; sleep 0.2
echo -en "# ./07.d\r"; sleep 0.2
echo -en "# ./07.da\r"; sleep 0.2
echo -en "# ./07.dat\r"; sleep 0.2
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
words=""
if ! [[ $1 ]]; then
	echo -e "\t*select file location: [/root/Desktop/pass.list]"
	read passlist
else
	passlist=$1
fi
if [[ $passlist == "" ]]; then
	echo -e "\tsorry, but select a file location for save passlist is too important!\n"
	exit 1
fi
if [ -d $passlist ]; then
	echo -e "\terror: this is directory name!\n"
	exit 1
fi
if [[ ${passlist:00:01} == "~" ]]; then
	passlist=$HOME${passlist:1}
fi
setfile=$(echo $passlist | sed 's/\// /g') && setfilearray=($setfile) && file=${setfilearray[-1]}
setdirectory=$(echo $passlist |  sed 's/.'$file'//') && directory=$setdirectory

if [ ! -d $directory ]; then
	echo -e "\terror: can't create file on this directory!\n"
	exit 1
fi
if [ ! -f $passlist ]; then
	echo -e "" > $passlist
fi
echo -e "\ttype words: [sweet macaron music 1996]"
read words
if [[ $words != "" ]]; then
wordarray=($words)
	for (( a = 0; a < ${#wordarray[@]}; a++ )); do
		for (( b = 0; b < ${#wordarray[@]}; b++ )); do
			if [[ $a != $b ]]; then
				addWord+="${wordarray[a]}${wordarray[b]} "
			fi
		done
	done
	wordarray+=($addWord)
fi
echo  ${wordarray[@]} | sed 's/ /\n/g' >> $passlist
while true; do
	echo -e "\n\tselect your option:\n\t[0] exit / done\n\t[1] leet mode\n\t[2] uppercase mode\n\t[3] add numbers\n\t[4] add special characters\n\t[5] add some words for all\n\t[6] remove equal words & sort"
	read opinion
	case $opinion in
	0)
		exit 1
	;;
	1)
		echo -e "\tleet mode:\n"
		echo -e "\tset for:\n\t[0] go back\n\t[1] leet mode\n\t[2] super leet"
		read how
		case $how in
		0);;
		1)
			(
			leet=$(echo ${wordarray[@]} | sed 's/a/4/g' | sed 's/A/4/g' | sed 's/e/3/g' | sed 's/E/3/g' | sed 's/g/9/g' | sed 's/G/9/g' | sed 's/i/1/g' | sed 's/I/1/g' | sed 's/o/0/g' | sed 's/O/0/g' | sed 's/s/5/g' | sed 's/S/5/g' | sed 's/t/7/g' | sed 's/T/7/g' | sed 's/z/2/g'| sed 's/Z/2/g')
			echo  $leet | sed 's/ /\n/g' >> $passlist
			) | echo -en "\n\tloading...\r" && echo -en "\tdone!                \r\n"
		;;
		2)
			(
			superLeet=$(echo ${wordarray[@]} | sed 's/a/\/-\\/g' | sed 's/A/\/-\\/g' | sed 's/b/\|3/g' | sed 's/B/\|3/g' | sed 's/d/\|\)/g' | sed 's/D/\|\)/g' | sed 's/e/3/g' | sed 's/E/3/g' |  sed 's/g/9/g' | sed 's/G/9/g' | sed 's/h/\|-\|/g' | sed 's/H/\|-\|/g' | sed 's/i/1/g' | sed 's/I/1/g' | sed 's/k/\|\</g' | sed 's/k/\|\</g' | sed 's/l/\|_/g' | sed 's/L/\|_/g' | sed 's/m/\|V\|/g' | sed 's/M/\|V\|/g' | sed 's/n/\|\\\|/g' | sed 's/N/\|\\\|/g' | sed 's/r/\|2/g' | sed 's/R/\|2/g' | sed 's/o/0/g' | sed 's/O/0/g' | sed 's/s/5/g' | sed 's/S/5/g' | sed 's/t/7/g' | sed 's/T/7/g' | sed 's/v/\\\//g' | sed 's/V/\\\//g' | sed 's/w/vv/g' | sed 's/W/vv/g'| sed 's/x/\>\</g' | sed 's/X/\>\</g'| sed 's/z/2/g'| sed 's/Z/2/g')

			echo  $superLeet | sed 's/ /\n/g' >> $passlist
			) | echo -en "\n\tloading...\r" && echo -en "\tdone!                \r\n"
		;;
		*)
		echo -e "\twrong choice"
		;;
		esac
	;;
	2)
		(
		numbword=0
		while [[ true ]]; do
			let lastnumbnumber=${#wordarray[@]}-1;
			currentword=${wordarray[$numbword]}
			if [[ $currentword == "" ]]; then
				break
			fi
			for (( a = 0; a < ${#currentword}; a++ )); do
				for (( b = a; b <= ${#currentword}; b++ )); do
					if [[ $a != $b ]]; then
						first=${currentword:0:a}
						second=${currentword:a:b-a}
						last=${currentword:b}
						echo $first${second^^}$last >> $passlist
					fi
				done
			done
			if [[ $numbword == $lastnumbnumber ]]; then
				break
			else
				let numbword=$numbword+1
			fi
		done
		) | echo -en "\n\tloading...\r" && echo -en "\tdone!                \r\n"
	;;
	3)
		echo -en "set minimum: " && read minimum
		echo -en "set maximum: " && read maximum
		echo ""
		if [[ $minimum != "" ]] && [[ $maximum != "" ]]; then
			#wordarray=($words)
			number=($(for (( numberArray == $minimum; numberArray <= $maximum; numberArray++ )); do echo -en "$numberArray "; done))
			echo -e "\tnumbers:\n"
			echo -e "\tset for:\n\t[0] go back\n\t[1] beginning\n\t[2] end\n\t[3] beginning & end\n\t[4] for both side\n\t[5] all of them"
			read how
			case $how in
			0);;
			1)
				echo -e "\tbeginning:"
				(
				numbword=0
				numbnumber=0
				while [[ true ]]; do
					currentword=${wordarray[$numbword]}
					while [[ true ]]; do
						if [[ $currentword == "" ]]; then
							break
						fi
						numbers=${number[$numbnumber]}
						if [[ $numbers == "" ]]; then
							let numbnumber=$numbnumber+1
							numbnumber=0
							break
						fi
						echo "$numbers$currentword" | sed 's/ /\n/g' >> $passlist
						let lastnumbnumber=${#number[@]}-1;
						if ! [[ $lastnumbnumber == $numbnumber ]];then
							let numbnumber=$numbnumber+1
						else
							break
						fi
					done
					numbnumber=0
					if [[ $currentword == "" ]]; then
						break
					fi
					if ! [[ $numbnumber == 1 ]]; then
						let numbword=$numbword+1
					fi
				done
				) | echo -en "\n\tloading...\r" && echo -en "\tdone!                \r\n"
			;;
			2)
				echo -e "\tend:"
				numbword=0
				numbnumber=0
				while [[ true ]]; do
					currentword=${wordarray[$numbword]}
					while [[ true ]]; do
						if [[ $currentword == "" ]]; then
							break
						fi
						numbers=${number[$numbnumber]}
						if [[ $numbers == "" ]]; then
							let numbnumber=$numbnumber+1
							numbnumber=0
							break
						fi
						echo "$currentword$numbers" | sed 's/ /\n/g' >> $passlist
							let lastnumbnumber=${#number[@]}-1;
							if ! [[ $lastnumbnumber == $numbnumber ]]; then
								let numbnumber=$numbnumber+1
							else
								break
							fi
					done
					numbnumber=0
					if [[ $currentword == "" ]]; then
						break
					fi
					if ! [[ $numbnumber == 1 ]]; then
						let numbword=$numbword+1
					fi
				done
			;;
			3)
				echo -e "\tbeginning & end:"
				(
				numbword=0
				numbnumber=0
				while [[ true ]]; do
					currentword=${wordarray[$numbword]}
					while [[ true ]]; do
						if [[ $currentword == "" ]]; then
							break
						fi
						numbers=${number[$numbnumber]}
						if [[ $numbers == "" ]]; then
							let numbnumber=$numbnumber+1
							numbnumber=0
							break
						fi
						echo "$numbers$currentword" | sed 's/ /\n/g' >> $passlist
						echo "$currentword$numbers" | sed 's/ /\n/g' >> $passlist
						let lastnumbnumber=${#number[@]}-1;
						if ! [[ $lastnumbnumber == $numbnumber ]]; then
							let numbnumber=$numbnumber+1
						else
							break
						fi
					done
					numbnumber=0
					if [[ $currentword == "" ]]; then
						break
					fi
					if ! [[ $numbnumber == 1 ]]; then
						let numbword=$numbword+1
					fi
				done
				) | echo -en "\n\tloading...\r" && echo -en "\tdone!                \r\n"
			;;
			4)
				echo -e "\tfor both side:"
				(
				numbword=0
				numbnumber=0
				while [[ true ]]; do
					currentword=${wordarray[$numbword]}
					while [[ true ]]; do
						if [[ $currentword == "" ]]; then
							break
						fi
						numbers=${number[$numbnumber]}
						if [[ $numbers == "" ]]; then
							let numbnumber=$numbnumber+1
							numbnumber=0
							break
						fi
						echo "$numbers$currentword$numbers" | sed 's/ /\n/g' >> $passlist
						let lastnumbnumber=${#number[@]}-1;
						if ! [[ $lastnumbnumber == $numbnumber ]]; then
							let numbnumber=$numbnumber+1
						else
							break
						fi
					done
					numbnumber=0
					if [[ $currentword == "" ]]; then
						break
					fi
					if ! [[ $numbnumber == 1 ]]; then
						let numbword=$numbword+1
					fi
				done
				) | echo -en "\n\tloading...\r" && echo -en "\tdone!                \r\n"
			;;
			5)
				echo -e "\tall of them:"
				(
				numbword=0
				numbnumber=0
				while [[ true ]]; do
					currentword=${wordarray[$numbword]}
					while [[ true ]]; do
						if [[ $currentword == "" ]]; then
							break
						fi
						numbers=${number[$numbnumber]}
						if [[ $numbers == "" ]]; then
							let numbnumber=$numbnumber+1
							numbnumber=0
							break
						fi
						echo "$numbers$currentword" | sed 's/ /\n/g' >> $passlist
						echo "$numbers$currentword$numbers" | sed 's/ /\n/g' >> $passlist
						echo "$currentword$numbers" | sed 's/ /\n/g' >> $passlist
						let lastnumbnumber=${#number[@]}-1;
						if ! [[ $lastnumbnumber == $numbnumber ]]; then
							let numbnumber=$numbnumber+1
						else
							break
						fi
					done
					numbnumber=0
					if [[ $currentword == "" ]]; then
						break
					fi
					if ! [[ $numbnumber == 1 ]]; then
						let numbword=$numbword+1
					fi
				done
				) | echo -en "\n\tloading...\r" && echo -en "\tdone!                \r\n"
			;;
			*)
				echo -e "\twrong choice"
			;;
			esac
		else
			echo -e "\tset minimum and maximum number are so important!"
		fi
	;;
	4)
		special=('~' '~~' '~~~' '!' '!!' '!!!' '@' '@@' '@@@' '#' '##' '###' \
			'$' '$$' '$$$' '%' '%%' '%%%' '^' '^^' '^^^' '&' '&&' '&&&' \
			'*' '**' '***' '~!@' '#$%' '^&*' '*&^' '%$#' '@!~' '@#' '#$' '$%' \
			'%^' '^&' '&*' '*&' '&^' '^%' '%$' '$#' '#@' '@!' '!~' '~!@' '!@#' '@#$' \
			'#$%' '#$%' '$%^' '^%$' '%$#' '$#@' '#@!' '@!~' '!|' '!@|+' '!@#|+_' '$%^)(*' \
			')' '^*' '^%*(' '^%$' '&*(' '^%$#@!' '*()_+|' '|!' '|+!@' '|+_!@#' ')(*$%^' '*^' \
			'*(^%' '_+|$#!' '!@#$%^' '|+_)(*' '^%$#@!' '*()_+|')
		echo -e "\n\tspecial:\n"
		echo -e "\tset for:\n\t[0] go back\n\t[1] beginning\n\t[2] end\n\t[3] beginning & end\n\t[4] for both side\n\t[5] all of them"
		read how
		case $how in
		0);;
		1)
			echo -e "\tbeginning:"
			(
			numbword=0
			numbspecial=0
			while [[ true ]]; do
				currentword=${wordarray[$numbword]}
				while [[ true ]]; do
					if [[ $currentword == "" ]]; then
						break
					fi
					specials=${special[$numbspecial]}
					if [[ $specials == "" ]]; then
						let numbspecial=$numbspecial+1
						numbspecial=0
						break
					fi
					echo "$specials$currentword" | sed 's/ /\n/g' >> $passlist
					let lastnumbspecial=${#special[@]}-1;
					if ! [[ $lastnumbspecial == $numbspecial ]]; then
						let numbspecial=$numbspecial+1
					else
						break
					fi
				done
				numbspecial=0
				if [[ $currentword == "" ]]; then
					break
				fi
				if ! [[ $numbspecial == 1 ]]; then
					let numbword=$numbword+1
				fi
			done
			) | echo -en "\n\tloading...\r" && echo -en "\tdone!                \r\n"
		;;
		2)
			echo -e "\tend:"
			(
			numbword=0
			numbspecial=0
			while [[ true ]]; do
				currentword=${wordarray[$numbword]}
				while [[ true ]]; do
					if [[ $currentword == "" ]]; then
						break
					fi
					specials=${special[$numbspecial]}
					if [[ $specials == "" ]]; then
						let numbspecial=$numbspecial+1
						numbspecial=0
						break
					fi
					echo "$currentword$specials" | sed 's/ /\n/g' >> $passlist
					let lastnumbspecial=${#special[@]}-1;
					if ! [[ $lastnumbspecial == $numbspecial ]]; then
						let numbspecial=$numbspecial+1
					else
						break
					fi
				done
				numbspecial=0
				if [[ $currentword == "" ]]; then
					break
				fi
				if ! [[ $numbspecial == 1 ]]; then
					let numbword=$numbword+1
				fi
			done
			) | echo -en "\n\tloading...\r" && echo -en "\tdone!                \r\n"
		;;
		3)
			echo -e "\tbeginning & end:"
			(
			numbword=0
			numbspecial=0
			while [[ true ]]; do
				currentword=${wordarray[$numbword]}
				while [[ true ]]; do
					if [[ $currentword == "" ]]; then
						break
					fi
					specials=${special[$numbspecial]}
					if [[ $specials == "" ]]; then
						let numbspecial=$numbspecial+1
						numbspecial=0
						break
					fi
					echo "$specials$currentword" | sed 's/ /\n/g' >> $passlist
					echo "$currentword$specials" | sed 's/ /\n/g' >> $passlist
					let lastnumbspecial=${#special[@]}-1;
					if ! [[ $lastnumbspecial == $numbspecial ]]; then
						let numbspecial=$numbspecial+1
					else
						break
					fi
				done
				numbspecial=0
				if [[ $currentword == "" ]]; then
					break
				fi
				if ! [[ $numbspecial == 1 ]]; then
					let numbword=$numbword+1
				fi
			done
			) | echo -en "\n\tloading...\r" && echo -en "\tdone!                \r\n"
		;;
		4)
			echo -e "\tfor both side:"
			(
			numbword=0
			numbspecial=0
			while [[ true ]]; do
				currentword=${wordarray[$numbword]}
				while [[ true ]]; do
					if [[ $currentword == "" ]]; then
						break
					fi
					specials=${special[$numbspecial]}
					if [[ $specials == "" ]]; then
						let numbspecial=$numbspecial+1
						numbspecial=0
						break
					fi
					echo "$specials$currentword$specials" | sed 's/ /\n/g' >> $passlist
					let lastnumbspecial=${#special[@]}-1;
					if ! [[ $lastnumbspecial == $numbspecial ]]; then
						let numbspecial=$numbspecial+1
					else
						break
					fi
				done
				numbspecial=0
				if [[ $currentword == "" ]]; then
					break
				fi
				if ! [[ $numbspecial == 1 ]]; then
					let numbword=$numbword+1
				fi
			done
			) | echo -en "\n\tloading...\r" && echo -en "\tdone!                \r\n"
		;;
		5)
			echo -e "\tall of them:"
			(
			numbword=0
			numbspecial=0
			while [[ true ]]; do
				currentword=${wordarray[$numbword]}
				while [[ true ]]; do
					if [[ $currentword == "" ]]; then
						break
					fi
					specials=${special[$numbspecial]}
					if [[ $specials == "" ]]; then
						let numbspecial=$numbspecial+1
						numbspecial=0
						break
					fi
					echo "$specials$currentword" | sed 's/ /\n/g' >> $passlist
					echo "$specials$currentword$specials" | sed 's/ /\n/g' >> $passlist
					echo "$currentword$specials" | sed 's/ /\n/g' >> $passlist
					let lastnumbspecial=${#special[@]}-1;
					if ! [[ $lastnumbspecial == $numbspecial ]]; then
						let numbspecial=$numbspecial+1
					else
						break
					fi
				done
				numbspecial=0
				if [[ $currentword == "" ]]; then
					break
				fi
				if ! [[ $numbspecial == 1 ]]; then
					let numbword=$numbword+1
				fi
			done
			) | echo -en "\n\tloading...\r" && echo -en "\tdone!                \r\n"
		;;
		*)
			echo -e "\twrong choice"
		;;
		esac
	;;
	5)
		echo -e "\tadd some words for all:"
		read someword
		if [[ $some == "" ]]; then
		echo -e "\tadd some words for all:"
		some=($someword)
		echo -e "\n\tsome:\n"
		echo -e "\tset for:\n\t[0] go back\n\t[1] beginning\n\t[2] end\n\t[3] beginning & end\n\t[4] for both side\n\t[5] all of them"
		read how
		case $how in
		0);;
		1)
			echo -e "\tbeginning:"
			(
			numbword=0
			numbsome=0
			while [[ true ]]; do
				currentword=${wordarray[$numbword]}
				while [[ true ]]; do
					if [[ $currentword == "" ]]; then
						break
					fi
					somes=${some[$numbsome]}
					if [[ $somes == "" ]]; then
						let numbsome=$numbsome+1
						numbsome=0
						break
					fi
					echo "$somes$currentword" | sed 's/ /\n/g' >> $passlist
					let lastnumbsome=${#wordarray[@]}-1;
					if ! [[ $lastnumbsome == $numbnumber ]]; then
						let numbsome=$numbspecial+1
					else
						break
					fi
				done
				numbsome=0
				if [[ $currentword == "" ]]; then
					break
				fi
				if ! [[ $numbsome == 1 ]]; then
					let numbword=$numbword+1
				fi
			done
			) | echo -en "\n\tloading...\r" && echo -en "\tdone!                \r\n"
		;;
		2)
			echo -e "\tend:"
			(
			numbword=0
			numbsome=0
			while [[ true ]]; do
				currentword=${wordarray[$numbword]}
				while [[ true ]]; do
					if [[ $currentword == "" ]]; then
						break
					fi
					somes=${some[$numbsome]}
					if [[ $somes == "" ]]; then
						let numbsome=$numbsome+1
						numbsome=0
						break
					fi
					echo "$currentword$somes" | sed 's/ /\n/g' >> $passlist
					let lastnumbsome=${#wordarray[@]}-1;
					if ! [[ $lastnumbsome == $numbnumber ]]; then
						let numbsome=$numbspecial+1
					else
						break
					fi
				done
				numbsome=0
				if [[ $currentword == "" ]]; then
					break
				fi
				if ! [[ $numbsome == 1 ]]; then
					let numbword=$numbword+1
				fi
			done
			) | echo -en "\n\tloading...\r" && echo -en "\tdone!                \r\n"
		;;
		3)
			echo -e "\tbeginning & end:"
			(
			numbword=0
			numbsome=0
			while [[ true ]]; do
				currentword=${wordarray[$numbword]}
				while [[ true ]]; do
					if [[ $currentword == "" ]]; then
						break
					fi
					somes=${some[$numbsome]}
					if [[ $somes == "" ]]; then
						let numbsome=$numbsome+1
						numbsome=0
						break
					fi
					echo "$somes$currentword" | sed 's/ /\n/g' >> $passlist
					echo "$currentword$somes" | sed 's/ /\n/g' >> $passlist
					let lastnumbsome=${#wordarray[@]}-1;
					if ! [[ $lastnumbsome == $numbnumber ]]; then
						let numbsome=$numbspecial+1
					else
						break
					fi
				done
				numbsome=0
				if [[ $currentword == "" ]]; then
					break
				fi
				if ! [[ $numbsome == 1 ]]; then
					let numbword=$numbword+1
				fi
			done
			) | echo -en "\n\tloading...\r" && echo -en "\tdone!                \r\n"
		;;
		4)
			echo -e "\tfor both side:"
			(
			numbword=0
			numbsome=0
			while [[ true ]]; do
				currentword=${wordarray[$numbword]}
				while [[ true ]]; do
					if [[ $currentword == "" ]]; then
						break
					fi
					somes=${some[$numbsome]}
					if [[ $somes == "" ]]; then
						let numbsome=$numbsome+1
						numbsome=0
						break
					fi
					echo "$somes$currentword$somes" | sed 's/ /\n/g' >> $passlist
					let lastnumbsome=${#wordarray[@]}-1;
					if ! [[ $lastnumbsome == $numbnumber ]]; then
						let numbsome=$numbspecial+1
					else
						break
					fi
				done
				numbsome=0
				if [[ $currentword == "" ]]; then
					break
				fi
				if ! [[ $numbsome == 1 ]]; then
					let numbword=$numbword+1
				fi
			done
			) | echo -en "\n\tloading...\r" && echo -en "\tdone!                \r\n"
		;;
		5)
			echo -e "\tall of them:"
			(
			numbword=0
			numbsome=0
			while [[ true ]]; do
				currentword=${wordarray[$numbword]}
				while [[ true ]]; do
					if [[ $currentword == "" ]]; then
						break
					fi
					somes=${some[$numbsome]}
					if [[ $somes == "" ]]; then
						let numbsome=$numbsome+1
						numbsome=0
						break
					fi
					echo "$somes$currentword" | sed 's/ /\n/g' >> $passlist
					echo "$somes$currentword$somes" | sed 's/ /\n/g' >> $passlist
					echo "$currentword$somes" | sed 's/ /\n/g' >> $passlist
					let lastnumbsome=${#wordarray[@]}-1;
					if ! [[ $lastnumbsome == $numbsome ]]; then
						let numbsome=$numbsome+1
					else
						break
					fi
				done
				numbsome=0
				if [[ $currentword == "" ]]; then
					break
				fi
				if ! [[ $numbsome == 1 ]]; then
					let numbword=$numbword+1
				fi
			done
			) | echo -en "\n\tloading...\r" && echo -en "\tdone!                \r\n"
		;;
		*)
			echo -e "\twrong choice"
		;;
		esac
		fi
	;;
	6)
		echo -e "\tremove equal words & sort:"
		(
		echo $(sort $passlist | uniq -u) > $passlist
		sed 's/ /\n/g' -i $passlist
		) | echo -en "\n\tloading...\r" && echo -en "\tdone!                \r\n"
	;;
	*)
		echo -e "\twrong choice"
	;;
	esac
done
exit 0
