mina-sidekiq-upstart
============

[![Build Status](https://travis-ci.org/Mic92/mina-sidekiq-upstart.png?branch=master)](https://travis-ci.org/Mic92/mina-sidekiq-upstart)

mina-sidekiq-upstart is a gem that adds tasks to aid in the deployment of [Sidekiq] (http://mperham.github.com/sidekiq/)
using [Mina] (http://nadarei.co/mina).

# Getting Start

## Installation

    gem install mina-sidekiq-upstart

## Example

## Usage example

    require 'mina_sidekiq_upstart/tasks'
    ...
    # to make logs persistent between deploys
    set :shared_paths, ['log']

    task :setup do
      # sidekiq needs a place to store its pid file and log file
      queue! %[mkdir -p "#{deploy_to}/shared/pids/"]
      queue! %[mkdir -p "#{deploy_to}/shared/log/"]
    end

    task :deploy do
      deploy do
        # stop accepting new workers
        invoke :'sidekiq:quiet'
        invoke :'git:clone'
        invoke :'deploy:link_shared_paths'
        ...

        to :launch do
          ...
          invoke :'sidekiq:restart'
        end
      end
    end

## Available Tasks

* sidekiq:stop
* sidekiq:start
* sidekiq:restart
* sidekiq:quiet

## Available Options

| Option              | Description                                                                    |
| ------------------- | ------------------------------------------------------------------------------ |
| *sidekiq*           | Sets the path to sidekiq.                                                      |
| *sidekiqctl*        | Sets the path to sidekiqctl.                                                   |
| *sidekiq\_timeout*  | Sets a upper limit of time a worker is allowed to finish, before it is killed. |
| *sidekiq\_log*      | Sets the path to the log file of sidekiq.                                      |
| *sidekiq\_pid*      | Sets the path to the pid file of a sidekiq worker.                             |
| *sidekiq_processes* | Sets the number of sidekiq processes launched.                                 |

## Testing

The test requires a local running ssh server with the ssh keys of the current
user added to its `~/.ssh/authorized_keys`. In OS X, this is "Remote Login"
under the Sharing pref pane.

To run the full blown test suite use:

    bundle exec rake test

For faster release cycle use

    cd test_env
    bundle exec mina deploy --verbose

## Copyright

Copyright (c) 2013 Jörg Thalheim http://higgsboson.tk/joerg

See LICENSE for further details.
