#compdef vvv

_vvv() {
  local cmd
  if (( CURRENT > 2 )); then
    cmd=${words[2]}
    (( CURRENT-- ))
    shift words
    case "${cmd}" in
      activate|a|use|u)
        _vvv_complete_environments
        ;;;
      create|c|new|n)
        local -a options
        options=("-t:The template for the new environment")
        case $words[2] in
          -t)
            _vvv_complete_templates
            ;;;
        esac
        ;;
      rm|delete)
        _vvv_complete_environments
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
    _describe -t commands 'vvv' subcommands
    _arguments : "--help[Show help message]"
  fi
}

_vvv_complete_templates() {
  _values -C 'templates' $(vvv templates -s)
}

_vvv_complete_environments() {
  _values -C 'environments' $(vvv list)
}
