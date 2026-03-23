function fish_prompt -d "Write out the prompt"
    # This shows up as USER@HOST /home/user/ >, with the directory colored
    # $USER and $hostname are set by fish, so you can just use them
    # instead of using `whoami` and `hostname`
    printf '%s@%s %s%s%s > ' $USER $hostname \
        (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
end

if status is-interactive # Commands to run in interactive sessions can go here

    # No greeting

    set fish_greeting
    if status is-interactive

    set_color ff5f57;  echo "    /\_____/\\"
    set_color febc2e;  echo "   /  o   o  \\"
    set_color 28c840;  echo "  ( ==  ^  == )"
    set_color 1793d1;  echo "   )         ("
    set_color c678dd;  echo "  (           )"
    set_color 2ec4b6;  echo " ( (  )   (  ) )"
    set_color f4a261;  echo "(__(__)___(__)__)"
    set_color normal

    end
    
    # Use starship
    starship init fish | source
    if test -f ~/.local/state/quickshell/user/generated/terminal/sequences.txt
        cat ~/.local/state/quickshell/user/generated/terminal/sequences.txt
    end

    # Aliases
    alias clear "printf '\033[2J\033[3J\033[1;1H'" # fix: kitty doesn't clear properly
    alias celar "printf '\033[2J\033[3J\033[1;1H'"
    alias claer "printf '\033[2J\033[3J\033[1;1H'"
    alias ls 'eza --icons'
    alias pamcan pacman
    alias q 'qs -c noctalia-shell'
    alias update 'sudo pacman -Syu && yay'
    alias nuke 'pkill -9 -f'
end
