= Github Backup

This script will cycle through all repositories belonging to an organization and clone a mirror of them to a specified directory.

A mirror is a bare repository that is suitable for future cloning, if necessary.

== Installation

This library needs the rest_client gem:

  gem install rest_client

every other library should be in the standard Ruby libs.

Clone this repo and place it in your favorite local directory.  Create a config.yml file in the root of the lib that contains your github username, password, and organization name, as well as the target directory for backups on your machine.  There is a config_example.yml file that demonstrates the structure.

Then:

  PATH_TO_LIB/bin/backup_github

