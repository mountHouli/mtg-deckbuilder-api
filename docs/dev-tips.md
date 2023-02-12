# Dev Tips

## To Quickly Iterate DB Modifications

Start the DB in docker.

Make your DB in docker _not_ have a password, so that you don't have to re-enter it every time you setup/teardown/test the DB. Note: Technically this is insecure; a hacker could connect to your MariaDB. Only use in save situations, such as when developing, and when connected to a secure network.

Read the command below. Notice that it:
- Runs DB teardown, so that the DB is clean and ready for your new changes.
- Runs DB setup, where you likely just put your last DB change.
- Runs DB your `dev/test-seed.sql` file with whatever seed data you need.
- Runs a `dev/commands-you-write-and-use-to-test-your-most-recent-changes.sql` file with one command

The `&&` between each command will ensure that the current command has no errors, before it tries to move onto the next command. This is important because it's possible to have, say, `setup.sql` to get partially complete but error, and then to have `commands-you-write-and-use-to-test-your-most-recent-changes.sql` run anyway (and it might be successful!), and give you the impression that your most recent SQL changes (e.g. in `setup.sql`) were correct and error free.

`mariadb -h 127.0.0.1 -u root < db/teardown.sql && mariadb -h 127.0.0.1 -u root < db/setup.sql && mariadb -h 127.0.0.1 -u root < dev/test-seed.sql && mariadb -h 127.0.0.1 -u root -e "$(cat dev/commands-you-write-and-use-to-test-your-most-recent-changes.sql)" YOUR_DATABASE_NAME`

Set `YOUR_DATABASE_NAME` so that the commands you put in your `.sql` file run in that database.
