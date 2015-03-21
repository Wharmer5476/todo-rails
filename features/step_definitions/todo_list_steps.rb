Given "I have some items in my to-do list" do
  @item_1 = Item.create name: "Make a Rails app"
  @item_2 = Item.create name: "Demonstrate test-driven development"
end

When "I go to the home page" do
  visit root_path
end

When "I add a to-do item" do
  visit root_path
  @new_item_name = "Make this test pass"
  add_item @new_item_name
end

Then "I can see all the items" do
  expect(page).to show_todo_item @item_1
  expect(page).to show_todo_item @item_2
end

Then "it appears in the list" do
  expect(page).to show_todo_item Item.new(name: @new_item_name)
end
