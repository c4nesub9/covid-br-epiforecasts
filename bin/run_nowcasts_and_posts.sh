#!/bin/bash

ROOT_DIR=`pwd`
DATE=`date`

cd $ROOT_DIR/_nowcasts/covid-global
./update_nowcasts.sh &

cd $ROOT_DIR/_nowcasts/covid-regional

echo "Starting nowcast for cities at `date`"
./update_nowcasts_cities.sh
./update_regional_summary.sh brazil/ne-cities

echo "Starting nowcast for states at `date`"
./update_nowcasts.sh

echo "Updating posts at `date`"
cd $ROOT_DIR
bin/update_posts.sh

echo "Pushing updates to github at `date`"
git pull
git add _nowcasts/ _posts/ posts/ && git commit -m "update $DATE" && git push

cd $ROOT_DIR/_nowcasts/covid-regional
echo "Starting nowcast for states at `date`"
./update_deaths_nowcasts_cities.sh

echo "Starting deaths nowcast for states at `date`"
cd $ROOT_DIR/_nowcasts/covid-regional
./update_deaths_nowcasts.sh

echo "Updating posts at `date`"
cd $ROOT_DIR
bin/update_posts.sh

echo "Pushing updates to github at `date`"
git pull
git add _nowcasts/ _posts/ posts/ && git commit -m "update deaths $DATE" && git push
