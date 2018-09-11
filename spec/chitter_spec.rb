require 'chitter.rb'

describe Chitter do
  let(:subject) {described_class.new}
  describe '#get_posts' do
    it 'should return an array' do
      expect(subject.get_posts).to include({
        "body"=>"my first peep :)",
        "created_at"=>"2018-07-29T18:39:32.607Z",
        "id"=>26,
        "likes"=>[],
        "updated_at"=>"2018-07-29T18:39:32.607Z",
        "user"=>{"handle"=>"tes", "id"=>18}})
    end
  end
end
