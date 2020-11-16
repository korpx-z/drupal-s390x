set -e

export ANSI_YELLOW="\e[1;33m"
export ANSI_GREEN="\e[32m"
export ANSI_RESET="\e[0m"

echo -e "\n $ANSI_YELLOW *** testing docker run - drupal *** $ANSI_RESET \n"

echo -e "$ANSI_YELLOW test drupal instance via front-end: $ANSI_RESET"

docker run --name some-drupal -p 8080:80 -d quay.io/ibmz/drupal-s390x:9.0
curl localhost:8080

echo -e "\n $ANSI_GREEN *** TEST COMPLETED SUCESSFULLY *** $ANSI_RESET \n"


