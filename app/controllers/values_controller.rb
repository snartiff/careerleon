class ValuesController < ApplicationController
  def index
    @values = ["Variety and change at work", "Be an expert", "Help others",
      "Compete with others", "Opportunities to express creativity"]
  end
end
