SRC_DIR = src
DIST_DIR = dist
COMPILER = cat
COMPILER ?= `which uglifyjs` --no-copyright


SRC_FILES = $(SRC_DIR)/header.js\
	$(SRC_DIR)/defaults.js\
	$(SRC_DIR)/utils.js\
	$(SRC_DIR)/simpledraw.js\
	$(SRC_DIR)/rangemap.js\
	$(SRC_DIR)/interact.js\
	$(SRC_DIR)/base.js\
	$(SRC_DIR)/chart-line.js\
	$(SRC_DIR)/chart-bar.js\
	$(SRC_DIR)/chart-timeline.js\
	$(SRC_DIR)/chart-tristate.js\
	$(SRC_DIR)/chart-discrete.js\
	$(SRC_DIR)/chart-bullet.js\
	$(SRC_DIR)/chart-pie.js\
	$(SRC_DIR)/chart-box.js\
	$(SRC_DIR)/vcanvas-base.js\
	$(SRC_DIR)/vcanvas-canvas.js\
	$(SRC_DIR)/vcanvas-vml.js\
	$(SRC_DIR)/footer.js


VERSION = $(shell cat version.txt)

all: jqs-gzip jqs-min-gzip Changelog.txt
	cp Changelog.txt ${DIST_DIR}/

jqs: ${DIST_DIR}/jquery.sparkline.js

${DIST_DIR}/jquery.sparkline.js: ${SRC_FILES}
	+@[ -d ${DIST_DIR} ] || mkdir ${DIST_DIR}
	cat ${SRC_FILES} | sed 's/@VERSION@/${VERSION}/'  >${DIST_DIR}/jquery.sparkline.js

jqs-min: ${DIST_DIR}/jquery.sparkline.min.js

${DIST_DIR}/jquery.sparkline.min.js: ${DIST_DIR}/jquery.sparkline.js
	cat minheader.txt | sed 's/@VERSION@/${VERSION}/' >${DIST_DIR}/jquery.sparkline.min.js
	${COMPILER} ${DIST_DIR}/jquery.sparkline.js  >>${DIST_DIR}/jquery.sparkline.min.js

jqs-gzip: ${DIST_DIR}/jquery.sparkline.js
	gzip -9 < ${DIST_DIR}/jquery.sparkline.js >${DIST_DIR}/jquery.sparkline.js.gz

jqs-min-gzip: ${DIST_DIR}/jquery.sparkline.min.js
	gzip -9 < ${DIST_DIR}/jquery.sparkline.min.js >${DIST_DIR}/jquery.sparkline.min.js.gz


clean:
	-rm -f ${DIST_DIR}/*

