# ls after cd
function cd() {
    builtin cd "$@" && ls -a;
}
