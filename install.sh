#!/usr/bin/env bash
backup_dir="$HOME/Desktop/backup"
config_files=$(find . -maxdepth 1 -type d ! \( -name ".git" -o -name "." -o -name ".vim" -o -name "assets" \) -printf "%P ")
home_files=$(find . -maxdepth 1 \( -type f -o -type d \) \( -name "redshift.conf" -o -name ".vim*" -o -name ".profile" -o -name ".bashrc" -o -name ".bash_aliases" -o -name ".zshrc" -o -name ".zsh_aliases" \) -printf "%P ")

create_backup() {
	local i=0
	read -ra temp_config <<< "$config_files"
	read -ra temp_home <<< "$home_files"
	backup_config_files=()
	backup_home_files=()

	for file in "${temp_config[@]}"; do
		backup_config_files+=("$HOME/.config/$file")
	done
	for file in "${temp_home[@]}"; do
		backup_home_files+=("$HOME/$file")
	done
	while [[ -d $backup_dir/$i ]]; do
		((++i))
	done
	mkdir -p $backup_dir/$i/.config
	printf "Creating backup in %s...\n" "$backup_dir/$i"

	cp -r ${backup_config_files[@]} $backup_dir/$i/.config > /dev/null 2>&1
	cp -r ${backup_home_files[@]} $backup_dir/$i > /dev/null 2>&1
	printf "Created successfully!\n"
}

install_dotfiles() {
	printf "Installing dotfiles...\n"
	mkdir -p $HOME/.config/
	mkdir -p $HOME/Pictures/Screenshots/
	cp -r $config_files $HOME/.config
	cp -r $home_files $HOME
	printf "Installed successfully!\n"
}

install_requirements() {
	sudo apt update && sudo apt upgrade -y
	sudo apt install -y curl dunst feh i3 i3blocks maim picom playerctl xclip xdotool rofi redshift caffeine fd-find ripgrep fzf unzip

	# Install zoxide (https://github.com/ajeetdsouza/zoxide#installation)
	curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

	# Install Zen Browser
	local opt_dir="$HOME/opt"
	mkdir -p "$opt_dir"

	wget -P "$opt_dir" https://github.com/zen-browser/desktop/releases/latest/download/zen.linux-x86_64.tar.xz
	tar -C "$opt_dir" -xvf "$opt_dir"/zen.linux-x86_64.tar.xz
	rm "$opt_dir"/zen.linux-x86_64.tar.xz

	local local_bin="$HOME/.local/bin"
	mkdir -p "$local_bin"
	ln -sf "$opt_dir"/zen/zen "$local_bin"

	# Install IosevkaTerm Nerd Font
	local font_dir="$HOME/.local/share/fonts/IosevkaTerm"
	mkdir -p "$font_dir"
	wget -P "$font_dir" https://github.com/ryanoasis/nerd-fonts/releases/latest/download/IosevkaTerm.zip

	# Extract only the important fonts
	unzip -od "$font_dir" "$font_dir"/IosevkaTerm.zip \
		IosevkaTermNerdFontMono-Regular.ttf \
		IosevkaTermNerdFontMono-Bold.ttf \
		IosevkaTermNerdFontMono-Italic.ttf \
		IosevkaTermNerdFontMono-BoldItalic.ttf
	rm "$font_dir"/IosevkaTerm.zip
	fc-cache -fv "$HOME/.local/share/fonts"
}

restore_from_backup() {
	local i=0
	available_backups=()

	while [[ -d $backup_dir/$i ]]; do
		available_backups+=("$backup_dir/$i")
		printf "%d. %s\n" "$i" "${available_backups[i]}"
		((++i))
	done
	if [[ $i == 0 ]]; then
		printf "No backups found...\n"
		exit 1
	fi
	read -p "Select one backup: " option
	if [[ ! "$option" =~ ^[0-9]+$ ]] || [[ ! -d ${available_backups[$option]} ]]; then
		printf "Invalid backup.\n"
		exit 1
	fi
	printf "Restoring from %s...\n" "${available_backups[$option]}"
	cp -r ${available_backups[$option]}/. $HOME 
	printf "Restored successfully!\n"
}

formatted_message() {
	local option=$1
	local max_length_option=27
	local option_length=${#option}
	local spaces_to_fill_option=$((max_length_option - option_length))
	local formatted_option=$(printf "%s%*s" "$option" "$spaces_to_fill_option")

	printf "%s\n" "$formatted_option$2"
}

# TODO(srvariable): Create install_requirements, and install_full
# this way the setup will be way easier
case $1 in
	"" | "-b" | "--backup")
		create_backup
		install_dotfiles
		;;
	"-i" | "--install")
		install_dotfiles
		;;
	"-R" | "--requirements")
		install_requirements
		;;
	"-r" | "--restore")
		restore_from_backup
		;;
	"-h" | "--help")
		printf "Usage: %s [flag]\n" "$0"
		formatted_message "Flag" "Description"
		formatted_message "-b, --backup" "Install dotfiles with backup"
		formatted_message "-i, --install" "Install dotfiles without backup"
		formatted_message "-h, --help" "Show commands"
		formatted_message "-r, --restore" "Restore dotfiles from backup"
		formatted_message "-R, --requirements" "Install requirements"
		;;
	*)
		printf "Invalid flag. Try to use %s --help\n" "$0"
		exit 1
		;;
esac
