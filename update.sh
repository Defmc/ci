#!/bin/sh
# Update or add the CI workflow in the listed packages by file. Allows to use a patch file named `.circleci/flowpatch`
# Arguments:
# - 1: CI workflow on this repository
# - 2: File with user/repo format

while read -r repo; do
  [ -d "tmp_repo" ] && rm -rf tmp_repo
  echo "getting $repo to update $1 workflow"
  git clone "https://github.com/$repo" tmp_repo
  cd tmp_repo

  label="fix"
  work="update"

  if [ -f ".circleci/config.yml" ]; then
    rm ".circleci/config.yml"
  else
    label="feat"
    work="add"
    echo "creating .circleci directory"
    mkdir -p .circleci
  fi

  cp ../$1/config.yml .circleci/config.yml

  if [ -f ".circleci/flowpatch" ]; then
    echo "founded a flowpatch. Applying it..."
    git apply ".circleci/flowpatch"
    echo "patch applied"
  fi

  git add .circleci/config.yml
  git commit -m "[skip ci] $label(ci): $work workflow for $1 from Defmc/ci" .circleci/config.yml
  git push

  cd ..
  rm -rf tmp_repo
done <$2
