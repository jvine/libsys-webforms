[![Build Status](https://travis-ci.org/sul-dlss/libsys-webforms.svg?branch=master)](https://travis-ci.org/sul-dlss/libsys-webforms) | [![Coverage Status](https://coveralls.io/repos/github/sul-dlss/libsys-webforms/badge.svg?branch=master)](https://coveralls.io/github/sul-dlss/libsys-webforms?branch=master) | [![Dependency Status](https://gemnasium.com/sul-dlss/libsys-webforms.svg)](https://gemnasium.com/sul-dlss/libsys-webforms)
# Library Systems Webforms App

This is a Rails application to be a front-end for various Symphony reporting & updating tools. Intended to replace the web forms generated from the 'sulohs' servers.

## Requirements
1. Ruby (2.1.1 or greater)
2. Rails (4.2.0 or greater)
3. An Instance of Symphony to connect to
4. Oracle client

## Installation

Clone the repository
```
git clone https://github.com/sul-dlss/libsys-webforms.git
```

Change directories into the app and install dependencies
```
bundle install
```

## Development

#### Setting up fixtures for development

In order to have the tables populated for testing the app in development you should load the fixture data into the tables with:
```
RAILS_ENV=development rake db:seed
```
Running the above rake task will seed the development database with an admin user.

Start the development server:
```
REMOTE_USER=admin rails s
```

## Testing

#### Running the migrations for test

Before running the tests with rake you should run the migrations in the `test` environment by running:
```
RAILS_ENV=test rake db:test:prepare
RAILS_ENV=test rake db:seed
```

NOTE: Travis uses `db:test:prepare` rather than `db:migrate`

### Rake, etc.
The test suite (with RuboCop style enforcement) will be run with the default rake task (also run on travis)

    $ rake

The specs can be run without RuboCop enforcement

    $ rake spec

The RuboCop style enforcement can be run without running the tests

    $ rake rubocop

## Deployment

To deploy to development:

    $ cap dev deploy

## Command-line tasks

There are some command-line tools the application provides.
For example, to upload and delete batches:

    $ bundle exec rake webforms:change_current_location[:path_to_file,:current_lib,:new_curloc,:email, :comments]
    $ bundle exec rake webforms:delete_batch[batch_id]    

## Ckey2Bibframe Webform

The "Ckey2Bibframe" webform allows you to enter a Symphony ckey and view <strong>marc21-to-xml</strong> and <strong>marcxml-to-bibframe2</strong> results in the browser. In order for this functionality to work you must install the <a href="https://github.com/lcnetdev/marc2bibframe2">LOC Marc2Bibframe2 Converter</a> and place it under this application's root. Running the LOC marc2bibframe2 converter via libsys-webforms requires the `xsltproc` command-line tool be installed on your system (see http://www.xmlsoft.org). After cloning this project, simply `cd libsys-webforms` and then `git clone https://github.com/lcnetdev/marc2bibframe2.git`. If it is not already there, you must also create a `lib/xform-marc21-to-xml-jar-with-dependencies.jar` file that is compiled from https://github.com/sul-dlss/ld4p-marc21-to-xml (see https://github.com/sul-dlss/ld4p-marc21-to-xml#compiling-and-executing, it should be placed in this app's lib folder as well).

## PL/SQL Jobs

Based on the configuration of a `pl_sql_job` in the settings/{environment}.yml file, e.g.:
```yml
pl_sql_jobs:
  circ_stats_job:
    text: 'Circ stats report daily processing'
    command: 'circ_stats_rpt.daily_processing'
    sunet_ids:
      - 'usera'
      - 'userb'
```
links with collapsed "Run" buttons will automatically be created on the home page and will only appear for people who are
logged in and listed in the sunet_ids section of the config. (Permissions for PL/SQL jobs are managed here because there
is no Rails ORM on which to base an Ability.)  Clicking the "Run" link will execute the configured PL/SQL command via the
already configured OCI8 connection gem (using the environment's database.yml connection details). If more jobs need to be
added in the future, just fill out a new section under the pl_sql_jobs section in the https://github.com/sul-dlss/shared_configs
repository and follow the instructions there for deploying to the application server.
