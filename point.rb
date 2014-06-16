module Graphics
  Point = Struct.new(:x, :y) do
    def inspect
      "#{x}:#{y}"
    end
  end

  module Conversions
    module_function

    def Point(*args)
      case args.first
      when Point then args.first
      when Array then Point.new(*args.first)
      when Integer then Point.new(*args)
      when String then Point.new(*args.first.split(':').map(&:to_i))
      else
        raise TypeError, "Cannot convert #{args.inspect} to Point"
      end
    end
  end
end

include Graphics
include Graphics::Conversions

describe "Point" do
  it "works with points" do
    expect(Point(Point.new(2,3)).inspect).to eq "2:3"
  end

  it "works with arrays" do
    expect(Point([5,3]).inspect).to eq "5:3"
  end

  it "works with integers" do
    expect(Point(8,2).inspect).to eq "8:2"
  end

  it "works with strings" do
    expect(Point('1:4').inspect).to eq "1:4"
  end
end
