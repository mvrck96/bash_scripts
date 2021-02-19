TODAY=`date '+%d.%m.%y'`
LECTION_FLAG=0
NAME="initial_name"

CURRENT=`pwd`
BASENAME=`basename "$CURRENT"`

declare -A SUBJECT_DICT=(["English"]="Английский язык"
                         ["Inf_processing"]="Обработка информации"
                         ["Mat_models"]="Мат модели"
                         ["ML2"]="ML2"
                         ["Product"]="Аналитика ИТ продуктов"
                         ["lecture_maker_script"]="Все правильно !"
                         ["Web"]="Web технологии")

SUBJECT=${SUBJECT_DICT[$BASENAME]}

if [[ $# -ne 0 ]]
then
  case $1 in
    l|lec) LECTION_FLAG=1
    NAME="${BASENAME}_lec_${TODAY}.md"
    ;;
    s|sem) LECTION_FLAG=0
    NAME="${BASENAME}_sem_${TODAY}.md"
    ;;
  esac
else
  LECTION_FLAG=1
  NAME="${BASENAME}_lec_${TODAY}.md"
  echo -e "No args supplied \U1F974"
fi

if [[ ! -e $NAME ]]
then
  if [[ $LECTION_FLAG -eq 1 ]]
  then
    echo -e "Creating lection note \U1F4D1"
    echo -e "# ${SUBJECT} лекция ${TODAY}\n" > $NAME
  else
    echo -e "Creating seminar note \U1F4C3"
    echo -e "# ${SUBJECT} семинар ${TODAY}\n" > $NAME
  fi
else
  echo -e "File already exists --> opening it \U1F4E6"
fi

typora $NAME & exit
