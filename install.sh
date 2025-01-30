#!/bin/bash

backup_dir="$HOME/Desktop/backup"
config_files=$(find . -maxdepth 1 -type d ! \( -name ".git" -o -name "." -o -name ".vim" \) -printf "%P ")
home_files=$(find . -maxdepth 1 \( -type f -o -type d \) \( -name ".vim*" -o -name ".bashrc" -o -name ".bash_aliases" -o -name ".zshrc" -o -name ".zsh_aliases" \) -printf "%P ")

create_backup() {
	i=0
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
	printf -- "Creating backup in $backup_dir/$i...\n"

	cp -r ${backup_config_files[@]} $backup_dir/$i/.config > /dev/null 2>&1
	cp -r ${backup_home_files[@]} $backup_dir/$i > /dev/null 2>&1
	printf -- "Created succesfully!\n"
}

# TODO: Maybe use symlinks?
install_dotfiles() {
	printf -- "Installing dotfiles...\n"
	mkdir -p $HOME/.config
	cp -r $config_files $HOME/.config
	cp -r $home_files $HOME
	printf -- "Installed sucessfully!\n"
}

restore_from_backup() {
	i=0
	available_backups=()

	while [[ -d $backup_dir/$i ]]; do
		available_backups+=("$backup_dir/$i")
		printf "%d. %s\n" $i ${available_backups[i]}
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
	printf "Restoring from ${available_backups[$option]}...\n"
	cp -r ${available_backups[$option]}/. $HOME 
	printf "Restored sucessfully!\n"
}

formatted_message() {
	option=$1
	max_length_option=27
	option_length=${#option}
	spaces_to_fill_option=$((max_length_option - option_length))
	formatted_option=$(printf "%s%*s" "$option" "$spaces_to_fill_option")
	printf -- "%s\n" "$formatted_option$2"
}

case $1 in
	"" | "-b" | "--backup")
		create_backup
		install_dotfiles
		;;
	"-i" | "--install")
		install_dotfiles
		;;
	"-r" | "--restore")
		restore_from_backup
		;;
	"-h" | "--help")
		printf "Usage: $0 [flag]\n"
		formatted_message "Flag" "Description"
		formatted_message "-b, --backup" "Install dotfiles with backup"
		formatted_message "-i, --install" "Install dotfiles without backup"
		formatted_message "-h, --help" "Show commands"
		formatted_message "-r, --restore" "Restore dotfiles from backup"
		;;
	*)
		printf -- "Invalid flag. Try to use $0 --help\n"
		exit 1
		;;
esac
