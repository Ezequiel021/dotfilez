function waybar-reload
	if pgrep waybar; pkill waybar; end; hyprctl dispatch exec waybar
end
