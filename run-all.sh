#! /bin/bash

# this is a shell script (intended for bash on Linux)
# to run each of the sample programs
# Note that you may need to make this file executable (with "chmod +x run-all.sh")

# make sure all prerequisites are met
check_tools()
{
    which dart > /dev/null
    if [ $? -ne 0 ] ; then
	echo "Is the dart SDK installed?"
	echo "(see http://dart.dev/get-dart)"
	exit 1
    fi
}

main()
{
    echo "checking environment"
    check_tools
    echo "running exercise 1"
    echo ""
    dart run fetch-subway.dart | tr ',' '\n' | grep "long_name" | sed -e 's/\"long_name\"://'
    exit $?
}

# do it
main
