export HISTORY_FILTER_VERSION="0.1.0"

function _filter_history() {
    for value in $HISTORY_FILTER_EXCLUDE; do
        if [[ "$1" = *"$value"* ]]; then
            if [[ -z "$HISTORY_FILTER_SILENT" ]]; then
                printf "Excluding result from history\n"
            fi
            return 2
        fi
    done

    return 0
}

autoload -Uz add-zsh-hook
add-zsh-hook zshaddhistory _filter_history
