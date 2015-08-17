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
end
