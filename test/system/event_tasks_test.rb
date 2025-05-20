require "application_system_test_case"

class EventTasksTest < ApplicationSystemTestCase
  setup do
    @event_task = event_tasks(:one)
  end

  test "visiting the index" do
    visit event_tasks_url
    assert_selector "h1", text: "Event tasks"
  end

  test "should create event task" do
    visit event_tasks_url
    click_on "New event task"

    fill_in "Body", with: @event_task.body
    check "Done" if @event_task.done
    fill_in "Event", with: @event_task.event_id
    fill_in "Name", with: @event_task.name
    fill_in "Notes", with: @event_task.notes
    fill_in "Team", with: @event_task.team_id
    fill_in "User", with: @event_task.user_id
    click_on "Create Event task"

    assert_text "Event task was successfully created"
    click_on "Back"
  end

  test "should update Event task" do
    visit event_task_url(@event_task)
    click_on "Edit this event task", match: :first

    fill_in "Body", with: @event_task.body
    check "Done" if @event_task.done
    fill_in "Event", with: @event_task.event_id
    fill_in "Name", with: @event_task.name
    fill_in "Notes", with: @event_task.notes
    fill_in "Team", with: @event_task.team_id
    fill_in "User", with: @event_task.user_id
    click_on "Update Event task"

    assert_text "Event task was successfully updated"
    click_on "Back"
  end

  test "should destroy Event task" do
    visit event_task_url(@event_task)
    click_on "Destroy this event task", match: :first

    assert_text "Event task was successfully destroyed"
  end
end
