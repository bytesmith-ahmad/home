#!/bin/bash

# TASKWARRIOR SETTINGS

# special tags **********************************

urgency.user.tag.work.coefficient=2.0           # small boost, may need more
urgency.user.tag.assignment.coefficient=2.0     # small boost, may need more
urgency.user.tag.sidequest.coefficient=-2.0 # sidequests should be at the bottom

# editor **************************************************

editor=$EDITOR

# priority urgency adjustment ***********************************

urgency.uda.priority.H.coefficient=6.0   # defualt
urgency.uda.priority.M.coefficient=3.9   # default
urgency.uda.priority.L.coefficient=-1.0

# directory column ******************************************

uda.dir.label=DIR
uda.dir.type=string
urgency.uda.dir.coefficient=1.0
color.uda.dir=color255

# category column ******************************************

uda.cat.label=CAT
uda.cat.type=string
urgency.uda.cat.coefficient=1.0
color.uda.cat=color255

# simple report *******************************************

report.simple.description=Simple list of open tasks by project
report.simple.columns=id,project,description.count      # we need to specify the columns in the report, and the order in which those are shown
report.simple.labels=ID,Proj,Desc                       # Labels are the column heading labels in the report.
report.simple.sort=project+\/,entry+                    # The / solidus indicates that project is a break column, which means a blank line is inserted between unique values, for a visual grouping effect.
report.simple.filter=status:pending limit:5             # Otherwise our report will just display all tasks

# Contexts for separating physical environments ***********
# 		The attributes mentioned below are added to task
# 		automatically when the task is created.

#       DOM          CATEGORY  PRIORITY    SCHEDULED       DUE       TAG
# -----------------------------------------------------------------------------
#context.work.read=   cat:CAR   priority:H  scheduled:7days           +CAR
#context.work.write=  cat:CAR   priority:H  scheduled:7days           +CAR
context.work.read=   cat:WRK   priority:H  scheduled:7days           +WORK
context.work.write=  cat:WRK   priority:H  scheduled:7days           +WORK
context.schl.read=   cat:ACA   priority:H  scheduled:3days due:7days +ACADEMIC
context.schl.write=  cat:ACA   priority:H  scheduled:3days due:7days +ACADEMIC
context.home.read=   cat:HOM   priority:M  scheduled:5days           +HOME
context.home.write=  cat:HOM   priority:M  scheduled:5days           +HOME
context.jbap.read=   cat:JBA               scheduled:1days      +Job +application
context.jbap.write=  cat:JBA               scheduled:1days      +Job +application

# <insert custom config> **********************************

# <insert custom config> **********************************

# <insert custom config> **********************************
