function git-branch() {
    BRANCH=$1
    if [[ "$BRANCH" =~ ^feature/f-*|^hotfix/h-* ]]; then
        git-pull
        git-clean
        git branch $BRANCH
        git push --set-upstream origin $BRANCH
        git checkout $BRANCH
        clear
        git branch
        
        return
    fi
    
    echo 'branch name must be in one of the following patterns: '
    echo 'feature/f-{description}'
    echo 'hotfix/h-{description}'
}
 
function git-pull() {
    git checkout master
    git reset --hard
    git clean -df
    git pull
}
 
function git-clean() {
    git checkout master
    git branch --merged | grep -v "\*" | grep -v "master" | grep -v "develop" | grep -v "staging" | xargs -n 1 git branch -d
}

function gc() {
  git add .
  git commit -m "$1"
  git push
}

function gb() {
  git-branch $1
}

alias gs='git status'

cd E:/Git/
