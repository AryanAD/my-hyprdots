# #!/usr/bin/env sh

# # Restores the shader after screenshot has been taken
# restore_shader() {
# 	if [ -n "$shader" ]; then
# 		hyprshade on "$shader"
# 	fi
# }

# # Saves the current shader and turns it off
# save_shader() {
# 	shader=$(hyprshade current)
# 	hyprshade off
# 	trap restore_shader EXIT
# }

# save_shader # Saving the current shader

# if [ -z "$XDG_PICTURES_DIR" ]; then
# 	XDG_PICTURES_DIR="$HOME/Pictures"
# fi

# scrDir=$(dirname "$(realpath "$0")")
# source $scrDir/globalcontrol.sh
# swpy_dir="${confDir}/swappy"
# save_dir="${2:-$XDG_PICTURES_DIR/Screenshots}"
# save_file=$(date +'%y%m%d_%Hh%Mm%Ss_screenshot.png')
# temp_screenshot="/tmp/screenshot.png"

# mkdir -p $save_dir
# mkdir -p $swpy_dir
# echo -e "[Default]\nsave_dir=$save_dir\nsave_filename_format=$save_file" >$swpy_dir/config

# function print_error
# {
# 	cat <<"EOF"
#     ./screenshot.sh <action>
#     ...valid actions are...
#         p  : print all screens
#         s  : snip current screen
#         sf : snip current screen (frozen)
#         m  : print focused monitor
# EOF
# }

# case $1 in
# p) # print all outputs
# 	grimblast copysave screen $temp_screenshot && restore_shader && swappy -f $temp_screenshot ;;
# s) # drag to manually snip an area / click on a window to print it
# 	grimblast copysave area $temp_screenshot && restore_shader && swappy -f $temp_screenshot ;;
# sf) # frozen screen, drag to manually snip an area / click on a window to print it
# 	grimblast --freeze copysave area $temp_screenshot && restore_shader && swappy -f $temp_screenshot ;;
# m) # print focused monitor
# 	grimblast copysave output $temp_screenshot && restore_shader && swappy -f $temp_screenshot ;;
# *) # invalid option
# 	print_error ;;
# esac

# rm "$temp_screenshot"

# if [ -f "${save_dir}/${save_file}" ]; then
# 	notify-send -a "t1" -i "${save_dir}/${save_file}" "saved in ${save_dir}"
# fi


# ----------COPY SCREENSHOT TO CLIPBOARD AUTOMATICALLY----------


#!/usr/bin/env sh

# Restores the shader after screenshot has been taken
# restore_shader() {
# 	if [ -n "$shader" ]; then
# 		hyprshade on "$shader"
# 	fi
# }

# # Saves the current shader and turns it off
# save_shader() {
# 	shader=$(hyprshade current)
# 	hyprshade off
# 	trap restore_shader EXIT
# }

# save_shader # Saving the current shader

# if [ -z "$XDG_PICTURES_DIR" ]; then
# 	XDG_PICTURES_DIR="$HOME/Pictures"
# fi

# scrDir=$(dirname "$(realpath "$0")")
# source $scrDir/globalcontrol.sh
# swpy_dir="${confDir}/swappy"
# save_dir="${2:-$XDG_PICTURES_DIR/Screenshots}"
# save_file=$(date +'%y%m%d_%Hh%Mm%Ss_screenshot.png')
# temp_screenshot="/tmp/screenshot.png"

# mkdir -p $save_dir
# mkdir -p $swpy_dir
# echo -e "[Default]\nsave_dir=$save_dir\nsave_filename_format=$save_file" >$swpy_dir/config

# function print_error {
# 	cat <<"EOF"
#     ./screenshot.sh <action>
#     ...valid actions are...
#         p  : print all screens
#         s  : snip current screen
#         sf : snip current screen (frozen)
#         m  : print focused monitor
# EOF
# }

# case $1 in
# p) # print all outputs
# 	grimblast copysave screen $temp_screenshot \
# 	&& wl-copy < $temp_screenshot \
# 	&& restore_shader \
# 	&& swappy -f $temp_screenshot ;;
# s) # drag to manually snip an area / click on a window to print it
# 	grimblast copysave area $temp_screenshot \
# 	&& wl-copy < $temp_screenshot \
# 	&& restore_shader \
# 	&& swappy -f $temp_screenshot ;;
# sf) # frozen screen, drag to manually snip an area / click on a window to print it
# 	grimblast --freeze copysave area $temp_screenshot \
# 	&& wl-copy < $temp_screenshot \
# 	&& restore_shader \
# 	&& swappy -f $temp_screenshot ;;
# m) # print focused monitor
# 	grimblast copysave output $temp_screenshot \
# 	&& wl-copy < $temp_screenshot \
# 	&& restore_shader \
# 	&& swappy -f $temp_screenshot ;;
# *) # invalid option
# 	print_error ;;
# esac

# rm "$temp_screenshot"

# if [ -f "${save_dir}/${save_file}" ]; then
# 	notify-send -a "t1" -i "${save_dir}/${save_file}" "Saved in ${save_dir}"
# fi


# ----------COPY SCREENSHOT TO CLIPBOARD AND SAVE AUTOMATICALLY----------


#!/usr/bin/env sh

# Restores the shader after screenshot has been taken
restore_shader() {
	if [ -n "$shader" ]; then
		hyprshade on "$shader"
	fi
}

# Saves the current shader and turns it off
save_shader() {
	shader=$(hyprshade current)
	hyprshade off
	trap restore_shader EXIT
}

save_shader # Saving the current shader

# Directory for saved screenshots
save_dir="/home/archuser/Pictures/Screenshots"
save_file=$(date +'%y%m%d_%Hh%Mm%Ss_screenshot.png')
temp_screenshot="/tmp/screenshot.png"

mkdir -p $save_dir # Ensure the directory exists

function print_error {
	cat <<"EOF"
    ./screenshot.sh <action>
    ...valid actions are...
        p  : print all screens
        s  : snip current screen
        sf : snip current screen (frozen)
        m  : print focused monitor
EOF
}

case $1 in
p) # print all outputs
	grimblast copysave screen $temp_screenshot \
	&& cp $temp_screenshot "${save_dir}/${save_file}" \
	&& wl-copy < $temp_screenshot \
	&& restore_shader ;;
s) # drag to manually snip an area / click on a window to print it
	grimblast copysave area $temp_screenshot \
	&& cp $temp_screenshot "${save_dir}/${save_file}" \
	&& wl-copy < $temp_screenshot \
	&& restore_shader ;;
sf) # frozen screen, drag to manually snip an area / click on a window to print it
	grimblast --freeze copysave area $temp_screenshot \
	&& cp $temp_screenshot "${save_dir}/${save_file}" \
	&& wl-copy < $temp_screenshot \
	&& restore_shader ;;
m) # print focused monitor
	grimblast copysave output $temp_screenshot \
	&& cp $temp_screenshot "${save_dir}/${save_file}" \
	&& wl-copy < $temp_screenshot \
	&& restore_shader ;;
*) # invalid option
	print_error ;;
esac

rm "$temp_screenshot"

if [ -f "${save_dir}/${save_file}" ]; then
	notify-send -a "Screenshot" -i "${save_dir}/${save_file}" "Screenshot saved in ${save_dir} and copied to clipboard."
fi


# /home/archuser/.local/share/bin/screenshot.sh