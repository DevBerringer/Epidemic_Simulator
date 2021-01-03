# Makefile for Epidemic simulator
# Author: Blake Berringer
# Version 2020-11-30

# The following commands are supported
# make
# make test     -- run the Epidemic simulator test
# make html     -- makes a website of the internal documentation
# make clean    -- deletes all files created by this make file

#####
#source files by category

UtilityJava = Error.java MyScanner.java MyRandom.java Simulator.java

PlaceSubclassJava = WorkPlace.java HomePlace.java
PersonSubclassJava = Employee.java
ModelJava = Person.java $(PersonSubclassJava) Place.java $(PlaceSubclassJava)

MainJava = Epidemic.java

AllJava = $(UtilityJava) $(ModelJava) $(MainJava)

######
# primary make target

UtilityClasses = Error.class MyScanner.class MyRandom.class Simulator.class
SimulationClasses = Person.class Place.class

Epidemic.class: Epidemic.java $(UtilityClasses) $(SimulationClasses)
	javac Epidemic.java

# Simulation classes targets

Person.class: Person.java Place.class Employee.class $(UtilityClasses)
	javac Person.java
Place.class: Place.java HomePlace.class WorkPlace.class $(UtilityClasses)
	javac Place.java

Employee.class: Employee.java
	javac Employee.java

HomePlace.class: HomePlace.java
	javac HomePlace.java

WorkPlace.class: WorkPlace.java
	javac WorkPlace.java

# utility classes make targets

MyScanner.class: MyScanner.java Error.class
	javac MyScanner.java

Error.class: Error.java
	javac Error.java

MyRandom.class: MyRandom.java
	javac MyRandom.java

Simulator.class: Simulator.java
	javac Simulator.java

test: Epidemic.class
	java Epidemic testpi

html:
	javadoc @Epidemic

clean:
	rm -f *.class *.html package-list script.js stylesheet.css
