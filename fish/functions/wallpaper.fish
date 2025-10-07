function wallpaper
	wal -i $argv[1] -e;
	hyprctl hyprpaper reload ",$argv[1]";
end

