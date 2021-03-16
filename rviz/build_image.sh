#!/bin/bash


print_help()
{
  echo "MARC build script. Options:"
  echo "-h        Show this help and exit."
  echo "-d        Debug build, passed to the Dockerfile, and consequently to CMake."
  echo "-t <arg>  Additional tag postfix. If specified, appended to the tag generated from the build type and date."
}


build_type="RelWithDebInfo"

OPTIND=1
while getopts "h?dt:" opt; do

  case $opt in
    h|\?)
      print_help
      exit
      ;;
    d)
      build_type="Debug"
      ;;
    t)
      tag_postfix="-$OPTARG"
      echo "Tag postfix: $tag_postfix"
      ;;
    esac

done

case $build_type in
  "RelWithDebInfo")
    tag_prefix="dev"
    ;;
  "Debug")
    tag_prefix="debug"
    ;;
  *)
    >&2 echo "Unknown build type"
    exit 1
    ;;
esac

echo "Build type: $build_type"

docker build -t rosbot_remote/rviz:latest -f Dockerfile --build-arg RAND=$RANDOM --build-arg BUILD_TYPE=$build_type .


# Get current date in YYYY-MM-DD format
printf -v date '%(%Y-%m-%d)T' -1
# Generate tag
auto_tag="rosbot_remote/rviz:$tag_prefix-$date$tag_postfix"
echo "Adding tag: $auto_tag"

docker tag rosbot_remote/rviz:latest  $auto_tag

# rm -rf rosdep_files

# popd