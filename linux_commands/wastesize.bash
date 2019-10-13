#! /bin/bash

#wastesize --> reports the number of files in the waste bin ignoring the directories

ls -l ~/.waste | grep ^- | wc -l

