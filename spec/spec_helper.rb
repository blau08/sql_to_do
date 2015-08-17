require('rspec')
require('pg')
require('list')
require('task')
require('pry')

DB = PG.connect({:dbname => "to_do_test"})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM list *;")
    DB.exec("DELETE FROM task *;")
  end
end
