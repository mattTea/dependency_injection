require "note_formatter"

describe NoteFormatter do
  describe "#format" do
    it "prints a formatted note" do
      note_double = double :note
      allow(note_double).to receive(:title).and_return("Note Title")
      allow(note_double).to receive(:body).and_return("Note body")
      expect(subject.format(note_double)).to eq "Title: Note Title\nNote body"
    end
  end
end

# https://relishapp.com/rspec/rspec-mocks/v/2-99/docs/method-stubs
# allow(obj).to receive(:message).and_return(:value)
# :message above can be :title and :body from code as they are attr_reader 'methods'
