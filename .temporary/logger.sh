_U="$(id -u -nr)"
_UID="$(id -u -r)"
_G="$(id -g -nr)"
_GID="$(id -g -r)"
#readonly SCRIPT_NAME="$sn"
SCRIPT_NAME="unnamed.log"
sn="$0"
if [[ ${sn:0:1} == "-" ]] ; then SCRIPT_NAME="${sn:1}"; fi
ARGS=("$@")
LOG_DIR="$SD/logs" && mkdir -p $LOG_DIR
LOG_FILE="$LOG_DIR/$SCRIPT_NAME.log" && touch $LOG_FILE
START_LENGTH="$(cat $LOG_FILE|wc -l;)"
function numl { cat $LOG_FILE|wc -l; }
function dfmt { date "+%Y-%m-%d_%H.%M.%S%s"; }
function logl { local __args=("$@") && echo "[ $(dfmt) ] ${__args[*]}" >> $LOG_FILE; }
function l 
{ 
	
	local __sl="$(cat $LOG_FILE|wc -l)"
	local __args=("$@")
	echo "[ $(dfmt) ] ${__args[*]}" >> $LOG_FILE
	local __el="$(cat $LOG_FILE|wc -l)"
	cat $LOG_FILE | tail -n -"$(( __el - __sl ))"
}
function show { local END_LENGTH="$(cat $LOG_FILE|wc -l)" && cat $LOG_FILE | tail -n -"$(( END_LENGTH - START_LENGTH ))"; }
function info { echo "#To view the output:" && echo -e "\tcat $LOG_FILE"; }
logl "$_U:$_UID $_G:$_GID"
logl "$SCRIPT_NAME ${ARGS[*]}"
#logl "RUNNING $SCRIPT_NAME"
