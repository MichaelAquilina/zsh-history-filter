export HISTORY_FILTER_VERSION="0.1.0"

function zshaddhistory() {
    for value in $HISTORY_EXCLUDE; do
        if [[ "$1" = *"$value"* ]]; then
            if [[ -n "$HISTORY_FILTER_DEBUG" ]]; then
                printf "Excluding result from history\n"
            fi
            return 2
        fi
    done
    return 0
}
