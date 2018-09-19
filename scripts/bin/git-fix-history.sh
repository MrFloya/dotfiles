#!/bin/sh

export EMAIL_OLD=$1
export EMAIL_NEW=$2
export NAME_NEW=$3

echo "$(basename $0)"
echo ""
echo -e "EMAIL_OLD\t=\t${EMAIL_OLD}"
echo -e "EMAIL_NEW\t=\t${EMAIL_NEW}"
echo -e "NAME_NEW\t=\t${NAME_NEW}"
echo ""
echo "Is this correct? [y/N]"

read answer

if [[ "$answer" == 'y' ]]; then
  git filter-branch --env-filter '
  if [ "$GIT_COMMITTER_EMAIL" = "$EMAIL_OLD" ]
  then
      export GIT_COMMITTER_NAME="$NAME_NEW"
      export GIT_COMMITTER_EMAIL="$EMAIL_NEW"
  fi
  if [ "$GIT_AUTHOR_EMAIL" = "$EMAIL_OLD" ]
  then
      export GIT_AUTHOR_NAME="$NAME_NEW"
      export GIT_AUTHOR_EMAIL="$EMAIL_NEW"
  fi
  ' --tag-name-filter cat -- --branches --tags
  echo "Done! Extiting.."
else
  echo "Aborting.."
fi
