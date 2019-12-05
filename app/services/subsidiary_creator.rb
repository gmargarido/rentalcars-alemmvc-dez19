class SubsidiaryCreator
  attr_reader :subsidiary_params
  def initialize(subsidiary_params)
    @subsidiary_params = subsidiary_params
  end

  def create
    subsidiary = Subsidiary.new(subsidiary_params)
    ActiveRecord::Base.transaction do
      subsidiary.save!
      categories = Category.all
      categories.each do |category|
        RentalPrice.create!(category: category, subsidiary: subsidiary,
                           daily_rate: category.daily_rate,
                           daily_car_insurance: category.car_insurance,
                           daily_third_party_insurance: category.third_party_insurance)
      end
      subsidiary
    end
  rescue ActiveRecord::RecordInvalid
    return subsidiary
  end
end
