# shellscripts
Handy sloppy bash scripts.

I use these on my mac using the gnu versions from MacPorts where possible. That
means you're gonna see ggrep instead of grep.

wpe-checkout.sh
Download the latest version of Wordpress, clone a git repo that's set up
for WPEngine hosting (e.g. ignoring wp base files, move the files and .git
directory back into the root directory so you have a local, fully-functioning WP
install with your site.

cms-dbauth.sh
Find the database credentials in a Drupal or Wordpress site and echo them as
a mysql command. Useful for loading databases from the command line.

getgtm.sh
Give it URLs and it will return the GTM code that's on the site. Accepts urls
as parameters or text file as input. Output can be dumped into file.
