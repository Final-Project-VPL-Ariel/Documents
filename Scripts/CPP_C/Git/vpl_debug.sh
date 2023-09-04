#!/bin/bash
makecommand=test_debug
compilecommand="gcc file.c -o main"
bash pre_vpl_run.sh

make $makecommand
if [ $? -ne 0 ] ; then
	echo "Compilation failed"
	$compilecommand
	if [ $? -ne 0 ] ; then
		echo "Compilation failed"
		exit 1
	fi
fi


if [ -f test_debug ] ; then
	mv test_debug vpl_program
	cat common_script.sh > vpl_execution
	chmod +x vpl_execution
	if [ "$(command -v ddd)" == "" ] ; then
		check_program gdb
		echo "gdb vpl_program" >> vpl_execution
	else
		echo "ddd --quiet --gdb vpl_program &>/dev/null" >> vpl_execution
		mkdir .ddd &>/dev/null
		mkdir .ddd/sessions &>/dev/null
		mkdir .ddd/themes &>/dev/null
		cat >.ddd/init <<END_OF_FILE
Ddd*splashScreen: off
Ddd*startupTips: off
Ddd*suppressWarnings: on
Ddd*displayLineNumbers: on
Ddd*saveHistoryOnExit: off

! DO NOT ADD ANYTHING BELOW THIS LINE -- DDD WILL OVERWRITE IT
END_OF_FILE
		mv vpl_execution vpl_wexecution
	fi
fi