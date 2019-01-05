export HISTORY_FILTER_VERSION="0.3.0"

function _history_filter() {
    for value in $HISTORY_FILTER_EXCLUDE; do
        if [[ "$1" = *"$value"* ]]; then
            if [[ -z "$HISTORY_FILTER_SILENT" ]]; then
                (>&2 printf "Excluding command from history\n")
            fi
            return 2
        fi
    done

    return 0
}

autoload -Uz add-zsh-hook
add-zsh-hook zshaddhistory _history_filter
