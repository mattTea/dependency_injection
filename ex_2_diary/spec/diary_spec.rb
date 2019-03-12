require "diary_entry"

describe Diary do
  describe "#add" do
    it "adds an entry into diary" do
      entry_double = double :entry
      # allow(entry_double).to receive(:title).and_return("Entry title")
      # allow(entry_double).to receive(:body).and_return("Entry body")

      expect(subject.add(entry_double)).to eq ["Entry title", "Entry body"]
    end
  end
end