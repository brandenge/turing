require './lib/photo'

RSpec.describe Photo do
  before :each do
    @photo = Photo.new("https://images.pexels.com/photos/2280545/pexels-photo-2280545.jpeg", "This is what I ate for breakfast #yum #hashtag")
  end

  it 'exists' do
    expect(@photo).to be_a(Photo)
  end

  it 'can display with no comments' do
    expected =
    "--------------------------------------------------\n" \
    "PHOTO\n" \
    "URL: https://images.pexels.com/photos/2280545/pexels-photo-2280545.jpeg\n" \
    "Caption: This is what I ate for breakfast #yum #hashtag\n" \
    "--------------------------------------------------"
    expect(@photo.display).to eq(expected)
  end

  it 'can add comments' do
    expect(@photo.comments).to eq({})

    @photo.add_comment("That looks delicious!")
    @photo.add_comment("Ooooh, will you cook for me?")
    @photo.add_comment("Brunch next Sunday?")

    expected = {
      1 => "That looks delicious!",
      2 => "Ooooh, will you cook for me?",
      3 => "Brunch next Sunday?"
    }
    expect(@photo.comments).to eq(expected)
  end

  it 'can remove comments' do
    @photo.add_comment("That looks delicious!")
    @photo.add_comment("Ooooh, will you cook for me?")
    @photo.add_comment("Brunch next Sunday?")

    @photo.remove_comment(2)
    expected = {
      1 => "That looks delicious!",
      3 => "Brunch next Sunday?"
    }
    expect(@photo.comments).to eq(expected)
  end

  it 'can display with comments' do
    @photo.add_comment("That looks delicious!")
    @photo.add_comment("Ooooh, will you cook for me?")
    @photo.add_comment("Brunch next Sunday?")

    expected =
    "--------------------------------------------------\n" \
    "PHOTO\n" \
    "URL: https://images.pexels.com/photos/2280545/pexels-photo-2280545.jpeg\n" \
    "Caption: This is what I ate for breakfast #yum #hashtag\n" \
    "1: That looks delicious!\n" \
    "2: Ooooh, will you cook for me?\n" \
    "3: Brunch next Sunday?\n" \
    "--------------------------------------------------"
    expect(@photo.display).to eq(expected)
  end

  it 'can count the total number of comments' do
    @photo.add_comment("That looks delicious!")
    @photo.add_comment("Ooooh, will you cook for me?")
    @photo.add_comment("Brunch next Sunday?")

    expect(@photo.total_comments).to eq(3)
  end
end
