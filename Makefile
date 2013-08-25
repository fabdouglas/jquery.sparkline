all: join-script-files

include ../../build/modules.mk

MODULE = sparkline
MODULARIZE_OPTIONS = -jq
SOURCE_SCRIPT_FOLDER	= ./src
SOURCE_SCRIPT_FILE_PREFIX = 
SOURCE_SCRIPT_FILES = $(SOURCE_SCRIPT_FOLDER)/header.js\
			$(SOURCE_SCRIPT_FOLDER)/defaults.js\
			$(SOURCE_SCRIPT_FOLDER)/utils.js\
			$(SOURCE_SCRIPT_FOLDER)/simpledraw.js\
			$(SOURCE_SCRIPT_FOLDER)/rangemap.js\
			$(SOURCE_SCRIPT_FOLDER)/interact.js\
			$(SOURCE_SCRIPT_FOLDER)/base.js\
			$(SOURCE_SCRIPT_FOLDER)/chart-line.js\
			$(SOURCE_SCRIPT_FOLDER)/chart-bar.js\
			$(SOURCE_SCRIPT_FOLDER)/chart-tristate.js\
			$(SOURCE_SCRIPT_FOLDER)/chart-discrete.js\
			$(SOURCE_SCRIPT_FOLDER)/chart-bullet.js\
			$(SOURCE_SCRIPT_FOLDER)/chart-pie.js\
			$(SOURCE_SCRIPT_FOLDER)/chart-box.js\
			$(SOURCE_SCRIPT_FOLDER)/vcanvas-base.js\
			$(SOURCE_SCRIPT_FOLDER)/vcanvas-canvas.js\
			$(SOURCE_SCRIPT_FOLDER)/vcanvas-vml.js\
			$(SOURCE_SCRIPT_FOLDER)/footer.js


