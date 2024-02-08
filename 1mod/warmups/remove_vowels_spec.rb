require 'rspec'
require './remove_vowels'

RSpec.describe 'remove_vowels' do
  it 'removes all vowels from a sentence' do
    expect(remove_vowels('The epidemiological evidence provides compelling support for the hypothesis emerging from etiological studies.')).to eq('Th pdmlgcl vdnc prvds cmpllng spprt fr th hypthss mrgng frm tlgcl stds.')
  end
end
