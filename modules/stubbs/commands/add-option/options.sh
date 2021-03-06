# Generated by stubbs:add-option. Do not edit, if using stubbs.
# Created: Thu Oct  5 18:49:14 CDT 2017
#
#/ usage: stubbs:add-option [ --arg <true>]  --command|-c <> [ --default|-d <>]  --description <> [ --export <false>] [ --long <>]  --module|-m <>  --option|-o <> [ --required <false>] [ --short <>] 

# _rerun_options_parse_ - Parse the command arguments and set option variables.
#
#     rerun_options_parse "$@"
#
# Arguments:
#
# * the command options and their arguments
#
# Notes:
#
# * Sets shell variables for any parsed options.
# * The "-?" help argument prints command usage and will exit 2.
# * Return 0 for successful option parse.
#
rerun_options_parse() {
  
    unrecognized_args=()

    while (( "$#" > 0 ))
    do
        OPT="$1"
        case "$OPT" in
            --arg) rerun_option_check $# $1; ARG=$2 ; shift 2 ;;
            --command|-c) rerun_option_check $# $1; COMMAND=$2 ; shift 2 ;;
            --default|-d) rerun_option_check $# $1; DEFAULT=$2 ; shift 2 ;;
            --description) rerun_option_check $# $1; DESCRIPTION=$2 ; shift 2 ;;
            --export) rerun_option_check $# $1; EXPORT=$2 ; shift 2 ;;
            --long) rerun_option_check $# $1; LONG=$2 ; shift 2 ;;
            --module|-m) rerun_option_check $# $1; MODULE=$2 ; shift 2 ;;
            --option|-o) rerun_option_check $# $1; OPTION=$2 ; shift 2 ;;
            --required) rerun_option_check $# $1; REQUIRED=$2 ; shift 2 ;;
            --short) rerun_option_check $# $1; SHORT=$2 ; shift 2 ;;
            # help option
            -\?|--help)
                rerun_option_usage
                exit 2
                ;;
            # unrecognized arguments
            *)
              unrecognized_args+=("$OPT")
              shift
              ;;
        esac
    done

    # Set defaultable options.
    [[ -z "$ARG" ]] && ARG="$(rerun_property_get $RERUN_MODULE_DIR/options/arg DEFAULT)"
    [[ -z "$EXPORT" ]] && EXPORT="$(rerun_property_get $RERUN_MODULE_DIR/options/export DEFAULT)"
    [[ -z "$REQUIRED" ]] && REQUIRED="$(rerun_property_get $RERUN_MODULE_DIR/options/required DEFAULT)"
    # Check required options are set
    [[ -z "$COMMAND" ]] && { echo >&2 "missing required option: --command" ; return 2 ; }
    [[ -z "$DESCRIPTION" ]] && { echo >&2 "missing required option: --description" ; return 2 ; }
    [[ -z "$MODULE" ]] && { echo >&2 "missing required option: --module" ; return 2 ; }
    [[ -z "$OPTION" ]] && { echo >&2 "missing required option: --option" ; return 2 ; }
    # If option variables are declared exportable, export them.

    # Make unrecognized command line options available in $_CMD_LINE
    if [ ${#unrecognized_args[@]} -gt 0 ]; then
      export _CMD_LINE="${unrecognized_args[@]}"
    fi
    #
    return 0
}


# If not already set, initialize the options variables to null.
: ${ARG:=}
: ${COMMAND:=}
: ${DEFAULT:=}
: ${DESCRIPTION:=}
: ${EXPORT:=}
: ${LONG:=}
: ${MODULE:=}
: ${OPTION:=}
: ${REQUIRED:=}
: ${SHORT:=}
# Default command line to null if not set
: ${_CMD_LINE:=}
