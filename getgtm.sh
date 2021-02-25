#!/bin/bash

output_text='';

# Get the option arguments if user wants to input from or export to file.
while getopts 'i:o:' opt; do
  case ${opt} in
    o )
      output_file=$OPTARG
      ;;
    i )
      if [[ -f $OPTARG ]]
      then
        input_sites=$(<./$OPTARG)
      else
        echo "Invalid input file"
        exit 1
      fi
      ;;
  esac
done

# Get rid of our options in the parameters.
shift $(($OPTIND - 1))

# Check if the $input_sites variable was set from an external file, if not populate.
if [ -z "$input_sites" ]
then
  $input_sites = $*
fi

# Loop through the urls, get their html, grep out the GTM code.
for f in $input_sites
do
  output_text+="${f}
`wget -q -O - $f | ggrep -Po "(GTM-[a-zA-Z0-9]{6})" | head -1`
"
done

# Check where user wants the results and dump them out.
if [ -z $output_file ]
then
  echo "${output_text}"
else
  echo "Results saved to $output_file"
  echo "${output_text}" >> "./$output_file"
fi
