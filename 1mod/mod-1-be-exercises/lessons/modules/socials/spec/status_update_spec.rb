require './lib/status_update'

RSpec.describe StatusUpdate do
  before :each do
    @status = StatusUpdate.new("I'm learning about modules in Ruby #nbd")
  end

  it 'exists' do
    expect(@status).to be_a(StatusUpdate)
  end

  it 'can display with no comments' do
    expected =
    "--------------------------------------------------\n" \
    "STATUS UPDATE\n" \
    "Body: I'm learning about modules in Ruby #nbd\n" \
    "--------------------------------------------------"
    expect(@status.display).to eq(expected)
  end

  it 'can add comments' do
    expect(@status.comments).to eq({})

    @status.add_comment("Oh cool!")
    @status.add_comment("Just wait until you learn about inheritance.")
    @status.add_comment("What is a module?")
    @status.add_comment("I'm so proud of you! Love, mom.")

    expected = {
      1 => "Oh cool!",
      2 => "Just wait until you learn about inheritance.",
      3 => "What is a module?",
      4 => "I'm so proud of you! Love, mom."
    }
    expect(@status.comments).to eq(expected)
  end

  it 'can remove comments' do
    @status.add_comment("Oh cool!")
    @status.add_comment("Just wait until you learn about inheritance.")
    @status.add_comment("What is a module?")
    @status.add_comment("I'm so proud of you! Love, mom.")

    @status.remove_comment(3)
    expected = {
      1 => "Oh cool!",
      2 => "Just wait until you learn about inheritance.",
      4 => "I'm so proud of you! Love, mom."
    }
    expect(@status.comments).to eq(expected)
  end

  it 'can display with comments' do
    @status.add_comment("Oh cool!")
    @status.add_comment("Just wait until you learn about inheritance.")
    @status.add_comment("What is a module?")
    @status.add_comment("I'm so proud of you! Love, mom.")

    expected =
    "--------------------------------------------------\n" \
    "STATUS UPDATE\n" \
    "Body: I'm learning about modules in Ruby #nbd\n" \
    "1: Oh cool!\n" \
    "2: Just wait until you learn about inheritance.\n" \
    "3: What is a module?\n" \
    "4: I'm so proud of you! Love, mom.\n" \
    "--------------------------------------------------"
    expect(@status.display).to eq(expected)
  end

  it 'can count the total number of comments' do
    @status.add_comment("Oh cool!")
    @status.add_comment("Just wait until you learn about inheritance.")
    @status.add_comment("What is a module?")
    @status.add_comment("I'm so proud of you! Love, mom.")

    expect(@status.total_comments).to eq(4)
  end
end
