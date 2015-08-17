require('spec_helper')

describe(List) do
  describe(".all") do
    it("is empty at first") do
      expect(List.all()).to(eq([]))
    end
  end

  describe("#save") do
    it ("adds a list to the array of saved list") do
      test_list = List.new({:name => "Kyles List"})
      test_list.save()
      expect(List.all()).to(eq([test_list]))
    end
  end

  describe(".clear") do
    it("clears all lists") do
      test_list = List.new({:name => "Brian ToDo"})
      test_list.save()
      List.clear()
      expect(List.all()).to(eq([]))
    end
  end

  describe("#name") do
    it("tells you its name") do
      list = List.new({:name => "Epicodus stuff", :id => nil})
      expect(list.name()).to(eq("Epicodus stuff"))
    end
  end

  describe("#id") do
    it("sets its ID when you save it") do
      list = List.new({:name => "Epicodus stuff", :id => nil})
      list.save()
      expect(list.id()).to(be_an_instance_of(Fixnum))
    end
  end
end

describe(Task) do
  describe(".all") do
    it("is empty at first") do
      expect(Task.all()).to(eq([]))
    end
  end

  describe("#save") do
    it ("adds a task to the array of saved task") do
      test_list = Task.new({:name => "Buy Milk", :list_id => 1, :due_date => "2015-08-20"})
      test_list.save()
      expect(Task.all()).to(eq([test_list]))
    end
  end

  describe(".clear") do
    it("clears all lists") do
      test_list = Task.new({:name => "Buy Milk", :list_id => 1, :due_date => "2015-08-20"})
      test_list.save()
      Task.clear()
      expect(Task.all()).to(eq([]))
    end
  end

  describe("#name") do
    it("tells you its name") do
      task = Task.new({:name => "Epicodus stuff", :list_id => 1, :due_date => "2015-08-20"})
      expect(task.name()).to(eq("Epicodus stuff"))
    end
  end

  describe("#id") do
    it("sets its ID when you save it") do
      task = Task.new({:name => "Epicodus stuff", :list_id => 1, :due_date => "2015-08-20"})
      task.save()
      expect(task.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#list_id") do
    it("sets its ID when you save it") do
      task = Task.new({:name => "Epicodus stuff", :list_id => 1, :due_date => "2015-08-20"})
      task.save()
      expect(task.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe(".sort") do
    it("sorts to do tasks by due date") do
      task = Task.new({:name => "Buy Milk", :list_id => 1, :due_date => '2015-08-20'})
      task2 = Task.new({:name => "Buy Gas", :list_id => 1, :due_date => '2015-08-19'})
      task.save()
      task2.save()
      expect(Task.all()).to(eq([task2, task]))
    end
  end
end
