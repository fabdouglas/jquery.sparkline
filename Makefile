include ../../build/modules.mk


MODULE = sparkline
SRC_FILES = $(SRC_DIR)/header.js\
	$(SRC_DIR)/defaults.js\
	$(SRC_DIR)/utils.js\
	$(SRC_DIR)/simpledraw.js\
	$(SRC_DIR)/rangemap.js\
	$(SRC_DIR)/interact.js\
	$(SRC_DIR)/base.js\
	$(SRC_DIR)/chart-line.js\
	$(SRC_DIR)/chart-bar.js\
	$(SRC_DIR)/chart-tristate.js\
	$(SRC_DIR)/chart-discrete.js\
	$(SRC_DIR)/chart-bullet.js\
	$(SRC_DIR)/chart-pie.js\
	$(SRC_DIR)/chart-box.js\
	$(SRC_DIR)/vcanvas-base.js\
	$(SRC_DIR)/vcanvas-canvas.js\
	$(SRC_DIR)/vcanvas-vml.js\
	$(SRC_DIR)/footer.js

SRC_DIR 		= src
PRODUCTION		= ${PRODUCTION_DIR}/${MODULE}.js
DEVELOPMENT 	= ${DEVELOPMENT_DIR}/${MODULE}.js
VERSION 		= $(shell cat version.txt)
DIST 			= dist/${MODULE}.js

all: jqs
	${MODULARIZE} -jq -n "${MODULE}" ${DIST} > ${DEVELOPMENT}
	${UGLIFYJS} ${DEVELOPMENT} > ${PRODUCTION}

jqs: ${SRC_FILES}
	cat ${SRC_FILES} | sed 's/@VERSION@/${VERSION}/' >${DIST}