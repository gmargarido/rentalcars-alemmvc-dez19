class CarModelPresenter < SimpleDelegator
  def initialize(car_model)
    super(car_model)
  end

  def car_options
    h.content_tag(:ul) do
      __getobj__.car_options.each do |item|
        h.concat(h.content_tag(:li, item))
      end
    end
  end

  def h
    ApplicationController.helpers
  end
end
