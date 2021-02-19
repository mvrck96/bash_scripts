TODAY=`date '+%d.%m.%Y'`
is_sem=0
is_lec=0

CURRENT=`pwd`
BASENAME=`basename "$CURRENT"`
NAME="${BASENAME}_${TODAY}.md"

declare -A SUBJECT_DICT=(["English"]="Английский язык"
                         ["Inf_processing"]="Обработка информации"
                         ["Mat_models"]="Мат модели"
                         ["ML2"]="ML2"
                         ["Product"]="Аналитика ИТ продуктов"
                         ["lecture_maker_script"]="Все правильно !"
                         ["Web"]="Web технологии")

SUBJECT=${SUBJECT_DICT[$BASENAME]}

if [[ ! -e $NAME ]]
then
  if [[ $# -ne 0 ]]
  then
    case $1 in
      l|lec) is_lec=1 ;;
      s|sem) is_sem=1 ;;
    esac
  else
    echo -e "No args supplied \U1F974 --> Creating lection note \U1F4D1"
    echo -e "# ${SUBJECT} лекция ${TODAY}\n" > $NAME
  fi

  if [[ $is_lec -eq 1 ]]
  then
    echo -e "Creating lection note \U1F4D1"
    echo -e "# ${SUBJECT} лекция ${TODAY}\n" > $NAME
  elif [[ $is_sem -eq 1 ]]
  then
    echo -e "Creating seminar note \U1F4C3"
    echo -e "# ${SUBJECT} семинар ${TODAY}\n" > $NAME
  fi

else
  echo "File already exists --> opening it"
fi

typora $NAME & exit
