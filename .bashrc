function emulator() {
    F:/SDK/tools/emulator -avd Pixel -no-boot-anim &
}

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
    git checkout develop
    git reset --hard
    git clean -df
    git pull
}
 
function git-clean() {
    git checkout develop
    git branch --merged | grep -v "\*" | grep -v "master" | grep -v "develop" | grep -v "staging" | xargs -n 1 git branch -d
}

cd F:/
