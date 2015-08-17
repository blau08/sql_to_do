class Task
  attr_reader(:name, :id, :list_id)

  define_method(:initialize) do
    @name = attributes.fetch(:name)
    @list_id = attributes.fetch(:list_id)
  end

  define_singleton_method(:all) do
    returned_tasks = DB.exec("SELECT * FROM task;")
    tasks = []
    returned_tasks.each() do |task|
      name = task.fetch("name")
      id = task.fetch("id").to_i()
      list_id = task.fetch("list_id").to_i()
      tasks.push(Task.new({:name => name, :id => id, :list_id => list_id}))
    end
    tasks
  end
end
