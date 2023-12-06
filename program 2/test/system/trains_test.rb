require "application_system_test_case"

class TrainsTest < ApplicationSystemTestCase
  setup do
    @train = trains(:one)
  end

  test "visiting the index" do
    visit trains_url
    assert_selector "h1", text: "Trains"
  end

  test "should create train" do
    visit trains_url
    click_on "New train"

    fill_in "Arrivaldate", with: @train.arrivaldate
    fill_in "Arrivaltime", with: @train.arrivaltime
    fill_in "Departuredate", with: @train.departuredate
    fill_in "Departurestation", with: @train.departurestation
    fill_in "Departuretime", with: @train.departuretime
    fill_in "Seatsleft", with: @train.seatsleft
    fill_in "Terminationstation", with: @train.terminationstation
    fill_in "Ticketprice", with: @train.ticketprice
    fill_in "Traincapacity", with: @train.traincapacity
    fill_in "Trainnumber", with: @train.trainnumber
    click_on "Create Train"

    assert_text "Train was successfully created"
    click_on "Back"
  end

  test "should update Train" do
    visit train_url(@train)
    click_on "Edit this train", match: :first

    fill_in "Arrivaldate", with: @train.arrivaldate
    fill_in "Arrivaltime", with: @train.arrivaltime
    fill_in "Departuredate", with: @train.departuredate
    fill_in "Departurestation", with: @train.departurestation
    fill_in "Departuretime", with: @train.departuretime
    fill_in "Seatsleft", with: @train.seatsleft
    fill_in "Terminationstation", with: @train.terminationstation
    fill_in "Ticketprice", with: @train.ticketprice
    fill_in "Traincapacity", with: @train.traincapacity
    fill_in "Trainnumber", with: @train.trainnumber
    click_on "Update Train"

    assert_text "Train was successfully updated"
    click_on "Back"
  end

  test "should destroy Train" do
    visit train_url(@train)
    click_on "Destroy this train", match: :first

    assert_text "Train was successfully destroyed"
  end
end
