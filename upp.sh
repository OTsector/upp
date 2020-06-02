#!/bin/bash

alias ~=$HOME
bold=$(tput bold)
normal=$(tput sgr0)
banner="# ./07.dat\n\t\t ${bold}_\n\t0${normal}${bold}7${normal}\t[|] ${bold}0${normal}ffensive ${bold}7${normal}ester\n"
clear
text="# ./07.dat"
for((i=0; i<=${#text}; i++)); do
		printf "${text::$i}\r";
		if [ $i -lt $(($i/2)) ]; then
			sleep 0.2
		else
			sleep 0.1
		fi
done
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
if [ $# -gt 0 ]; then
	passlist=$1
fi
while true; do
	if [[ $passlist == "" ]]; then
		echo -e "\tERROR: input file directory\n"
	elif [ -d $passlist ]; then
		echo -e "\tERROR: this is directory name\n"
	elif ! touch "$passlist" &> /dev/null; then
		echo -e "\tERROR: can't create (can be a permission issue. try use \"sudo\")\n"
	fi
	if [ ${#passlist} -gt 0 ] && [ -f $passlist ]; then
		break
	fi
	echo -e "\t*select file location: [/root/Desktop/pass.list]"
	read passlist
done
buffersizemax=50000
echo -e "\ttype words: [facebook password qwerty 1996]"
read words
while [[ $words == "" ]]; do
	echo -e "\tERROR: the words are empty\n\n\ttype words: [facebook password qwerty 1996]"
	read words
done
wordarray=($words)
buffersize=0
for ((i=0; i<${#wordarray[@]}; i++)); do
		currentword=${wordarray[$i]}
		if [ $buffersize -eq 0 ]; then
			buffer+="$currentword"
		else
			buffer+="\n$currentword"
		fi
		if [ $buffersize -eq $buffersizemax ]; then
			echo -e $buffer >> $passlist
			buffer=""; buffersize=0
		fi
	let buffersize++
done; echo -e $buffer >> $passlist; buffer=""
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
	optionnotsinglearray=(1 2 3 4 5)
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
			echo -e "\tnumbers:"
		while [[ $minimum == "" ]]; do
			echo -en "set minimum: "; read minimum
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
			while [[ $someword == "" ]]; do
							echo -e "\tadd some words for all:"; read someword
				if [[ $someword == "" ]]; then
					echo -e "\tERROR: input some words is too important"
				else
					break
				fi
			done
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
				sed -e 's/a/4/g' -e 's/A/4/g' -e 's/e/3/g' -e 's/E/3/g' -e 's/g/9/g' -e 's/G/9/g' \
						-e 's/i/1/g' -e 's/I/1/g' -e 's/o/0/g' -e 's/O/0/g' -e 's/s/5/g' -e 's/S/5/g' \
						-e 's/t/7/g' -e 's/T/7/g' -e 's/z/2/g' -e 's/Z/2/g' <<< ${wordarray[@]} |tr " " "\n" >> $passlist
				) | echo -en "\n\tloading...\r" && echo -en "\tdone!                \r\n\n"
			;;
			2)
			if [[ ${#opinionarray[@]} > 1 ]]; then
				echo -e "\tleet mode: super mode"
			fi
				(
				sed -e 's/a/\/-\\/g' -e 's/A/\/-\\/g' -e 's/b/\|3/g' -e 's/B/\|3/g' \
						-e 's/c/\(/g' -e 's/C/\(/g' -e 's/d/\|\)/g' -e 's/D/\|\)/g' \
						-e 's/e/3/g' -e 's/E/3/g' -e 's/g/9/g' -e 's/G/9/g' \
						-e 's/h/\|-\|/g' -e 's/H/\|-\|/g' -e 's/i/1/g' -e 's/I/1/g' \
						-e 's/k/\|\</g' -e 's/k/\|\</g' -e 's/l/\|_/g' -e 's/L/\|_/g' \
						-e 's/m/\|V\|/g' -e 's/M/\|V\|/g' -e 's/n/\|\\\|/g' -e 's/N/\|\\\|/g' \
						-e 's/r/\|2/g' -e 's/R/\|2/g' -e 's/o/0/g' -e 's/O/0/g' \
						-e 's/s/5/g' -e 's/S/5/g' -e 's/t/7/g' -e 's/T/7/g' -e 's/u/\|_\|/g' \
						-e 's/u/\|_\|/g' -e 's/v/\\\//g' -e 's/V/\\\//g' -e 's/w/vv/g' -e 's/W/vv/g' \
						-e 's/x/\>\</g' -e 's/X/\>\</g' -e 's/z/2/g' -e 's/Z/2/g' <<< ${wordarray[@]} |tr " " "\n" >> $passlist
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
				tr " " "\n" <<< $(eval echo $(sed 's/./{\U&,\L&}/g' <<< $currentword)) >> $passlist
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
							if [ $buffersize -eq 0 ]; then
								buffer+="$numbers$currentword"
							else
								buffer+="\n$numbers$currentword"
							fi
							if [ $buffersize -eq $buffersizemax ]; then
								echo -e $buffer >> $passlist
								buffer=""; buffersize=0
							fi
							let buffersize++
						done
					done; echo -e $buffer >> $passlist; buffer=""
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
							if [ $buffersize -eq 0 ]; then
								buffer+="$currentword$numbers"
							else
								buffer+="\n$currentword$numbers"
							fi
							if [ $buffersize -eq $buffersizemax ]; then
								echo -e $buffer >> $passlist
								buffer=""; buffersize=0
							fi
							let buffersize++
						done
					done; echo -e $buffer >> $passlist; buffer=""
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
							if [ $buffersize -eq 0 ]; then
								buffer+="$numbers$currentword"
								buffer+="\n$currentword$numbers"
							else
								buffer+="\n$numbers$currentword"
								buffer+="\n$currentword$numbers"
							fi
							if [ $buffersize -eq $buffersizemax ]; then
								echo -e $buffer >> $passlist
								buffer=""; buffersize=0
							fi
							let buffersize++
						done
					done; echo -e $buffer >> $passlist; buffer=""
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
							if [ $buffersize -eq 0 ]; then
								buffer+="$numbers$currentword$numbers"
							else
								buffer+="\n$numbers$currentword$numbers"
							fi
							if [ $buffersize -eq $buffersizemax ]; then
								echo -e $buffer >> $passlist
								buffer=""; buffersize=0
							fi
							let buffersize++
						done
					done; echo -e $buffer >> $passlist; buffer=""
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
							for((z=0; z<${#minimum}-${#j}; z++)); do
								zero+="0"
							done
							numbers=$zero$j
							if [ $buffersize -eq 0 ]; then
								buffer+="$numbers$currentword"
								buffer+="\n$numbers$currentword$numbers"
								buffer+="\n$currentword$numbers"
							else
								buffer+="\n$numbers$currentword"
								buffer+="\n$numbers$currentword$numbers"
								buffer+="\n$currentword$numbers"
							fi
							if [ $buffersize -eq $buffersizemax ]; then
								echo -e $buffer >> $passlist
								buffer=""; buffersize=0
							fi
							let buffersize++
						done
					done; echo -e $buffer >> $passlist; buffer=""
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
				buffersize=0
				for((i=0; i<${#wordarray[@]}; i++)); do
					currentword=${wordarray[$i]}
					for((j=0; j<${#special[@]}; j++)); do
						specials=${special[$j]}
						if [ $buffersize -eq 0 ]; then
							buffer+="$specials$currentword"
						else
							buffer+="\n$specials$currentword"
						fi
						if [ $buffersize -eq $buffersizemax ]; then
							echo -e $buffer >> $passlist
							buffer=""; buffersize=0
						fi
						let buffersize++
					done
				done; echo -e $buffer >> $passlist; buffer=""
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
				buffersize=0
				for((i=0; i<${#wordarray[@]}; i++)); do
					currentword=${wordarray[$i]}
					for((j=0; j<${#special[@]}; j++)); do
						specials=${special[$j]}
						if [ $buffersize -eq 0 ]; then
							buffer+="$currentword$specials"
						else
							buffer+="\n$currentword$specials"
						fi
						if [ $buffersize -eq $buffersizemax ]; then
							echo -e $buffer >> $passlist
							buffer=""; buffersize=0
						fi
						let buffersize++
					done
				done; echo -e $buffer >> $passlist; buffer=""
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
				buffersize=0
				for((i=0; i<${#wordarray[@]}; i++)); do
					currentword=${wordarray[$i]}
					for((j=0; j<${#special[@]}; j++)); do
						specials=${special[$j]}
						if [ $buffersize -eq 0 ]; then
							buffer+="$specials$currentword"
							buffer+="\n$currentword$specials"
						else
							buffer+="\n$specials$currentword"
							buffer+="\n$currentword$specials"
						fi
						if [ $buffersize -eq $buffersizemax ]; then
							echo -e $buffer >> $passlist
							buffer=""; buffersize=0
						fi
						let buffersize++
					done
				done; echo -e $buffer >> $passlist; buffer=""
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
				buffersize=0
				for((i=0; i<${#wordarray[@]}; i++)); do
					currentword=${wordarray[$i]}
					for((j=0; j<${#special[@]}; j++)); do
						specials=${special[$j]}
						if [ $buffersize -eq 0 ]; then
							buffer+="$specials$currentword$specials"
						else
							buffer+="\n$specials$currentword$specials"
						fi
						if [ $buffersize -eq $buffersizemax ]; then
							echo -e $buffer >> $passlist
							buffer=""; buffersize=0
						fi
						let buffersize++
					done
				done; echo -e $buffer >> $passlist; buffer=""
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
				buffersize=0
				for((i=0; i<${#wordarray[@]}; i++)); do
					currentword=${wordarray[$i]}
					for((j=0; j<${#special[@]}; j++)); do
						specials=${special[$j]}
						if [ $buffersize -eq 0 ]; then
							buffer+="$specials$currentword"
							buffer+="\n$specials$currentword$specials"
							buffer+="\n$currentword$specials"
						else
							buffer+="\n$specials$currentword"
							buffer+="\n$specials$currentword$specials"
							buffer+="\n$currentword$specials"
						fi
						if [ $buffersize -eq $buffersizemax ]; then
							echo -e $buffer >> $passlist
							buffer=""; buffersize=0
						fi
						let buffersize++
					done
				done; echo -e $buffer >> $passlist; buffer=""
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
				elif [[ ${#opinionarray[@]} == 1 ]]; then
					echo -e "\n\tsome:  beginning"
				fi
				(
				numbword=0
				numbsome=0
				buffersize=0
				for((i=0; i<${#wordarray[@]}; i++)); do
					currentword=${wordarray[$i]}
					for((j=0; j<${#some[@]}; j++)); do
						somes=${some[$j]}
						if [ $buffersize -eq 0 ]; then
							buffer+="$somes$currentword"
						else
							buffer+="\n$somes$currentword"
						fi
						if [ $buffersize -eq $buffersizemax ]; then
							echo -e $buffer >> $passlist
							buffer=""; buffersize=0
						fi
						let buffersize++
					done
				done; echo -e $buffer >> $passlist; buffer=""
				) | echo -en "\n\tloading...\r" && echo -en "\tdone!                \r\n\n"
			;;
			2)
				if [[ ${#opinionarray[@]} == 1 ]]; then
					echo -e "\tend:"
				elif [[ ${#opinionarray[@]} > 1 ]]; then
					echo -e "\n\tsome: end"
				fi
				(
				numbword=0
				numbsome=0
				buffersize=0
				for((i=0; i<${#wordarray[@]}; i++)); do
					currentword=${wordarray[$i]}
					for((j=0; j<${#some[@]}; j++)); do
						somes=${some[$j]}
						if [ $buffersize -eq 0 ]; then
							buffer+="$currentword$somes"
						else
							buffer+="\n$currentword$somes"
						fi
						if [ $buffersize -eq $buffersizemax ]; then
							echo -e $buffer >> $passlist
							buffer=""; buffersize=0
						fi
						let buffersize++
					done
				done; echo -e $buffer >> $passlist; buffer=""
				) | echo -en "\n\tloading...\r" && echo -en "\tdone!                \r\n\n"
			;;
			3)
				if [[ ${#opinionarray[@]} == 1 ]]; then
					echo -e "\tbeginning & end:"
				elif [[ ${#opinionarray[@]} > 1 ]]; then
					echo -e "\n\tsome: beginning & end"
				fi
				(
				numbword=0
				numbsome=0
				buffersize=0
				for((i=0; i<${#wordarray[@]}; i++)); do
					currentword=${wordarray[$i]}
					for((j=0; j<${#some[@]}; j++)); do
						somes=${some[$j]}
						if [ $buffersize -eq 0 ]; then
							buffer+="$somes$currentword"
							buffer+="\n$currentword$somes"
						else
							buffer+="\n$somes$currentword"
							buffer+="\n$currentword$somes"
						fi
						if [ $buffersize -eq $buffersizemax ]; then
							echo -e $buffer >> $passlist
							buffer=""; buffersize=0
						fi
						let buffersize++
					done
				done; echo -e $buffer >> $passlist; buffer=""
				) | echo -en "\n\tloading...\r" && echo -en "\tdone!                \r\n\n"
			;;
			4)
				if [[ ${#opinionarray[@]} == 1 ]]; then
					echo -e "\tfor both side:"
				elif [[ ${#opinionarray[@]} > 1 ]]; then
					echo -e "\n\tsome: for both side"
				fi
				(
				numbword=0
				numbsome=0
				buffersize=0
				for((i=0; i<${#wordarray[@]}; i++)); do
					currentword=${wordarray[$i]}
					for((j=0; j<${#some[@]}; j++)); do
						somes=${some[$j]}
						if [ $buffersize -eq 0 ]; then
							buffer+="$somes$currentword$somes"
						else
							buffer+="\n$somes$currentword$somes"
						fi
						if [ $buffersize -eq $buffersizemax ]; then
							echo -e $buffer >> $passlist
							buffer=""; buffersize=0
						fi
						let buffersize++
					done
				done; echo -e $buffer >> $passlist; buffer=""
				) | echo -en "\n\tloading...\r" && echo -en "\tdone!                \r\n\n"
			;;
			5)
				if [[ ${#opinionarray[@]} == 1 ]]; then
					echo -e "\tall of them:"
				elif [[ ${#opinionarray[@]} > 1 ]]; then
					echo -e "\n\tsome: all of them"
				fi
				(
				numbword=0
				numbsome=0
				buffersize=0
				for((i=0; i<${#wordarray[@]}; i++)); do
					currentword=${wordarray[$i]}
					for((j=0; j<${#some[@]}; j++)); do
						somes=${some[$j]}
						if [ $buffersize -eq 0 ]; then
							buffer+="$somes$currentword"
							buffer+="\n$somes$currentword$somes"
							buffer+="\n$currentword$somes"
						else
							buffer+="\n$somes$currentword"
							buffer+="\n$somes$currentword$somes"
							buffer+="\n$currentword$somes"
						fi
						if [ $buffersize -eq $buffersizemax ]; then
							echo -e $buffer >> $passlist
							buffer=""; buffersize=0
						fi
						let buffersize++
					done
				done; echo -e $buffer >> $passlist; buffer=""
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
			sort $passlist | uniq -u > $passlist".bak"; mv $passlist".bak" $passlist
			) | echo -en "\n\tloading...\r" && echo -en "\tdone!                \r\n\n"
		;;
		esac
	done
done
exit 0
