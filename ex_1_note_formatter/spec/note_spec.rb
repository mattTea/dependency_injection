require "note_formatter"

describe Note do
  describe "#display" do
    it "returns a formatted note" do
      formatter_double = double :formatter, format: "Anything\nI want in here"
      note = Note.new("Some Title", "Some note body", formatter_double)
      expect(note.display).to eq "Anything\nI want in here"
    end
  end
end
