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
function cleartemp {
	if [[ -f /tmp/upp.dat ]]; then
		rm -rf /tmp/upp.dat
	fi
}
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
buffersizemax=50000
if [ ! -d $directory ]; then
	echo -e "\terror: can't create file on this directory!\n"
	exit 1
fi
if [ ! -f $passlist ]; then
	touch $passlist || echo "ERROR: can't create "$passlist" (can be a permission issue. try use \"sudo\")"
fi
echo -e "\ttype words: [facebook password qwerty 1996]"
read words
while [[ $words == "" ]]; do
	echo -e "\tERROR: the words are empty\n\n\ttype words: [facebook password qwerty 1996]"
	read words
done
wordarray=($words)
	for (( a = 0; a < ${#wordarray[@]}; a++ )); do
		for (( b = 0; b < ${#wordarray[@]}; b++ )); do
			if [[ $a != $b ]]; then
				addWord+="${wordarray[a]}${wordarray[b]} "
			fi
		done
	done
wordarray+=($addWord)
sed 's/ /\n/g' <<< ${wordarray[@]} >> $passlist
while true; do
	opinion=""
	how=""
	minimum=""
	maximum=""
	someword=""
	echo -e "\n\tselect your option:\n\t[0] exit / done\n\t[1] leet mode\t\t\t< [1] lm [2] slm\n\t[2] uppercase mode\n\t[3] add numbers\t\t\t< [1] b [2] e [3] be [4] fbs [5] aot\n\t[4] add special characters\t< [1] b [2] e [3] be [4] fbs [5] aot\n\t[5] add some words for all\t< [1] b [2] e [3] be [4] fbs [5] aot\n\t[6] remove equal words & sort"
	read opinion
	if [[ $opinion == "" ]]; then
		echo -e "\tERROR: wrong choice"
	fi
	opinionarray=($opinion)
	opiniontruearray=(0 1 11 12 2 3 31 32 33 34 35 4 41 42 43 44 45 5 51 52 53 54 55 6)
	optionnotsinglearray=(1 3 4 5)
	if [[ ${#opinionarray[@]} < 1 ]]; then
		for((i = 0; i < ${#opinionarray[@]}; i++)); do
			for((j=0; j < ${#optionnotsinglearray[@]}; j++)); do
				if [[ ${opinionarray[$i]} == ${optionnotsinglearray[$j]} ]];then
					echo -e "\tERROR: wrong multiple choise"
					opinionarray=(); break; break; break
				fi
			done
			for((j = 0; j < ${#opinionarray[@]}; j++)); do
				if [[ ${opinionarray[i]} == ${opinionarray[j]} ]]; then
					echo -e "\tERROR: wrong multiple input"
					opinionarray=(); break; break; break
				fi
			done
		done
	fi
	for (( i = 0; i < ${#opinionarray[@]}; i++ )); do
		currentopinion=${opinionarray[$i]}
		boolean=false
		for (( j = 0; j < ${#opiniontruearray[@]}; j++ )); do
			currentopiniontrue=${opiniontruearray[$j]}
			if [[ $currentopiniontrue == $currentopinion ]]; then
				boolean=true
			fi
		done
		if [[ $boolean = false ]]; then
			echo -e "\tERROR: wrong choice for $currentopinion"
		fi
		if [[ ${currentopinion:0:1} == 3 ]] && [[ $boolean = true ]]; then
			echo -e "\tnumbers:\n"
		while [[ $minimum == "" ]]; do
			echo -en "set minimum: " && read minimum
			if [[ $minimum == "" ]]; then
				echo -e "\tERROR: set minimum number is too important"
			else
				break
			fi
		done
		while [[ $maximum == "" ]]; do
			echo -en "set maximum: " && read maximum
			if [[ $maximum == "" ]]; then
				echo -e "\tERROR: set maximum number is too important"
			else
				break
			fi
		done
		elif [[ ${currentopinion:0:1} == 5 ]] && [[ $boolean = true ]]; then
			echo -e "\tadd some words for all:"; read someword
		fi
	done
	if [[ $boolean = false ]]; then
		opinionarray=()
	fi
	for (( i = 0; i < ${#opinionarray[@]}; i++ )); do
		opinion=${opinionarray[$i]:0:1}
		how=${opinionarray[$i]:1:1}
		case $opinion in
		0)
			exit 1
		;;
		1)
			if [[ ${#opinionarray[@]} == 1 ]]; then
				echo -e "\tleet mode:\n"
				echo -e "\tset for:\n\t[0] go back\n\t[1] normal mode\n\t[2] super mode"
			fi
			if [[ $how == "" ]]; then
				read how
			fi
			if [[ $how == "" ]]; then
				echo -e "\tERROR: wrong choice"
				how=0
			fi
			case $how in
			0);;
			1)
				if [[ ${#opinionarray[@]} > 1 ]]; then
					echo -e "\tleet mode: normal mode"
				fi
				(
				leet=$(sed -e 's/a/4/g' -e 's/A/4/g' -e 's/e/3/g' -e 's/E/3/g' -e 's/g/9/g' -e 's/G/9/g' \
						-e 's/i/1/g' -e 's/I/1/g' -e 's/o/0/g' -e 's/O/0/g' -e 's/s/5/g' -e 's/S/5/g' \
						-e 's/t/7/g' -e 's/T/7/g' -e 's/z/2/g' -e 's/Z/2/g' <<< ${wordarray[@]})
				tr " " "\n" <<< $leet >> $passlist
				) | echo -en "\n\tloading...\r" && echo -en "\tdone!                \r\n\n"
			;;
			2)
			if [[ ${#opinionarray[@]} > 1 ]]; then
				echo -e "\tleet mode: super mode"
			fi
				(
				superLeet=$(sed -e 's/a/\/-\\/g' -e 's/A/\/-\\/g' -e 's/b/\|3/g' -e 's/B/\|3/g' \
						-e 's/c/\(/g' -e 's/C/\(/g' -e 's/d/\|\)/g' -e 's/D/\|\)/g' \
						-e 's/e/3/g' -e 's/E/3/g' -e 's/g/9/g' -e 's/G/9/g' \
						-e 's/h/\|-\|/g' -e 's/H/\|-\|/g' -e 's/i/1/g' -e 's/I/1/g' \
						-e 's/k/\|\</g' -e 's/k/\|\</g' -e 's/l/\|_/g' -e 's/L/\|_/g' \
						-e 's/m/\|V\|/g' -e 's/M/\|V\|/g' -e 's/n/\|\\\|/g' -e 's/N/\|\\\|/g' \
						-e 's/r/\|2/g' -e 's/R/\|2/g' -e 's/o/0/g' -e 's/O/0/g' \
						-e 's/s/5/g' -e 's/S/5/g' -e 's/t/7/g' -e 's/T/7/g' -e 's/u/\|_\|/g' \
						-e 's/u/\|_\|/g' -e 's/v/\\\//g' -e 's/V/\\\//g' -e 's/w/vv/g' -e 's/W/vv/g' \
						-e 's/x/\>\</g' -e 's/X/\>\</g' -e 's/z/2/g' -e 's/Z/2/g' <<< ${wordarray[@]})

				tr " " "\n" <<< $superLeet >> $passlist
				) | echo -en "\n\tloading...\r" && echo -en "\tdone!                \r\n\n"
			;;
			*)
			echo -e "\tERROR: wrong choice for $how"; how=0
			;;
			esac
		;;
		2)
			if [[ ${#opinionarray[@]} -ge 1 ]] ; then
			echo -e "\tuppercase mode"
			fi
			(
			numbword=0
			for((i=0; i<${#wordarray[@]}; i++)); do
				currentword=${wordarray[$i]}
				eval echo $(echo $currentword | sed 's/./{\U&,\L&}/g')|tr " " "\n" >> $passlist
			done
			) | echo -en "\n\tloading...\r" && echo -en "\tdone!                \r\n\n"
		;;
		3)
			if [[ $minimum == "" ]] && [[ $maximum == "" ]]; then
				echo -e "\tnumbers:\n"
				echo -en "set minimum: " && read minimum
				echo -en "set maximum: " && read maximum
			fi
			if [[ $minimum != "" ]] && [[ $maximum != "" ]]; then
				if [[ ${#opinionarray[@]} == 1 ]]; then
					echo -e "\tnumbers:"
					if [[ $how == "" ]]; then
						echo -e "\tset for:\n\t[0] go back\n\t[1] beginning\n\t[2] end\n\t[3] beginning & end\n\t[4] for both side\n\t[5] all of them"
					fi
				fi
				if [[ $how == "" ]]; then
					read how
				fi
				if [[ $how == "" ]]; then
					echo -e "\tERROR: wrong choice"
					how=0
				fi
				case $how in
				0);;
				1)
					if [[ ${#opinionarray[@]} == 1 ]]; then
						echo -e "\tbeginning:"
					elif [[ ${#opinionarray[@]} > 1 ]]; then
						echo -e "\tnumbers:  beginning"
					fi
					(
					numbword=0
					numbnumber=0
					buffersize=0
					for((i=0; i<${#wordarray[@]}; i++)); do
						currentword=${wordarray[$i]}
						for((j=$minimum; j<=$maximum; j++)); do
							zero="";
							for((z=0; z<${#minimum}-${#j}; z++)) do
								zero+="0"
							done 
							numbers=$zero$j
							buffer+=" $numbers$currentword"
							if [ $buffersize -eq $buffersizemax ]; then
								tr " " "\n" <<< $buffer >> $passlist
								buffer=""; buffersize=0
							fi
							let buffersize++
						done
					done; tr " " "\n" <<< $buffer >> $passlist; buffer=""
					) | echo -en "\n\tloading...\r" && echo -en "\tdone!                \r\n\n"
				;;
				2)
					if [[ ${#opinionarray[@]} == 1 ]]; then
						echo -e "\tend:"
					elif [[ ${#opinionarray[@]} > 1 ]]; then
					echo -e "\tnumbers: end"
					fi
					numbword=0
					numbnumber=0
					buffersize=0
					for((i=0; i<${#wordarray[@]}; i++)); do
						currentword=${wordarray[$i]}
						for((j=$minimum; j<=$maximum; j++)); do
							zero="";
							for((z=0; z<${#minimum}-${#j}; z++)) do
								zero+="0"
							done 
							numbers=$zero$j
							buffer+=" $currentword$numbers"
							if [ $buffersize -eq $buffersizemax ]; then
								tr " " "\n" <<< $buffer >> $passlist
								buffer=""; buffersize=0
							fi
							let buffersize++
						done
					done; tr " " "\n" <<< $buffer >> $passlist; buffer=""
				;;
				3)
					if [[ ${#opinionarray[@]} == 1 ]]; then
						echo -e "\tbeginning & end:"
					elif [[ ${#opinionarray[@]} > 1 ]]; then
					echo -e "\tnumbers: beginning & end"
					fi
					(
					numbword=0
					numbnumber=0
					buffersize=0
					for((i=0; i<${#wordarray[@]}; i++)); do
						currentword=${wordarray[$i]}
						for((j=$minimum; j<=$maximum; j++)); do
							zero="";
							for((z=0; z<${#minimum}-${#j}; z++)) do
								zero+="0"
							done 
							numbers=$zero$j
							buffer+=" $numbers$currentword"
							buffer+=" $currentword$numbers"
							if [ $buffersize -eq $buffersizemax ]; then
								tr " " "\n" <<< $buffer >> $passlist
								buffer=""; buffersize=0
							fi
							let buffersize++
						done
					done; tr " " "\n" <<< $buffer >> $passlist; buffer=""
					) | echo -en "\n\tloading...\r" && echo -en "\tdone!                \r\n\n"
				;;
				4)
					if [[ ${#opinionarray[@]} == 1 ]]; then
						echo -e "\tfor both side:"
					elif [[ ${#opinionarray[@]} > 1 ]]; then
						echo -e "\tnumbers: for both side"
					fi
					(
					numbword=0
					numbnumber=0
					buffersize=0
					for((i=0; i<${#wordarray[@]}; i++)); do
						currentword=${wordarray[$i]}
						for((j=$minimum; j<=$maximum; j++)); do
							zero="";
							for((z=0; z<${#minimum}-${#j}; z++)) do
								zero+="0"
							done 
							numbers=$zero$j
							buffer+=" $numbers$currentword$numbers"
							if [ $buffersize -eq $buffersizemax ]; then
								tr " " "\n" <<< $buffer >> $passlist
								buffer=""; buffersize=0
							fi
							let buffersize++
						done
					done; tr " " "\n" <<< $buffer >> $passlist; buffer=""
					) | echo -en "\n\tloading...\r" && echo -en "\tdone!                \r\n\n"
				;;
				5)
					if [[ ${#opinionarray[@]} == 1 ]]; then
						echo -e "\tall of them:"
					elif [[ ${#opinionarray[@]} > 1 ]]; then
						echo -e "\tnumbers: all of them"
					fi
					(
					numbword=0
					numbnumber=0
					buffersize=0
					for((i=0; i<${#wordarray[@]}; i++)); do
						currentword=${wordarray[$i]}
						for((j=$minimum; j<=$maximum; j++)); do
							zero="";
							for((z=0; z<${#minimum}-${#j}; z++)) do
								zero+="0"
							done 
							numbers=$zero$j
							buffer+=" $numbers$currentword"
							buffer+=" $numbers$currentword$numbers"
							buffer+=" $currentword$numbers"
							if [ $buffersize -eq $buffersizemax ]; then
								tr " " "\n" <<< $buffer >> $passlist
								buffer=""; buffersize=0
							fi
							let buffersize++
						done
					done; tr " " "\n" <<< $buffer >> $passlist; buffer=""
					) | echo -en "\n\tloading...\r" && echo -en "\tdone!                \r\n\n"
				;;
				*)
					echo -e "\tERROR: wrong choice for $how"; how=0
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
			if [[ ${#opinionarray[@]} == 1 ]]; then
				echo -e "\n\tspecial:\n"
				if [[ $how == "" ]]; then
					echo -e "\tset for:\n\t[0] go back\n\t[1] beginning\n\t[2] end\n\t[3] beginning & end\n\t[4] for both side\n\t[5] all of them"
				fi
			fi
			if [[ $how == "" ]]; then
				read how
			fi
			if [[ $how == "" ]]; then
				echo -e "\tERROR: wrong choice"
				how=0
			fi
			case $how in
			0);;
			1)
				if [[ ${#opinionarray[@]} == 1 ]]; then
					echo -e "\tbeginning:"
				elif [[ ${#opinionarray[@]} == 1 ]]; then
					echo -e "\n\tspecial:  beginning"
				fi
				(
				numbword=0
				numbspecial=0
				for((i=0; i<${#wordarray[@]}; i++)); do
					currentword=${wordarray[$i]}
					for((j=0; j<${#special[@]}; j++)); do
						specials=${special[$j]}
						tr " " "\n" <<< "$specials$currentword $j" >> $passlist
					done
				done
				) | echo -en "\n\tloading...\r" && echo -en "\tdone!                \r\n\n"
			;;
			2)
				if [[ ${#opinionarray[@]} == 1 ]]; then
					echo -e "\tend:"
				elif [[ ${#opinionarray[@]} > 1 ]]; then
					echo -e "\n\tspecial: end"
				fi
				(
				numbword=0
				numbspecial=0
				for((i=0; i<${#wordarray[@]}; i++)); do
					currentword=${wordarray[$i]}
					for((j=0; j<${#special[@]}; j++)); do
						specials=${special[$j]}
						tr " " "\n" <<< "$currentword$specials" >> $passlist
					done
				done
				) | echo -en "\n\tloading...\r" && echo -en "\tdone!                \r\n\n"
			;;
			3)
				if [[ ${#opinionarray[@]} == 1 ]]; then
					echo -e "\tbeginning & end:"
				elif [[ ${#opinionarray[@]} > 1 ]]; then
					echo -e "\n\tspecial: beginning & end"
				fi
				(
				numbword=0
				numbspecial=0
				for((i=0; i<${#wordarray[@]}; i++)); do
					currentword=${wordarray[$i]}
					for((j=0; j<${#special[@]}; j++)); do
						specials=${special[$j]}
						tr " " "\n" <<< "$specials$currentword" >> $passlist
						tr " " "\n" <<< "$currentword$specials" >> $passlist
					done
				done
				) | echo -en "\n\tloading...\r" && echo -en "\tdone!                \r\n\n"
			;;
			4)
				if [[ ${#opinionarray[@]} == 1 ]]; then
					echo -e "\tfor both side:"
				elif [[ ${#opinionarray[@]} > 1 ]]; then
					echo -e "\n\tspecial: for both side"
				fi
				(
				numbword=0
				numbspecial=0
				for((i=0; i<${#wordarray[@]}; i++)); do
					currentword=${wordarray[$i]}
					for((j=0; j<${#special[@]}; j++)); do
						specials=${special[$j]}
						tr " " "\n" <<< "$specials$currentword$specials" >> $passlist
					done
				done
				) | echo -en "\n\tloading...\r" && echo -en "\tdone!                \r\n\n"
			;;
			5)
				if [[ ${#opinionarray[@]} == 1 ]]; then
					echo -e "\tall of them:"
				elif [[ ${#opinionarray[@]} > 1 ]]; then
					echo -e "\n\tspecial: all of them"
				fi
				(
				numbword=0
				numbspecial=0
				for((i=0; i<${#wordarray[@]}; i++)); do
					currentword=${wordarray[$i]}
					for((j=0; j<${#special[@]}; j++)); do
						specials=${special[$j]}
						tr " " "\n" <<< "$specials$currentword" >> $passlist
						tr " " "\n" <<< "$specials$currentword$specials" >> $passlist
						tr " " "\n" <<< "$currentword$specials" >> $passlist
					done
				done
				) | echo -en "\n\tloading...\r" && echo -en "\tdone!                \r\n\n"
			;;
			*)
				echo -e "\tERROR: wrong choice for $how"; how=0
			;;
			esac
		;;
		5)
			if [[ $someword == "" ]]; then
			echo -e "\tadd some words for all:"; read someword
			fi
			if [[ $someword == "" ]]; then
				echo -e "\tERROR: input text not found"
				opinion=""
			else
			some=($someword)
			if [[ ${#opinionarray[@]} == 1 ]]; then
				echo -e "\tadd some words for all:"
				if [[ $how == "" ]]; then
					echo -e "\tset for:\n\t[0] go back\n\t[1] beginning\n\t[2] end\n\t[3] beginning & end\n\t[4] for both side\n\t[5] all of them"
				fi
			fi
			if [[ $how == "" ]]; then
				read how
			fi
			if [[ $how == "" ]]; then
				echo -e "\tERROR: wrong choice"
				how=0
			fi
			case $how in
			0);;
			1)
				if [[ ${#opinionarray[@]} == 1 ]]; then
					echo -e "\tbeginning:"
				elif [[ ${#opinionarray[@]} > 1 ]]; then
					echo -e "\tadd some words for all: beginning"
				fi
				(
				numbword=0
				numbsome=0
				for((i=0; i<${#wordarray[@]}; i++)); do
					currentword=${wordarray[$i]}
					for((j=0; j<${#some[@]}; j++)); do
						somes=${some[$j]}
						tr " " "\n" <<< "$somes$currentword" >> $passlist
					done
				done
				) | echo -en "\n\tloading...\r" && echo -en "\tdone!                \r\n\n"
			;;
			2)
				if [[ ${#opinionarray[@]} == 1 ]]; then
					echo -e "\tend:"
				elif [[ ${#opinionarray[@]} > 1 ]]; then
					echo -e "\tadd some words for all:  end"
				fi
				(
				numbword=0
				numbsome=0
				for((i=0; i<${#wordarray[@]}; i++)); do
					currentword=${wordarray[$i]}
					for((j=0; j<${#some[@]}; j++)); do
						somes=${some[$j]}
						tr " " "\n" <<< "$currentword$somes" >> $passlist
					done
				done
				) | echo -en "\n\tloading...\r" && echo -en "\tdone!                \r\n\n"
			;;
			3)
				if [[ ${#opinionarray[@]} == 1 ]]; then
					echo -e "\tbeginning & end:"
				elif [[ ${#opinionarray[@]} > 1 ]]; then
					echo -e "\tadd some words for all: beginning & end"
				fi
				(
				numbword=0
				numbsome=0
				for((i=0; i<${#wordarray[@]}; i++)); do
					currentword=${wordarray[$i]}
					for((j=0; j<${#some[@]}; j++)); do
						somes=${some[$j]}
						tr " " "\n" <<< "$somes$currentword" >> $passlist
						tr " " "\n" <<< "$currentword$somes" >> $passlist
					done
				done
				) | echo -en "\n\tloading...\r" && echo -en "\tdone!                \r\n\n"
			;;
			4)
				if [[ ${#opinionarray[@]} == 1 ]]; then
					echo -e "\tfor both side:"
				elif [[ ${#opinionarray[@]} > 1 ]]; then
					echo -e "\tadd some words for all:  for both side"
				fi
				(
				numbword=0
				numbsome=0
				for((i=0; i<${#wordarray[@]}; i++)); do
					currentword=${wordarray[$i]}
					for((j=0; j<${#some[@]}; j++)); do
						somes=${some[$j]}
						tr " " "\n" <<< "$somes$currentword$somes" >> $passlist
					done
				done
				) | echo -en "\n\tloading...\r" && echo -en "\tdone!                \r\n\n"
			;;
			5)
				if [[ ${#opinionarray[@]} == 1 ]]; then
					echo -e "\tall of them:"
				elif [[ ${#opinionarray[@]} > 1 ]]; then
					echo -e "\tadd some words for all: all of them"
				fi
				(
				numbword=0
				numbsome=0
				for((i=0; i<${#wordarray[@]}; i++)); do
					currentword=${wordarray[$i]}
					for((j=0; j<${#some[@]}; j++)); do
						somes=${some[$j]}
						tr " " "\n" <<< "$somes$currentword" >> $passlist
						tr " " "\n" <<< "$somes$currentword$somes" >> $passlist
						tr " " "\n" <<< "$currentword$somes" >> $passlist
					done
				done
				) | echo -en "\n\tloading...\r" && echo -en "\tdone!                \r\n\n"
			;;
			*)
				echo -e "\tERROR: wrong choice for $how"; how=0
			;;
			esac
			fi
		;;
		6)
			if [[ ${#opinionarray[@]} -ge 1 ]] ; then
				echo -e "\tremove equal words & sort:"
			fi
			(
			echo $(sort $passlist | uniq -u) > $passlist
			sed 's/ /\n/g' -i $passlist
			) | echo -en "\n\tloading...\r" && echo -en "\tdone!                \r\n\n"
		;;
		esac
	done
done
exit 0
