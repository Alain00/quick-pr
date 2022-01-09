function gh_guess_base_branch() {
  command git rev-parse --git-dir &>/dev/null || return
  local current=`command git symbolic-ref --short HEAD`
  local develop
  local staging
  local master

  for branch in dev develop devel; do
    if command git show-ref -q --verify refs/heads/$branch; then
      develop=$branch
      break
    fi
  done

  for branch in stag staging stg; do
    if command git show-ref -q --verify refs/heads/$branch; then
      staging=$branch
      break
    fi
  done


  for branch in main trunk master; do
    if command git show-ref -q --verify refs/heads/$branch; then
      master=$branch
      break
    fi
  done

  if [[ $current == release* ]]; then
    echo $master
    return
  fi
  
  if [[ "${current}" == "${develop}" ]]; then
    if [[ $staging == "" ]]; then
      echo $master
    else
      echo $staging
    fi
    return
  fi

  if [[ "${current}" == "${staging}" ]]; then
    echo $master
    return
  fi

  echo $develop
}

function gh_get_label_by_short() {
  local short=$1
  case $short in
    'feat') echo 'enhancement';;
    'fix') echo 'bug';;
    'doc') echo 'documentation';;
    *) echo '';;
  esac
}

function gh_guess_pr_label() {
  command git rev-parse --git-dir &>/dev/null || return
  local current=`command git symbolic-ref --short HEAD`
  for short in feat fix doc; do
    if [[ $current == $short* ]]; then
      echo `gh_get_label_by_short $short`
      return
    fi
  done

  echo ''
}

function ghpr() {
  command gh pr create --base=`gh_guess_base_branch` -a=@me --fill --label=`gh_guess_pr_label` $1
}