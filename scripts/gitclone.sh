#!/bin/sh
for repo in Backend Database Frontend Helge-api Ops Documentation; do
    git clone "https://github.com/ProjectHackernewsGroup04/${repo}.git"
done