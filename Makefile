# Makefile for mondo ontology ingest
# adapted from https://github.com/monarch-initiative/mondo-analysis/blob/master/Makefile

ROBOT=robot
ROBOT_VERSION=v1.8.1
ROBOT_JAR_URL=https://github.com/ontodev/robot/releases/download/${ROBOT_VERSION}/robot.jar
ROBOT_SH_URL=https://raw.githubusercontent.com/ontodev/robot/${ROBOT_VERSION}/bin/robot
JAVA_ARGS=-Xmx20G
OBO_PURL=http://purl.obolibrary.org/obo
DIRS = (sources preparation metrics)

help:
	echo "Run 'make all' to execute the data pipeline. \
	To create the required dirs, \
	run 'make dirs' to create the required directories, 'make robot' to \
	download and install ROBOT."

requirements:
	echo "Note: Python 3.8 or greater required."
	pip install -r requirements.txt

robot:
	wget $(ROBOT_JAR_URL) -O "$(ROBOT).jar" &&\
	wget $(ROBOT_SH_URL) -O "$(ROBOT)"

dirs:
	for d in ${DIRS}; do
		mkdir ${d}
	done

build:
	sh odk.sh make all

all: help
