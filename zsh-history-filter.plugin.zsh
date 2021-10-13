export HISTORY_FILTER_VERSION="0.4.1"

# overwrite the history file so that it
# retro-actively applies the currently set filters
function rewrite_history() {
    local new_history="$HISTFILE.bak"
    local excluded=0

    cat $HISTFILE | while read entry; do
        # TODO: Doing this per line is very slow!
        local command="$(echo "$entry" | cut -d ';' -f2-)"

        if ! _matches_filter "$command"; then
            echo "$entry" >> "$new_history"
        else
            ((excluded = excluded + 1))
            printf "\rExcluded $excluded entries"
        fi
    done
    printf "\n"
    mv "$new_history" "$HISTFILE"
}


function _matches_filter() {
    local value
    for value in $HISTORY_FILTER_EXCLUDE; do
        if [[ "$1" =~ $value ]]; then
            return 0
        fi
    done
    return 1
}


function _history_filter() {
    if _matches_filter "$1"; then
        if [[ -z "$HISTORY_FILTER_SILENT" ]]; then
            (>&2 printf "Excluding command from history\n")
            echo pty-driver "off"
        fi
        return 2
    else
        return 0
    fi
}

autoload -Uz add-zsh-hook
add-zsh-hook zshaddhistory _history_filter
