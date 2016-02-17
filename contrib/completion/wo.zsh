#compdef wo

_wo() {
  local cmd
  if (( CURRENT > 2 )); then
    cmd=${words[2]}
    (( CURRENT-- ))
    shift words
    case "${cmd}" in
      activate|a|use|u)
        _wo_complete_environments
        ;;;
      create|c|new|n)
        local -a options
        options=("-t:The template for the new environment")
        case $words[2] in
          -t)
            _wo_complete_templates
            ;;;
        esac
        ;;
      rm|delete)
        _wo_complete_environments
        ;;
    esac
  else
    local -a subcommands
    subcommands=(
      "activate:Activate an environment"
      "create:Create a new environment"
      "current:Show the current environment"
      "ls:List environments"
      "rm:Remove an environment"
      "templates:List templates"
    )
    _describe -t commands 'wo' subcommands
    _arguments : "--help[Show help message]"
  fi
}

_wo_complete_templates() {
  _values -C 'templates' $(wo templates -s)
}

_wo_complete_environments() {
  _values -C 'environments' $(wo list)
}
