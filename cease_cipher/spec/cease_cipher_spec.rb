require'cease_cipher'

   
    describe '#caesar' do
      it 'returns the correct input with no shift factor' do
        expect(caesar('world', 0)).to eql('world')
      end
    
      it 'returns the correct input with a small shift factor' do
        expect(caesar('world', 1)).to eql('xpsme')
      end
    
      it "doesn't shift punctuation or spaces" do
        expect(caesar('hello! ...world?', 3)).to eql('khoor! ...zruog?')
      end
    
      it 'retains case' do
        expect(caesar('HELLO WorlD', 3)).to eql('KHOOR ZruoG')
      end
    
      it 'handles a large shift factor' do
        expect(caesar('Yum, this pasta is delicious!', 5000)).to eql('Gcu, bpqa xiabi qa lmtqkqwca!')
      end
    
      it 'can shift backwards' do
        expect(caesar('Yum, this pasta is delicious!', -5000)).to eql('Qme, lzak hskls ak vwdauagmk!')
      end
  end

