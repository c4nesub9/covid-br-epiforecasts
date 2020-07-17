#!/bin/bash

ROOT_DIR=`pwd`
DATE=`date`

cd $ROOT_DIR/_nowcasts/covid-global
./update_nowcasts.sh &

cd $ROOT_DIR/_nowcasts/covid-regional

echo "Starting nowcast for cities at `date`"
./update_nowcasts_cities.sh

echo "Starting nowcast for states at `date`"
./update_nowcasts.sh

cd $ROOT_DIR
echo "Updating posts at `date`"
bin/update_posts.sh

echo "Pushing updates to github at `date`"
bin/update_github.sh

cd $ROOT_DIR/_nowcasts/covid-regional
echo "Starting nowcast for BA cities at `date`"
./update_nowcasts_state_cities.sh BA

cd $ROOT_DIR
echo "Updating posts at `date`"
bin/update_posts.sh

echo "Pushing updates to github at `date`"
bin/update_github.sh

cd $ROOT_DIR/_nowcasts/covid-regional
echo "Starting nowcast for states at `date`"
./update_deaths_nowcasts_cities.sh

echo "Starting deaths nowcast for states at `date`"
cd $ROOT_DIR/_nowcasts/covid-regional
./update_deaths_nowcasts.sh

cd $ROOT_DIR
echo "Updating posts at `date`"
bin/update_posts.sh

echo "Pushing updates to github at `date`"
bin/update_github.sh

cd $ROOT_DIR/_nowcasts/covid-regional
echo "Starting nowcast for PB cities at `date`"
./update_nowcasts_state_cities.sh PB 

cd $ROOT_DIR
echo "Updating posts at `date`"
bin/update_posts.sh

echo "Pushing updates to github at `date`"
bin/update_github.sh
