class ValuesController < ApplicationController
  def index
    @values = ["Variety and change", "Be an expert", "Help others",
      "Compete with others", "Express creativity", "Be challenged",
    "Be recognized", "Be wealthy", "Flexible schedule", "Vacation time" ]
  end
end
