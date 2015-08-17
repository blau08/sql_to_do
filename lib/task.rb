class Task
  attr_reader(:name, :id, :list_id)

  define_method(:initialize) do |attributes|
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

  define_method(:save) do
    result = DB.exec("INSERT INTO task (name, list_id) VALUES ('#{@name}', #{@list_id}) RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_singleton_method(:clear) do
    DB.exec("DELETE FROM task *;")
  end

  define_method(:==) do |another_task|
    self.name() == another_task.name() && self.list_id() == another_task.list_id()
  end

end
